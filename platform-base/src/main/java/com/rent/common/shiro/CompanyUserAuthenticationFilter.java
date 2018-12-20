/**
 * @date 2013-12-4 上午10:46:12
 * @Copyright: 2013
 */
package com.rent.common.shiro;

import com.rent.common.util.HttpCommonUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.UserFilter;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 验证会员是否登录
 *
 * @author wenbei
 * @version 1.0
 */
public class CompanyUserAuthenticationFilter extends UserFilter {
    private static Logger logger = LoggerFactory.getLogger(CompanyUserAuthenticationFilter.class);

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws IOException {
        if (!HttpCommonUtil.isAjax(request)) {//如果不是ajax请求就重新定向地址
            String loginUrl = this.getLoginUrl();
            WebUtils.issueRedirect(request, response, loginUrl);
        }
        return false;
    }

    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        logger.debug("访问路径=========" + req.getRequestURI());
        logger.debug("sessionId========" + req.getSession().getId());
        if (isLoginRequest(request, response)) {
            return true;
        } else if (HttpCommonUtil.isAjax(request)) {
            Subject subject = SecurityUtils.getSubject();
            // 验证是否有登陆用户
            if (subject.getPrincipal() != null && subject.isAuthenticated()) {
                //获取到session做相关的判断
                Session session = subject.getSession();
                String s = (String) session.getAttribute("companyemployeeid");//companyemployeeid为公司员工登录后的id
                if (s != null && !"".equals(s)) {
                    return true;
                } else {
                    Map<String, String> map = new HashMap<String, String>();
                    map.put("httpStatCode", "300");
                    HttpCommonUtil.out(res, map);
                    return false;
                }
            } else {
                Map<String, String> map = new HashMap<String, String>();
                map.put("httpStatCode", "300");
                HttpCommonUtil.out(res, map);
                return false;
            }
        } else {
            Subject subject = SecurityUtils.getSubject();
            // 验证是否有登陆用户
            if (subject.getPrincipal() != null && subject.isAuthenticated()) {
                //获取到session做相关的判断
                Session session = subject.getSession();
                String s = (String) session.getAttribute("companyemployeeid");//companyemployeeid为公司员工登录后的id
                if (s != null && !"".equals(s))
                    return true;
                return false;
            } else {
                return false;
            }
        }
    }
}
