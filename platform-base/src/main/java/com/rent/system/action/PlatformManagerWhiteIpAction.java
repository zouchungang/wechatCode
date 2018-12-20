//package com.rent.system.action;
//
//import com.rent.common.BaseController;
//import com.rent.common.annotation.SystemLog;
//import com.rent.common.annotation.TokenSubmit;
//import com.rent.company.system.entity.Company;
//import com.rent.company.system.entity.FsaleManagerUser;
//import com.rent.company.system.entity.WhiteIp;
//import com.rent.company.system.service.FsaleAuthSupplierService;
//import com.rent.company.system.service.FsaleManagerUserService;
//import com.rent.company.system.service.ResourcesDisService;
//import com.rent.company.system.service.WhiteIpService;
//import com.rent.company.system.vo.WhiteIpVo;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.PageRequest;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.servlet.http.HttpServletRequest;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
///**
// * 景区业务系统白名单 --controller
// **/
//@Controller
//@RequestMapping(value = "/platform/whiteip")
//public class PlatformManagerWhiteIpAction extends BaseController {
//    private static Logger logger = LoggerFactory.getLogger(PlatformManagerWhiteIpAction.class);
//    @Autowired
//    private WhiteIpService whiteIpService;
//    @Autowired
//    private FsaleManagerUserService fsaleManagerUserService;
//    @Autowired
//    private ResourcesDisService resourcesDisService;
//    @Autowired
//    private FsaleAuthSupplierService fsaleAuthSupplierService;
//
//    /**
//     * @param request
//     * @return
//     */
//    @RequestMapping(value = "/index")
//    public ModelAndView index(HttpServletRequest request) {
//        return new ModelAndView("platform/whiteip/index");
//    }
//
//    @RequestMapping(value = "/fsaleauthsupplier")
//    public ModelAndView fsaleAuthIndex(HttpServletRequest request, @RequestParam("id") String id) {
//        WhiteIp whiteIp = whiteIpService.findById(id);
//        Map<String, Object> map = new HashMap<String, Object>();
//        map.put("whiteIp", whiteIp);
//        return new ModelAndView("platform/whiteip/fsaleauthsupplier", map);
//    }
//
//
//    /**
//     * 无查询条件，无分页，无排序
//     *
//     * @param request
//     * @return
//     */
//    @RequestMapping(value = "/list")
//    @ResponseBody
//    public List<WhiteIp> list(HttpServletRequest request) {
//        List<WhiteIp> list = whiteIpService.getAll();
//        return list;
//    }
//
//    /**
//     * 有查询条件，无分页，无排序
//     *
//     * @param request
//     * @param whiteIpVo
//     * @return
//     */
//    @RequestMapping(value = "/listByParameter")
//    @ResponseBody
//    public List<WhiteIp> list(HttpServletRequest request, WhiteIpVo whiteIpVo) {
//        String companyId = (String) sessionManager.getSessionValue(request, "companyid");
//        Company company = new Company();
//        company.setId(companyId);
//        whiteIpVo.setCompany(company);
//        List<WhiteIp> list = whiteIpService.find(whiteIpVo, null, null, null);
//        return list;
//    }
//
//    /**
//     * 有查询条件，带分页，无排序
//     *
//     * @param whiteIpVo
//     * @param offset
//     * @param limit
//     * @return
//     */
//    @RequestMapping(value = "/page", method = RequestMethod.GET)
//    @ResponseBody
//    public Map<String, Object> pagerList(WhiteIpVo whiteIpVo, @RequestParam int offset, @RequestParam int limit) {
//        PageRequest pagerequest = new PageRequest(offset / limit, limit);
//        long total = whiteIpService.count(whiteIpVo);
//        List<WhiteIp> list = whiteIpService.find(whiteIpVo, pagerequest, null, null);
////        WhiteIp whiteIp = new WhiteIp();
//        FsaleManagerUser fsaleManagerUser;
//        int num = list.size();
//        for (int i = 0; i < num; i++) {
//            fsaleManagerUser = fsaleManagerUserService.findByWhiteId(list.get(i).getId());
//            if (fsaleManagerUser != null) {
//                list.get(i).setFsaleManagerName(fsaleManagerUser.getUserName());
//            } else {
//                list.get(i).setFsaleManagerName("无");
//            }
//        }
//        Map<String, Object> map = new HashMap<String, Object>();
//        map.put("total", total);
//        map.put("rows", list);
//        return map;
//    }
//
//    /**
//     * 有查询条件，带分页，排序
//     *
//     * @param request
//     * @param whiteIpVo
//     * @param offset
//     * @param limit
//     * @param sort
//     * @param order
//     * @return
//     */
//    @RequestMapping(value = "/pageSort", method = RequestMethod.GET)
//    @ResponseBody
//    public Map<String, Object> pagerSortList(HttpServletRequest request, WhiteIpVo whiteIpVo, @RequestParam int offset, @RequestParam int limit, @RequestParam String sort, @RequestParam String order) {
//        PageRequest pagerequest = new PageRequest(offset / limit, limit);
//        long total = whiteIpService.count(whiteIpVo);
//        List<WhiteIp> list = whiteIpService.find(whiteIpVo, pagerequest, sort, order);
//        Map<String, Object> map = new HashMap<String, Object>();
//        map.put("total", total);
//        map.put("rows", list);
//        return map;
//    }
//
//    /**
//     * 添加
//     *
//     * @param whiteIp
//     * @return
//     */
//    @RequestMapping(method = RequestMethod.POST)
//    @ResponseBody
//    @SystemLog(description = "景区业务系统服务--添加", modelName = "景区业务系统服务")
//    @TokenSubmit(remove = true)
//    public String create(WhiteIp whiteIp, @RequestParam("userName") String username, @RequestParam("pwd") String pwd) {
//        whiteIpService.create(whiteIp, username, pwd);
//        return messageSource.getMessage("ac.success", null, null);
//    }
//
//    /**
//     * 更新
//     *
//     * @param whiteIp
//     * @param id
//     * @return
//     */
//    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
//    @ResponseBody
//    @SystemLog(description = "景区业务系统服务--更新", modelName = "景区业务系统服务")
//    public String update(WhiteIp whiteIp, @PathVariable String id, @RequestParam("userName") String username) {
//        whiteIpService.update(whiteIp,username);
//        return messageSource.getMessage("ac.uSuccess", null, null);
//    }
//
//    /**
//     * 根据id获取唯一记录
//     *
//     * @param id
//     * @return
//     */
//    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
//    @ResponseBody
//    @SystemLog(description = "景区业务系统服务--根据id获取唯一记录", modelName = "景区业务系统服务")
//    public WhiteIp view(@PathVariable String id) {
//        WhiteIp whiteIp = whiteIpService.findById(id);
//        return whiteIp;
//    }
//
//    /**
//     * 根据id删除一条记录
//     *
//     * @param id
//     * @return
//     */
//    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
//    @ResponseBody
//    @SystemLog(description = "景区业务系统服务--根据id删除一条记录", modelName = "景区业务系统服务")
//    public String delete(@PathVariable String id) {
//        if (resourcesDisService.findCountBywhiteId(id) > 0) {
//            return "该业务在门票资源分配中被使用，无法删除";
//        }
//        if (fsaleAuthSupplierService.findCountFsaleAuthSupplierByWhiteId(id) > 0) {
//            return "该业务在分销系统供应商授权中被使用，无法删除";
//        }
//        WhiteIp whiteIp =whiteIpService.findById(id);
//        if ("2".equals(whiteIp.getDict().getParamValue())) { //分销平台业务系统关联账号表 删除时要一起删除
//            FsaleManagerUser fsaleManagerUser = fsaleManagerUserService.findByWhiteId(whiteIp.getId());
//            if(fsaleManagerUser!=null){
//                fsaleManagerUserService.delete(fsaleManagerUser.getId());
//            }
//        }
//        whiteIpService.delete(id);
//        return messageSource.getMessage("ac.dSuccess", null, null);
//    }
//
//    /**
//     * 验证IP地址是否存在
//     * 根据景区，系统类型，确定ip地址唯一
//     *
//     * @param companyId
//     * @param ip
//     * @param dictId
//     * @param id
//     * @return
//     */
//    @RequestMapping(value = "/remoteIp")
//    @ResponseBody
//    public Boolean remoteIp(@RequestParam("companyId") String companyId, @RequestParam("ip") String ip, @RequestParam("dictId") String dictId, @RequestParam("id") String id) {
//        if (id != null && id.length() > 0) {
//            WhiteIp whiteIp = whiteIpService.findById(id);
//            if (whiteIp != null) {
//                if (whiteIp.getIp().equals(ip)) {
//                    return true;
//                }
//            }
//        }
//        return whiteIpService.remoteIp(companyId, ip, dictId);
//    }
//
//    /**
//     * 验证业务系统代码是否全局唯一
//     *
//     * @param id
//     * @param systemNum
//     * @return
//     */
//
//    @RequestMapping("/remoteSystemNum")
//    @ResponseBody
//    public Boolean remoteSystemNum(@RequestParam String id, @RequestParam String systemNum) {
//        if (id != null && id.length() > 0) {
//            WhiteIp whiteIp = whiteIpService.findById(id);
//            if (whiteIp != null && whiteIp.getSystemNum().equals(systemNum)) {
//                return true;
//            }
//        }
//        return whiteIpService.remoteSystemNum(systemNum);
//    }
//}
