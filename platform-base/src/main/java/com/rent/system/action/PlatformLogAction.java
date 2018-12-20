package com.rent.system.action;

import com.rent.common.BaseController;
import com.rent.common.annotation.SystemLog;
import com.rent.system.entity.PlatformSystemLog;
import com.rent.system.service.PlatformSystemLogService;
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
 * 平台日志action
 *
 * @author lgl
 */
@Controller
@RequestMapping("/platform/log")
public class PlatformLogAction extends BaseController {
    @Autowired
    private PlatformSystemLogService platformSystemLogService;

    /**
     * 转向到系统日志记录主页面
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request) {
        return new ModelAndView("/platform/loger/index");
    }

    /**
     * 根据查询条件显示分页数据
     *
     * @param platformSystemLog
     * @param offset
     * @param limit
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> list(PlatformSystemLog platformSystemLog, @RequestParam int offset, @RequestParam int limit, @RequestParam String sort, @RequestParam String order) {
        PageRequest pagerequest = new PageRequest(offset / limit, limit);
        List<PlatformSystemLog> list ;
        if(order.equals("asc")){
            list = platformSystemLogService.findAllPagerAsc(pagerequest);
        }else{
            list = platformSystemLogService.findAllPagerDesc(pagerequest);
        }
        long total = platformSystemLogService.count();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", total);
        map.put("rows", list);
        return map;
    }

    /**
     * 根据ID删除系统日志
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    @SystemLog(description = "平台日志--根据id删除日志",modelName = "平台日志")
    public String delete(@PathVariable String id) {
        platformSystemLogService.deleteById(id);
        return messageSource.getMessage("ac.dSuccess", null, null);
    }


    /**
     * 根据参数删除某时间段之前的数据
     *
     * @param type  1：半年之前 2：三个月之前 3：一个月之前 4：全部
     * @return
     */
    @RequestMapping(value = "delete", method = RequestMethod.DELETE)
    @ResponseBody
    @SystemLog(description = "平台日志--删除日志",modelName = "平台日志")
    public String delete(Integer type) {
        platformSystemLogService.deleteBeforeTime(type);//根据参数删除某时间段之前的数据
        return messageSource.getMessage("ac.dSuccess", null, null);
    }
}
