package com.rent.common.interceptor;

import com.rent.common.vo.ContextConfig;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by liu_gl on 2016/5/9.
 * 统一全局上线文
 */
public class BaseInterceptor implements HandlerInterceptor {
    @Resource
    private ContextConfig contextConfig;

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        request.setAttribute("ctx", contextConfig.getCtx()); // 每个页面，都设置一下基础路径
        request.setAttribute("staticCtx", contextConfig.getStaticCtx()); // 每个页面，都设置一下静态资源基础路径（公用js,css）
        request.setAttribute("staticCdnCtx", contextConfig.getStaticCdnCtx()); // 每个页面，都设置一下静态资源基础路径（cdn公用js,css）
        request.setAttribute("staticUpfileCtx", contextConfig.getStaticUpfileCtx()); // 单独配置一个ngnix解决上传文件的共享问题
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
