package com.rent.common.aspect;

import com.rent.common.annotation.SystemLog;
import com.rent.common.util.DateUtils;
import com.rent.common.util.HxIpUtil;
import com.rent.system.entity.PlatformSystemLog;
import com.rent.system.service.PlatformSystemLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;

/**
 * 切点类
 *
 * @author lgl
 * @version 1.0
 * @since 2015-07-22
 */
@Aspect
@Component
public class SystemLogAspect {
    private static final Logger logger = LoggerFactory
            .getLogger(SystemLogAspect.class);
    @Autowired
    HttpServletRequest request;
    @Autowired
    private PlatformSystemLogService platformSystemLogService;

    // Controller层切点
    @Pointcut("@annotation(com.rent.common.annotation.SystemLog)")
    public void controllerAspect() {
    }

    /**
     * 后置通知 用于记录用户的操作
     *
     * @param joinPoint 切点
     */
    @After("controllerAspect()")
    public void doAfter(JoinPoint joinPoint) {
        HttpSession session = request.getSession();
        String platformemployeecode = session.getAttribute("platformemployeecode") == null ? "" : (String) session.getAttribute("platformemployeecode");
        String companyemployeecode = session.getAttribute("companyemployeecode") == null ? "" : (String) session.getAttribute("companyemployeecode");
        String username = "";
        Integer userType = 1;//1平台用户，2，景区用户
        if (platformemployeecode != null && !"".equals(platformemployeecode)) {// 平台用户
            username = platformemployeecode;
        } else if (companyemployeecode != null && !"".equals(companyemployeecode)) {// 景区企业用户
            username = companyemployeecode;
            userType = 2;
        }
        String ip = HxIpUtil.getIpAddr(request);// 获取请求客户的ip
        try {
            logger.info("登陆名：" + username +
                    "#登陆人真实姓名：" + username +
                    "#请求IP：" + ip +
                    "#模块名称：" + getMethodModelname(joinPoint) +
                    "#操作描述：" + getMethodDescription(joinPoint));
            PlatformSystemLog platformSystemLog = new PlatformSystemLog();
            platformSystemLog.setIp(ip);//
            platformSystemLog.setEmployeeCode(username);//
            platformSystemLog.setMenuName(getMethodModelname(joinPoint));//
            platformSystemLog.setOperationName(getMethodDescription(joinPoint));//
            platformSystemLog.setOperationContent(getMethodDescription(joinPoint));
            platformSystemLog.setOperationTime(DateUtils.getSystime());//
            platformSystemLog.setUserType(userType);
            platformSystemLogService.create(platformSystemLog);
        } catch (Exception e) {
            // 记录本地异常日志
            e.printStackTrace();
            logger.error("记录日志发生异常:{}", e.getMessage());
        }
    }

    /**
     * 异常通知 用于拦截action层记录异常日志
     *
     * @param joinPoint
     * @param e
     */
    @AfterThrowing(pointcut = "controllerAspect()", throwing = "e")
    public void doAfterThrowingAction(JoinPoint joinPoint, Throwable e) {
        HttpSession session = request.getSession();
        String platformemployeecode = (String) session.getAttribute("platformemployeecode");
        String companyemployeecode = (String) session.getAttribute("companyemployeecode");
        String username = "";
        if (platformemployeecode != null) {// 平台用户
            username = platformemployeecode;
        } else if (companyemployeecode != null) {// 景区企业用户
            username = companyemployeecode;
        }
        String ip = HxIpUtil.getIpAddr(request);// 获取请求客户的ip
        try {
            logger.info("登陆名：" + username +
                    "#登陆人真实姓名：" + username +
                    "#请求IP：" + ip +
                    "#模块名称：" + getMethodModelname(joinPoint) +
                    "#操作描述：" + getMethodDescription(joinPoint));
        } catch (Exception ex) {
            logger.info("错误信息：" + ex.getMessage());
        }
    }

    /**
     * 获取注解中对方法的描述信息 用于Controller层注解
     *
     * @param joinPoint 切点
     * @return 方法属于什么模块
     * @throws Exception
     */
    private String getMethodModelname(JoinPoint joinPoint)
            throws Exception {
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();
        Class<?> targetClass = Class.forName(targetName);
        Method[] methods = targetClass.getMethods();
        String modelName = "";
        for (Method method : methods) {
            if (method.getName().equals(methodName)) {
                Class<?>[] clazzs = method.getParameterTypes();
                if (clazzs.length == arguments.length) {
                    modelName = method.getAnnotation(SystemLog.class)
                            .modelName();
                    break;
                }
            }
        }
        return modelName;
    }

    /**
     * 获取注解中对方法的描述信息
     *
     * @param joinPoint 切点
     * @return 方法描述信息
     * @throws Exception
     */
    private String getMethodDescription(JoinPoint joinPoint)
            throws Exception {
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();
        Class<?> targetClass = Class.forName(targetName);
        Method[] methods = targetClass.getMethods();
        String description = "";
        for (Method method : methods) {
            if (method.getName().equals(methodName)) {
                Class<?>[] clazzs = method.getParameterTypes();
                if (clazzs.length == arguments.length) {
                    description = method.getAnnotation(
                            SystemLog.class).description();
                    break;
                }
            }
        }
        return description;
    }
}
