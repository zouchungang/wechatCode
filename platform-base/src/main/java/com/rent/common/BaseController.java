package com.rent.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.support.WebBindingInitializer;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;

public class BaseController implements WebBindingInitializer {
    @Autowired
    protected MessageSource messageSource;
    @Autowired
    protected SessionManager sessionManager;
    @Autowired
    protected CommonService commonService;
    protected ModelAndView toindex = new ModelAndView("forward:/web/common");


    @InitBinder
    public void initBinder(WebDataBinder binder, WebRequest request) {

        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");

        dateFormat.setLenient(false);

        SimpleDateFormat datetimeFormat = new SimpleDateFormat(
                "MM/dd/yyyy HH:mm:ss");

        datetimeFormat.setLenient(false);

        binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(
                dateFormat, true));

        binder.registerCustomEditor(java.sql.Timestamp.class,
                new VECustomTimestampEditor(datetimeFormat, true));

    }

}
