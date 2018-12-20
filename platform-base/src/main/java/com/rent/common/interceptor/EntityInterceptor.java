package com.rent.common.interceptor;

import com.rent.baseinfo.entity.BaseEntity;
import com.rent.common.util.DateUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

/**
 * 此类利用spring的aop,统一处理,数据更新的时候添加上更新时间。
 *
 * @author lgl
 */
@Aspect
@Component
public class EntityInterceptor {

    @Autowired
    HttpServletRequest request;

    @SuppressWarnings("unused")
    @Pointcut("(execution(* com.rent.*.dao.*.save(..)) )")
    private void sessionCut() {
    }

    @Before("sessionCut()")
    public void doSaveEntity(JoinPoint jp) {
        try {
            Object[] args = jp.getArgs();
            for (Object arg : args) {
                if (arg instanceof BaseEntity) {
                    ((BaseEntity) arg).setDataUpdateTime(DateUtils.getSystime());
                }
            }
        } catch (Exception e) {
        }
    }
}
