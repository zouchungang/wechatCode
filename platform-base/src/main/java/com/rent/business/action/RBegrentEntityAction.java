package com.rent.business.action;

import com.rent.business.entity.RBegrentEntity;
import com.rent.business.service.RBegrentEntityService;
import com.rent.business.vo.RBegrentEntityVo;
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
@RequestMapping(value = "/bussiness/rBegrentEntity")
public class RBegrentEntityAction extends BaseController {
    private static Logger logger = LoggerFactory.getLogger(RBegrentEntityAction.class);
    @Autowired
    private RBegrentEntityService rBegrentEntityService;

    /**
    * @param request
    * @return
    */
    @RequestMapping(value = "/index")
    @SystemLog(description = "首页", modelName = "")
    public String index(HttpServletRequest request) {
        return "business/begrent/index";
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
    public List<RBegrentEntity> list(HttpServletRequest request) {
        List<RBegrentEntity> list = rBegrentEntityService.getAll();
        return list;
    }

    /**
    * 有查询条件，无分页，无排序
    *
    * @param request
    * @param rBegrentEntityVo
    * @return
    */
    @RequestMapping(value = "/listByParameter")
    @ResponseBody
    @SystemLog(description = "列表，有查询条件，带分页，无排序", modelName = "")
    public List<RBegrentEntity> list(HttpServletRequest request,RBegrentEntityVo rBegrentEntityVo) {
        List<RBegrentEntity> list = rBegrentEntityService.find(rBegrentEntityVo, null,null,null);
        return list;
    }

    /**
    * 有查询条件，带分页，无排序
    *
    * @param rBegrentEntityVo
    * @param offset
    * @param limit
    * @return
    */
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(description = "列表，有查询条件，带分页，无排序", modelName = "")
    public Map<String,Object> pagerList(RBegrentEntityVo rBegrentEntityVo, @RequestParam int offset, @RequestParam int limit) {
        PageRequest pagerequest = new PageRequest(offset / limit, limit);
        long total = rBegrentEntityService.count(rBegrentEntityVo);
        List<RBegrentEntity> list = rBegrentEntityService.find(rBegrentEntityVo,pagerequest,null,null);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("total", total);
        map.put("rows", list);
        return map;
    }

    /**
    * 有查询条件，带分页，排序
    *
    * @param request
    * @param rBegrentEntityVo
    * @param offset
    * @param limit
    * @param sort
    * @param order
    * @return
    */
    @RequestMapping(value = "/pageSort", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(description = "列表，有查询条件，带分页，排序", modelName = "")
    public Map<String,Object> pagerSortList(HttpServletRequest request,RBegrentEntityVo rBegrentEntityVo, @RequestParam int offset, @RequestParam int limit,@RequestParam String sort,@RequestParam String order) {
        PageRequest pagerequest = new PageRequest(offset / limit, limit);
        long total = rBegrentEntityService.count(rBegrentEntityVo);
        List<RBegrentEntity> list = rBegrentEntityService.find(rBegrentEntityVo,pagerequest,sort,order);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("total", total);
        map.put("rows", list);
        return map;
    }

    /**
    * 添加
    *
    * @param rBegrentEntity
    * @return
    */
    @RequestMapping(method=RequestMethod.POST)
    @ResponseBody
    @SystemLog(description = "--添加", modelName = "")
    @TokenSubmit(remove = true)
    public String create(RBegrentEntity rBegrentEntity){
        rBegrentEntityService.create(rBegrentEntity);
        return messageSource.getMessage("ac.success",null,null);
    }

    /**
    * 更新
    *
    * @param rBegrentEntity
    * @param id
    * @return
    */
    @RequestMapping(value="/{id}", method=RequestMethod.PUT)
    @ResponseBody
    @SystemLog(description = "--更新", modelName = "")
    public String update(RBegrentEntity rBegrentEntity, @PathVariable String id){
        rBegrentEntityService.update(rBegrentEntity);
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
    public RBegrentEntity view(@PathVariable String id){
        RBegrentEntity rBegrentEntity = rBegrentEntityService.findById(id);
        return rBegrentEntity;
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
        rBegrentEntityService.delete(id);
        return messageSource.getMessage("ac.dSuccess",null,null);
    }

}
