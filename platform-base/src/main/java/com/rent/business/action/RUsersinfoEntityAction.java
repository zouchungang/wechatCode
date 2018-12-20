package com.rent.business.action;

import com.google.common.collect.Maps;
import com.rent.business.entity.RUsersEntity;
import com.rent.business.entity.RUsersinfoEntity;
import com.rent.business.service.RUsersEntityService;
import com.rent.business.service.RUsersinfoEntityService;
import com.rent.business.vo.RUsersinfoEntityVo;
import com.rent.common.BaseController;
import com.rent.common.UpdateTool;
import com.rent.common.annotation.SystemLog;
import com.rent.common.annotation.TokenSubmit;
import com.rent.common.util.FileUtils;
import com.rent.common.util.PropertiesUtils;
import org.apache.struts.upload.FormFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
* --controller
*
**/
@Controller
@RequestMapping(value = "/bussiness/rUsersinfoEntity")
public class RUsersinfoEntityAction extends BaseController {
    private static Logger logger = LoggerFactory.getLogger(RUsersinfoEntityAction.class);
    @Autowired
    private RUsersinfoEntityService rUsersinfoEntityService;
    @Autowired
    private RUsersEntityService rUsersEntityService;

    /**
    * @param request
    * @return
    */
    @RequestMapping(value = "/index")
    @SystemLog(description = "首页", modelName = "")
    public String index(HttpServletRequest request) {
        return "business/usersinfo/index";
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
    public List<RUsersinfoEntity> list(HttpServletRequest request) {
        List<RUsersinfoEntity> list = rUsersinfoEntityService.getAll();
        return list;
    }

    /**
    * 有查询条件，无分页，无排序
    *
    * @param request
    * @param rUsersinfoEntityVo
    * @return
    */
    @RequestMapping(value = "/listByParameter")
    @ResponseBody
    @SystemLog(description = "列表，有查询条件，带分页，无排序", modelName = "")
    public List<RUsersinfoEntity> list(HttpServletRequest request,RUsersinfoEntityVo rUsersinfoEntityVo) {
        List<RUsersinfoEntity> list = rUsersinfoEntityService.find(rUsersinfoEntityVo, null,null,null);
        return list;
    }

    /**
    * 有查询条件，带分页，无排序
    *
    * @param rUsersinfoEntityVo
    * @param offset
    * @param limit
    * @return
    */
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(description = "列表，有查询条件，带分页，无排序", modelName = "")
    public Map<String,Object> pagerList(RUsersinfoEntityVo rUsersinfoEntityVo, @RequestParam int offset, @RequestParam int limit) {
        PageRequest pagerequest = new PageRequest(offset / limit, limit);
        long total = rUsersinfoEntityService.count(rUsersinfoEntityVo);
        List<RUsersinfoEntity> list = rUsersinfoEntityService.find(rUsersinfoEntityVo,pagerequest,null,null);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("total", total);
        map.put("rows", list);
        return map;
    }

    /**
    * 有查询条件，带分页，排序
    *
    * @param request
    * @param rUsersinfoEntityVo
    * @param offset
    * @param limit
    * @param sort
    * @param order
    * @return
    */
    @RequestMapping(value = "/pageSort", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(description = "列表，有查询条件，带分页，排序", modelName = "")
    public Map<String,Object> pagerSortList(HttpServletRequest request,RUsersinfoEntityVo rUsersinfoEntityVo, @RequestParam int offset, @RequestParam int limit,@RequestParam String sort,@RequestParam String order) {
        PageRequest pagerequest = new PageRequest(offset / limit, limit);
        long total = rUsersinfoEntityService.count(rUsersinfoEntityVo);
        List<RUsersinfoEntity> list = rUsersinfoEntityService.find(rUsersinfoEntityVo,pagerequest,sort,order);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("total", total);
        map.put("rows", list);
        return map;
    }

    /**
    * 添加
    *
    * @param rUsersinfoEntity
    * @return
    */
    @RequestMapping(method=RequestMethod.POST)
    @ResponseBody
    @SystemLog(description = "--添加", modelName = "")
    @TokenSubmit(remove = true)
    public String create(RUsersinfoEntity rUsersinfoEntity){
        rUsersinfoEntityService.create(rUsersinfoEntity);
        return messageSource.getMessage("ac.success",null,null);
    }

    /**
    * 更新
    *
    * @param rUsersinfoEntity
    * @return
    */
    @RequestMapping(value="/editUserInfo", method=RequestMethod.POST)
    @ResponseBody
    @SystemLog(description = "--更新", modelName = "")
    public Map update(RUsersinfoEntity rUsersinfoEntity){
        Map<String,String> ret= Maps.newHashMap();
        try {
            rUsersinfoEntityService.update(rUsersinfoEntity);
            ret.put("code","200");
            ret.put("msg",messageSource.getMessage("ac.uSuccess",null,null));
        } catch (Exception e) {
            e.printStackTrace();
            ret.put("code","1001");
            ret.put("msg",messageSource.getMessage("ac.error",null,null));
        }
        return ret;
    }

    /**
     * 更新
     *
     * @param rUsersEntity
     * @return
     */
    @RequestMapping(value="/addUsersinfo", method=RequestMethod.POST)
    @ResponseBody
    @SystemLog(description = "--更新", modelName = "")
    public Map addUsersinfo(RUsersEntity rUsersEntity){
        Map<String,String> ret= Maps.newHashMap();
        try {
            if(rUsersEntity!=null&&rUsersEntity.getId() !=null){
                RUsersEntity source= rUsersEntityService.findById(rUsersEntity.getId());
                UpdateTool.copyNullProperties(source, rUsersEntity);
            }
            rUsersEntityService.update(rUsersEntity);
            ret.put("code","200");
            ret.put("msg",messageSource.getMessage("ac.uSuccess",null,null));
        } catch (Exception e) {
            e.printStackTrace();
            ret.put("code","1001");
            ret.put("msg",messageSource.getMessage("ac.error",null,null));
        }
        return ret;
    }

    /**
     * 上传用户图片
     *
     * @return
     */
    @SuppressWarnings("finally")
    @RequestMapping(value = "/userimg",method=RequestMethod.POST)
    @ResponseBody
    @SystemLog(description = "上传用户图片", modelName = "")
    public String uploadPhoto(HttpServletRequest request, HttpServletResponse response, MultipartFile file) {
        String result = "";
        if (file.getSize() > 0) {
            try {
                // String realPath = request.getSession().getServletContext().getRealPath("");
                PropertiesUtils propertiesUtils = new PropertiesUtils();
                String path = request.getServletContext().getRealPath(
                        "/uploadIMG");
//                String realPath = propertiesUtils.getConfig("", "commonFrontFiles");
                result = FileUtils.uploadFile(file, "front", path);
            } catch (Exception e) {
                logger.error("上传企业logo失败:" + e.getMessage());
            }
        }
        return result;
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
    public RUsersinfoEntity view(@PathVariable String id){
        RUsersinfoEntity rUsersinfoEntity = rUsersinfoEntityService.findById(id);
        return rUsersinfoEntity;
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
        rUsersinfoEntityService.delete(id);
        return messageSource.getMessage("ac.dSuccess",null,null);
    }

}
