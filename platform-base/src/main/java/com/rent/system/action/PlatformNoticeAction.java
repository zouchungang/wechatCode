package com.rent.system.action;

import com.rent.common.BaseController;
import com.rent.common.annotation.SystemLog;
import com.rent.common.annotation.TokenSubmit;
import com.rent.system.entity.PlatformNotice;
import com.rent.system.service.PlatformNoticeService;
import com.rent.system.vo.PlatformNoticeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 平台通知管理
 *
 * @author lgl
 */
@Controller
@RequestMapping("/platform/notice")
public class PlatformNoticeAction extends BaseController {
    @Autowired
    private PlatformNoticeService platformNoticeService;

    /**
     * 转向到natice主页面
     *
     * @return
     */
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request) {
        return new ModelAndView("/platform/notice/index");
    }


    /**
     * viewList
     *
     * @return
     */
    @RequestMapping(value = "viewList", method = RequestMethod.GET)
    public ModelAndView viewList(HttpServletRequest request) {
        return new ModelAndView("/platform/notice/viewList");
    }

    /**
     * info
     *
     * @return
     */
    @RequestMapping(value = "info", method = RequestMethod.GET)
    public ModelAndView info(HttpServletRequest request, String id) {
        ModelAndView mav = new ModelAndView("/platform/notice/info");
        PlatformNotice notice = platformNoticeService.findById(id);
        mav.addObject("notice", notice);
        return mav;
    }

    /**
     * 根据查询条件显示分页数据
     *
     * @param platformNoticeVo
     * @param offset
     * @param limit
     * @return
     */
    @RequestMapping(value = "pageSort", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> list(PlatformNoticeVo platformNoticeVo, @RequestParam int offset, @RequestParam int limit, @RequestParam String sort, @RequestParam String order) {
        PageRequest pagerequest = new PageRequest(offset / limit, limit);
        List<PlatformNotice> list = platformNoticeService.find(platformNoticeVo, pagerequest, sort, order);
        long total = platformNoticeService.count(platformNoticeVo);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", total);
        map.put("rows", list);
        return map;
    }

    /**
     * 添加公告
     *
     * @param platformNotice
     * @return
     */
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    @SystemLog(description = "系统公告--添加公告", modelName = "系统公告")
    @TokenSubmit(remove = true)
    public String create(PlatformNotice platformNotice) {
        platformNoticeService.create(platformNotice);
        return messageSource.getMessage("ac.success", null, null);
    }

    /**
     * 更新公告
     *
     * @param platformNotice
     * @return
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    @ResponseBody
    @SystemLog(description = "系统公告--更新公告", modelName = "系统公告")
    public String update(@PathVariable String id, PlatformNotice platformNotice) {
        platformNoticeService.update(platformNotice);
        return messageSource.getMessage("ac.uSuccess", null, null);
    }

    /**
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public PlatformNotice getById(@PathVariable String id) {
        return platformNoticeService.findById(id);
    }

    /**
     * 根据ID删除公告
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    @SystemLog(description = "系统公告--删除公告", modelName = "系统公告")
    public String delete(@PathVariable String id) {
        platformNoticeService.deleteById(id);
        return messageSource.getMessage("ac.dSuccess", null, null);
    }

    /**
     * 根据ID删除公告
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    @SystemLog(description = "系统公告--删除公告", modelName = "系统公告")
    public String deleteById(@PathVariable String id) {
        platformNoticeService.deleteById(id);
        return messageSource.getMessage("ac.dSuccess", null, null);
    }
}
