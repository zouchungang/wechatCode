package com.rent.baseinfo.action;

import com.rent.baseinfo.entity.PayMode;
import com.rent.baseinfo.service.PayModeService;
import com.rent.common.BaseController;
import com.rent.common.Constants;
import com.rent.common.annotation.SystemLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 支付方式管理模块
 *
 * @author lgl
 */
@Controller
@RequestMapping("/platform/baseinfo/paymode")
public class PaymodeAction extends BaseController {
    @Autowired
    private PayModeService payModeService;

    /**
     * 转向到支付管理主页面
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request) {
        Map<String, String> map = new HashMap<String, String>();
        return new ModelAndView("/baseinfo/paymode_index", map);
    }

    /**
     * 综合条件查询
     *
     * @param payMode 条件数据
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(description = "支付方式管理--获取支付方式", modelName = "支付方式管理")
    public Map<String, Object> list(HttpServletRequest request,
                                    PayMode payMode, @RequestParam int offset, @RequestParam int limit) {
        PageRequest pagerequest = new PageRequest(offset / limit, limit);// 分页
        String ssysemployeecode = (String) sessionManager.getSessionValue(
                request, Constants.PLATFORMEMPLOYEECODE);// 从session中获取登录用户信息
        String ssyscompanyid = (String) sessionManager.getSessionValue(request,
                Constants.PLATFORMID);// 从session中获取登录用户所属运营企业信息
        List<PayMode> list = new ArrayList<PayMode>();
        long total = 0;
        if (ssysemployeecode != null && ssyscompanyid != null) {
            list = payModeService.find(payMode, pagerequest);// 条件查询
            total = payModeService.count(payMode);// 总共数量
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("rows", list);
        map.put("total", total);
        return map;
    }

    /**
     * 添加支付方式
     *
     * @param payMode
     * @return
     */
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    @SystemLog(description = "支付方式管理--添加支付方式", modelName = "支付方式管理")
    public String add(HttpServletRequest request, PayMode payMode) {
        String ssysemployeecode = (String) sessionManager.getSessionValue(
                request,  Constants.PLATFORMEMPLOYEECODE);// 从session中获取登录用户信息
        String ssyscompanyid = (String) sessionManager.getSessionValue(request,
                Constants.PLATFORMID);// 从session中获取登录用户所属运营企业信息
        if (ssysemployeecode != null && ssyscompanyid != null) {
            payModeService.create(payMode);
        }
        return messageSource.getMessage("ac.success", null, null);
    }

    /**
     * 修改支付方式
     *
     * @param id
     * @param payMode
     */
    @RequestMapping(value = "updateUse/{id}", method = RequestMethod.PUT)
    @ResponseBody
    @SystemLog(description = "支付方式管理--修改支付方式", modelName = "支付方式管理")
    public String update(HttpServletRequest request,
                         @PathVariable String id, PayMode payMode) {
        String ssysemployeecode = (String) sessionManager.getSessionValue(
                request,  Constants.PLATFORMEMPLOYEECODE);// 从session中获取登录用户信息
        String ssyscompanyid = (String) sessionManager.getSessionValue(request,
                Constants.PLATFORMID);// 从session中获取登录用户所属运营企业信息
        if (ssysemployeecode != null && ssyscompanyid != null) {
            payModeService.update(payMode);
        }
        return messageSource.getMessage("ac.uSuccess", null, null);
    }

    /**
     * 禁用/启用支付方式
     *
     * @param id
     */
    @RequestMapping(value = "logicupdate/{id}", method = RequestMethod.PUT)
    @ResponseBody
    @SystemLog(description = "支付方式管理--禁用/启用支付方式", modelName = "支付方式管理")
    public String logicupdate(Boolean useflag, @PathVariable String id) {
        PayMode payMode = payModeService.findById(id);
        payMode.setUseFlag(useflag);
        payModeService.update(payMode);
        return messageSource.getMessage("ac.uSuccess", null, null);
    }


    /**
     * 用于下拉菜单
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "findAll", method = RequestMethod.GET)
    public List<PayMode> findAll() {
        List<PayMode> list = payModeService.findALL();
        return list;
    }
}
