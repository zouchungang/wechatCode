package com.rent.common.aspect;

import com.rent.common.Exception.RequestLimitException;
import com.rent.common.annotation.RequestLimit;
import com.rent.common.util.HxIpUtil;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.concurrent.TimeUnit;

/**
 * aop注解方式，限制某个方法在一段时间内调用的次数
 */
@Aspect
@Component
public class RequestLimitContract {
    private static final Logger logger = LoggerFactory.getLogger(RequestLimitContract.class);
    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    @Pointcut("@annotation(com.rent.common.annotation.RequestLimit)")
    public void controllerAspect() {
    }

    @Before("controllerAspect()")
    public void requestLimit(final JoinPoint joinPoint) throws RequestLimitException {
        try {
            Object[] args = joinPoint.getArgs();
            HttpServletRequest request = null;
            for (int i = 0; i < args.length; i++) {
                if (args[i] instanceof HttpServletRequest) {
                    request = (HttpServletRequest) args[i];
                    break;
                }
            }
            if (request == null) {
                logger.info("方法中缺失HttpServletRequest参数");
                throw new RequestLimitException("方法中缺失HttpServletRequest参数");
            }
            String ip = HxIpUtil.getIpAddr(request);
            String url = request.getRequestURL().toString();
            String key = "req_limit_".concat(url).concat(ip);
            long count = redisTemplate.opsForValue().increment(key, 1);
            if (count == 1) {
                redisTemplate.expire(key, getTime(joinPoint), TimeUnit.MILLISECONDS);
            }
            if (count > getCount(joinPoint)) {
                logger.info("用户IP[" + ip + "]访问地址[" + url + "]超过了限定的次数[" + getCount(joinPoint) + "]");
                throw new RequestLimitException();
            }
        } catch (RequestLimitException re) {
            throw re;
        } catch (Exception e) {
            logger.info(e.getMessage());
        }
    }

    /**
     * @param joinPoint
     * @param e
     */
    @AfterThrowing(pointcut = "controllerAspect()", throwing = "e")
    public void doAfterThrowingAction(JoinPoint joinPoint, Throwable e) {
        logger.info(e.getMessage());
    }

    /**
     * 获取限定数量
     *
     * @param joinPoint
     * @return
     * @throws Exception
     */
    private int getCount(JoinPoint joinPoint)
            throws Exception {
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();
        Class<?> targetClass = Class.forName(targetName);
        Method[] methods = targetClass.getMethods();
        int count = Integer.MAX_VALUE;
        for (Method method : methods) {
            if (method.getName().equals(methodName)) {
                Class<?>[] clazzs = method.getParameterTypes();
                if (clazzs.length == arguments.length) {
                    count = method.getAnnotation(RequestLimit.class)
                            .count();
                    break;
                }
            }
        }
        return count;
    }

    /**
     * 获取限定时间
     *
     * @param joinPoint
     * @return
     * @throws Exception
     */
    private long getTime(JoinPoint joinPoint)
            throws Exception {
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();
        Class<?> targetClass = Class.forName(targetName);
        Method[] methods = targetClass.getMethods();
        long time = 60000;
        for (Method method : methods) {
            if (method.getName().equals(methodName)) {
                Class<?>[] clazzs = method.getParameterTypes();
                if (clazzs.length == arguments.length) {
                    time = method.getAnnotation(
                            RequestLimit.class).time();
                    break;
                }
            }
        }
        return time;
    }
}
