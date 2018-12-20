package com.rent.system.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * 业务导向设置
 */
@Controller
@RequestMapping(value = "/platform/wizard")
public class PlatformWizardAction {

    @RequestMapping(value = "/index")
    public ModelAndView index(HttpServletRequest request) {
        return new ModelAndView("platform/wizard/index");
    }
}
