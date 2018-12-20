package com.rent.system.action;

import com.rent.common.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by lgl on 2017/1/18.
 */
@Controller
@RequestMapping("/platform/api/doc")
public class PlatformApiDocAction extends BaseController {
    /**
     * api doc index
     *
     * @return
     */
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request) {
        return new ModelAndView("/swagger/index");
    }
}
