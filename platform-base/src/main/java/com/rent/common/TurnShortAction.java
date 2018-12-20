package com.rent.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 此action主要是为了缩短首页访问地址
 */
@Controller
public class TurnShortAction {
    /**
     * 平台登录页面
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "pIndex")
    public String platformIndex(HttpServletRequest request) {
        return "platform/index";

    }

    /**
     * 公司（景区）管理登录页面
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "cIndex")
    public String companyIndex(HttpServletRequest request) {
        return "company/index";

    }
}
