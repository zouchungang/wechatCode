package com.rent.document.action;

import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/help")
public class HelpAction {
    /**
     * 运营企业登录页面
     *
     * @param request
     * @return
     */
    @RequestMapping("/before/index")
    public String before(HttpServletRequest request) {
        return "/help/before/index";
    }

    /**
     * 运营企业登录页面
     *
     * @param request
     * @return
     */
    @RequestMapping("/after/index")
    public String after(HttpServletRequest request) {
        return "/help/after/index";
    }

    /**
     * @param request
     * @return
     */
    @RequestMapping("/{id}")
    public String detail(HttpServletRequest request, @PathVariable("id") String id) {
        return "/help/" + id;
    }
}
