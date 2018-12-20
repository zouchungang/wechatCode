package com.rent.common;

import com.rent.common.annotation.TokenSubmit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("/common")
public class CommonAction extends BaseController {
    @Autowired
    private LimitRequestNumberService limitRequestNumberService;

    /**
     * 此方法主要是处理session过去的时候，用户在操作相关的资源的时候，提示需要重新登录。
     *
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping
    public String noSessionToIndex(HttpServletRequest request,
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
        return null;
    }

    /**
     * 获取token公共方法
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/tokenSession")
    @TokenSubmit(save = true)
    @ResponseBody
    public String tokenSession(HttpServletRequest request) {
        String token = "";
        boolean b = limitRequestNumberService.limitRequest(request, 30000, 500);
        if (b) {//超过限定次数
            token = "您的请求过于频繁，请等候30秒后重试";
        } else {
            token = (String) request.getSession().getAttribute("token");
        }
        return token;
    }
}
