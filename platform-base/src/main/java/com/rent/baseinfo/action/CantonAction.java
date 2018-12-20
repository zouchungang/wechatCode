package com.rent.baseinfo.action;

import com.rent.baseinfo.entity.Canton;
import com.rent.baseinfo.service.CantonService;
import com.rent.common.BaseController;
import com.rent.common.annotation.SystemLog;
import com.rent.common.util.StrUtils;
import com.rent.common.validation.ValidationResult;
import com.rent.common.validation.ValidationUtils;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * 地区管理模块
 *
 * @author lgl
 */
@Controller
@RequestMapping("/platform/baseinfo/canton")
public class CantonAction extends BaseController {
    @Autowired
    private CantonService cantonService;

    /**
     * 转向到地区管理主页面
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String index(HttpServletRequest request) {
        return "/baseinfo/canton_index";
    }

    /**
     * 异步加载地区树
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "detile", method = RequestMethod.POST)
    @ResponseBody
    public List<Map<String, Object>> convertTree(String id) {
        if (id == null || id.equalsIgnoreCase(""))
            id = "-1";// 我数据库中一级节点的parentid都是-1
        List<Canton> list = cantonService.findByPidisUse(id);
        return cantonService.convertListToTree(list);
    }

    @RequestMapping(value = "findAll", method = RequestMethod.GET)
    @ResponseBody
    public List<Canton> findALL() {
        return cantonService.findALL();
    }

    /**
     * 根据id获得名称
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public String view(@PathVariable String id) {
        Canton canton = cantonService.findById(id);
        return canton.getCantonName();
    }

//    /**
//     * 全部加载地区树
//     *
//     * @return
//     */
//    @RequestMapping(value = "alltree", method = RequestMethod.POST)
//    public String allTree(HttpServletRequest request,
//                          HttpServletResponse response) throws IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = response.getWriter();
//        List<Canton> list = cantonService.findALL();
//        String str = cantonService.alltree(list,
//                cantonService.findById("1"));
//        out.print(str);
//        out.flush();
//        out.close();
//        return null;
//    }

    /**
     * 添加地区信息
     *
     * @param canton
     * @return
     */
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    @SystemLog(description = "添加区域信息", modelName = "区域信息维护")
    public Map<String, Object> add(HttpServletRequest request, Canton canton) {
        canton.setShortCode(StrUtils.getPYIndexStr(canton.getCantonName(), 1));
        Map<String, Object> map = new HashedMap();
        ValidationResult vr = ValidationUtils.validateEntity(canton);
        String token = UUID.randomUUID().toString();
        if (vr.isHasErrors()) {
            map.put("code", "300");
            map.put("token", token);
            map.put("msg", vr.toString());
            sessionManager.setSessionValue(request, "token", token);
        } else {
            map.put("code", "200");
            cantonService.create(canton);
            map.put("msg", messageSource.getMessage("ac.success", null, null));
        }
        return map;
    }

    /**
     * 更新地区信息
     *
     * @param canton
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    @ResponseBody
    @SystemLog(description = "更新区域信息", modelName = "区域信息维护")
    public Map<String, Object> update(HttpServletRequest request,Canton canton, @PathVariable String id) {
        Map<String, Object> map = new HashedMap();
        canton.setShortCode(StrUtils.getPYIndexStr(canton.getCantonName(), 1));
        ValidationResult vr = ValidationUtils.validateEntity(canton);
        String token = UUID.randomUUID().toString();
        if (vr.isHasErrors()) {
            map.put("code", "300");
            map.put("token", token);
            map.put("msg", vr.toString());
            sessionManager.setSessionValue(request, "token", token);
        } else {
            map.put("code", "200");
            cantonService.update(canton);
            map.put("msg", messageSource.getMessage("ac.uSuccess", null, null));
        }
        return map;
    }

//    /**
//     * 更新区域状态，useFlag
//     *
//     * @param useflag
//     * @param id
//     * @return
//     */
//    @RequestMapping(value = "/use/{id}", method = RequestMethod.PUT)
//    @ResponseBody
//    @SystemLog(description = "更新区域状态", modelName = "区域信息维护")
//    public String updateUse(Boolean useflag, String cantons, @PathVariable String id) {
//        if (!"".equals(cantons)) {
//            String[] cantonids = cantons.split(",");
////            System.out.println(cantons);
//            String result = cantonService.updateUse(useflag, cantonids, id);
//            if ("1".equals(result)) {
//                return messageSource.getMessage("ac.uSuccess", null, null);
//            } else {
//                return result;
//            }
//        }
//        return messageSource.getMessage("ac.error", null, null);
//    }


    /**
     * 查询公司的所有景点及其关联的圆门
     **/

    @RequestMapping(value = "/cantonTree", method = RequestMethod.GET)
    @ResponseBody
    public List<Map> scenicAndGarden(HttpServletRequest request) {
//        List<Canton> retList = new ArrayList<Canton>();
        List<Canton> list = cantonService.findALL();
        Canton conton = cantonService.findById("1");
        Map<String, Object> scenicMap = new HashMap<String, Object>();
        scenicMap.put("id", conton.getId());
        scenicMap.put("name", conton.getCantonName());
        scenicMap.put("text", conton.getCantonName());
        scenicMap = cantonService.returntreeGrid(scenicMap, list);
        List<Map> result = new ArrayList<Map>();//用于返回
        result.add(scenicMap);
        return result;
    }

    /**
     * 排序查询所有地区，并封装成map
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/cantonTreeList", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, String>> cantonTreeList(HttpServletRequest request) {
        List<Map<String, String>> result = cantonService.cantonTreeList();
        return result;
    }


    /**
     * 父节点下的子节点，不包括孙子节点
     *
     * @param canton
     * @return
     */
    @RequestMapping(value = "listByPId", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> convertTreeGrid(Canton canton, @RequestParam int offset, @RequestParam int limit, @RequestParam String sort, @RequestParam String order) {
        PageRequest pagerequest = new PageRequest(offset / limit, limit);
        List<Canton> list = cantonService.find(canton, pagerequest, sort, order);
        long total = cantonService.count(canton);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", total);
        map.put("rows", list);
        return map;
    }

    /**
     * 验证编码可用
     *
     * @param code
     * @return
     */
    @RequestMapping(value = "remoteCode")
    @ResponseBody
    public boolean remoteCode(HttpServletRequest request, @RequestParam(value = "id") String id, @RequestParam(value = "code") String code, @RequestParam(value = "pid") String pid) {
        return cantonService.remoteCode(id, code, pid);
    }

    /**
     * 验证编码可用
     *
     * @param name
     * @return
     */
    @RequestMapping(value = "remoteName")
    @ResponseBody
    public boolean remoteName(HttpServletRequest request, @RequestParam(value = "id") String id, @RequestParam(value = "name") String name, @RequestParam(value = "pid") String pid) {
        return cantonService.remoteName(id, name, pid);
    }
}
