package com.rent.common.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * Created by lgl on 2016/12/27.
 */
public class HttpCommonUtil {
    private static Logger logger = LoggerFactory.getLogger(HttpCommonUtil.class);

    /**
     * 是否是Ajax请求
     *
     * @param request
     * @return
     */
    public static boolean isAjax(ServletRequest request) {
        String header = ((HttpServletRequest) request).getHeader("X-Requested-With");
        if ("XMLHttpRequest".equalsIgnoreCase(header)) {
            logger.debug("当前请求为Ajax请求");
            return Boolean.TRUE;
        }
        logger.debug("当前请求非Ajax请求");
        return Boolean.FALSE;
    }

    /**
     * 使用	response 输出JSON
     *
     * @param object
     */
    public static void out(ServletResponse response, Object object) {
        PrintWriter out = null;
        try {
            response.setCharacterEncoding("UTF-8");//设置编码
            response.setContentType("application/json");//设置返回类型
            out = response.getWriter();
            out.println(JsonUtils.toJacksonStr(object));//输出
        } catch (Exception e) {
            logger.info("输出JSON报错。");
        } finally {
            if (null != out) {
                out.flush();
                out.close();
            }
        }
    }

    public static void toindex(HttpServletRequest request,
                        HttpServletResponse response) {
        try {
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
        } catch (Exception e) {
            logger.info("输出JSON报错。");
        }
    }
}
