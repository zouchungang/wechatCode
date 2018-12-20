package com.rent.common.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 登录过滤
 *
 * @author liu_gl
 * @date 2012-4-18
 */
public class SecurityFilter implements Filter {
    // 不用做权限判断的URL
    private final static String[] eixt_url = {"login.jsp", "/com/rent/common", "/fore",
            "/include", "/tools","/druid"};

    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        // 解决iframe跨域丢失session
        res.setHeader("P3P", "CP=CAO PSA OUR");
        boolean haveFind = true;
        // 判断URL中包含.jsp和/web的都需要过滤
        if (req.getRequestURI().indexOf(".jsp") >= 0
                || req.getRequestURI().indexOf("/web") >= 0)
            haveFind = false;
        // 循环判断不需要过滤的资源
        for (int i = 0; i < eixt_url.length; i++) {
            if (req.getRequestURI().indexOf(eixt_url[i]) >= 0) {
                haveFind = true;
                break;
            }
        }
        /**
         * 需要过滤的资源和用户为空，同时满足转向到登录页面 这里使用script方式转向，为了防止Iframe嵌套问题。
         */
        if (!haveFind) {
            toindex(req, res);
            return;
        }
        chain.doFilter(req, res);
    }

    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public void destroy() {
    }

    private void toindex(HttpServletRequest request,
                         HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        StringBuffer strb = new StringBuffer();
        strb.append("<script type='text/javascript'>");
        strb.append("if(confirm('您也许没有操作此功能的权限或者你已经退出了系统,您可以点击确定从新登录系统尝试,点击取消继续其他操作!')){");
        strb.append("top.location.href='" + request.getContextPath() + "';");
        strb.append("}");
        strb.append("</script>");
        out.print(strb.toString());
        out.close();
    }
}
