package com.rent.business.action;

import com.rent.business.entity.RChooseroomEntity;
import com.rent.business.service.RChooseroomEntityService;
import com.rent.business.vo.RChooseroomEntityVo;
import com.rent.common.BaseController;
import com.rent.common.annotation.SystemLog;
import com.rent.common.annotation.TokenSubmit;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
* --controller
*
**/
@Controller
@RequestMapping(value = "/bussiness/rChooseroomEntity")
public class RChooseroomEntityAction extends BaseController {
    private static Logger logger = LoggerFactory.getLogger(RChooseroomEntityAction.class);
    @Autowired
    private RChooseroomEntityService rChooseroomEntityService;

    /**
    * @param request
    * @return
    */
    @RequestMapping(value = "/index")
    @SystemLog(description = "首页", modelName = "")
    public String index(HttpServletRequest request) {
        return "business/chooseroom/index";
    }

    /**
    * 无查询条件，无分页，无排序
    *
    * @param request
    * @return
    */
    @RequestMapping(value = "/list")
    @ResponseBody
    @SystemLog(description = "列表，无查询条件，无分页，无排序", modelName = "")
    public List<RChooseroomEntity> list(HttpServletRequest request) {
        List<RChooseroomEntity> list = rChooseroomEntityService.getAll();
        return list;
    }

    /**
    * 有查询条件，无分页，无排序
    *
    * @param request
    * @param rChooseroomEntityVo
    * @return
    */
    @RequestMapping(value = "/listByParameter")
    @ResponseBody
    @SystemLog(description = "列表，有查询条件，带分页，无排序", modelName = "")
    public List<RChooseroomEntity> list(HttpServletRequest request,RChooseroomEntityVo rChooseroomEntityVo) {
        List<RChooseroomEntity> list = rChooseroomEntityService.find(rChooseroomEntityVo, null,null,null);
        return list;
    }

    /**
    * 有查询条件，带分页，无排序
    *
    * @param rChooseroomEntityVo
    * @param offset
    * @param limit
    * @return
    */
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(description = "列表，有查询条件，带分页，无排序", modelName = "")
    public Map<String,Object> pagerList(RChooseroomEntityVo rChooseroomEntityVo, @RequestParam int offset, @RequestParam int limit) {
        PageRequest pagerequest = new PageRequest(offset / limit, limit);
        long total = rChooseroomEntityService.count(rChooseroomEntityVo);
        List<RChooseroomEntity> list = rChooseroomEntityService.find(rChooseroomEntityVo,pagerequest,null,null);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("total", total);
        map.put("rows", list);
        return map;
    }

    /**
    * 有查询条件，带分页，排序
    *
    * @param request
    * @param rChooseroomEntityVo
    * @param offset
    * @param limit
    * @param sort
    * @param order
    * @return
    */
    @RequestMapping(value = "/pageSort", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(description = "列表，有查询条件，带分页，排序", modelName = "")
    public Map<String,Object> pagerSortList(HttpServletRequest request,RChooseroomEntityVo rChooseroomEntityVo, @RequestParam int offset, @RequestParam int limit,@RequestParam String sort,@RequestParam String order) {
        PageRequest pagerequest = new PageRequest(offset / limit, limit);
        long total = rChooseroomEntityService.count(rChooseroomEntityVo);
        List<RChooseroomEntity> list = rChooseroomEntityService.find(rChooseroomEntityVo,pagerequest,sort,order);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("total", total);
        map.put("rows", list);
        return map;
    }

    /**
    * 添加
    *
    * @param rChooseroomEntity
    * @return
    */
    @RequestMapping(method=RequestMethod.POST)
    @ResponseBody
    @SystemLog(description = "--添加", modelName = "")
    @TokenSubmit(remove = true)
    public String create(RChooseroomEntity rChooseroomEntity){
        rChooseroomEntityService.create(rChooseroomEntity);
        return messageSource.getMessage("ac.success",null,null);
    }

    /**
    * 更新
    *
    * @param rChooseroomEntity
    * @param id
    * @return
    */
    @RequestMapping(value="/{id}", method=RequestMethod.PUT)
    @ResponseBody
    @SystemLog(description = "--更新", modelName = "")
    public String update(RChooseroomEntity rChooseroomEntity, @PathVariable String id){
        rChooseroomEntityService.update(rChooseroomEntity);
        return messageSource.getMessage("ac.uSuccess",null,null);
    }

    /**
    * 根据id获取唯一记录
    *
    * @param id
    * @return
    */
    @RequestMapping(value="/{id}", method=RequestMethod.GET)
    @ResponseBody
    @SystemLog(description = "--根据id获取唯一记录", modelName = "")
    public RChooseroomEntity view(@PathVariable String id){
        RChooseroomEntity rChooseroomEntity = rChooseroomEntityService.findById(id);
        return rChooseroomEntity;
    }

    /**
    * 根据id删除一条记录
    *
    * @param id
    * @return
    */
    @RequestMapping(value="/{id}", method=RequestMethod.DELETE)
    @ResponseBody
    @SystemLog(description = "--根据id删除一条记录", modelName = "")
    public String delete(@PathVariable String id){
        rChooseroomEntityService.delete(id);
        return messageSource.getMessage("ac.dSuccess",null,null);
    }

}
