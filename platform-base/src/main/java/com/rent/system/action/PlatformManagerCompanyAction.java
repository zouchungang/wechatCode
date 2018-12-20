//package com.rent.system.action;
//
//import com.rent.common.BaseController;
//import com.rent.common.Constants;
//import com.rent.common.annotation.SystemLog;
//import com.rent.common.annotation.TokenSubmit;
//import com.rent.common.util.HxTools;
//import com.rent.common.util.StrUtils;
//import com.rent.company.bussiness.entity.Scenic;
//import com.rent.company.bussiness.service.ChannelService;
//import com.rent.company.bussiness.service.ScenicService;
//import com.rent.company.system.entity.Company;
//import com.rent.company.system.entity.CompanyDept;
//import com.rent.company.system.entity.CompanyLinkGroup;
//import com.rent.company.system.entity.WhiteIp;
//import com.rent.company.system.service.CompanyDeptService;
//import com.rent.company.system.service.CompanyLinkGroupService;
//import com.rent.company.system.service.CompanyService;
//import com.rent.company.system.service.WhiteIpService;
//import org.apache.commons.codec.digest.DigestUtils;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.PageRequest;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.*;
//
//import javax.servlet.http.HttpServletRequest;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//@Controller
//@RequestMapping(value = "/platform/managercompany")
//public class PlatformManagerCompanyAction extends BaseController {
//
//    @Autowired
//    private CompanyService companyService;
//    @Autowired
//    private WhiteIpService whiteIpService;
//    @Autowired
//    private CompanyLinkGroupService companyLinkGroupService;
//    @Autowired
//    private ScenicService scenicService;
//    @Autowired
//    private CompanyDeptService companyDeptService;
//    @Autowired
//    private ChannelService channelService;
//
//    /**
//     * 查询所有数据
//     *
//     * @param request
//     * @return
//     */
//    @RequestMapping(value = "/list")
//    @ResponseBody
//    public List<Company> list(HttpServletRequest request) {
//        List<Company> list = companyService.getAll();
//        return list;
//    }
//
//    /**
//     * 根据条件查询出需要的数据，没有分页，没有排序
//     *
//     * @param request
//     * @param company
//     * @return
//     */
//    @RequestMapping(value = "/listByParameter")
//    @ResponseBody
//    public List<Company> list(HttpServletRequest request, Company company) {
//        List<Company> list = companyService.find(company, null, null, null);
//        return list;
//    }
//
//    /**
//     * 有查询条件，带分页，无排序
//     **/
//    @RequestMapping(value = "/page", method = RequestMethod.GET)
//    @ResponseBody
//    public Map<String, Object> pagerList(HttpServletRequest request, Company company, @RequestParam int offset, @RequestParam int limit) {
//        PageRequest pageRequest = new PageRequest(offset / limit, limit);
//        List<Company> list = companyService.find(company, pageRequest, null, null);
//        long total = companyService.count(company);
//        Map<String, Object> map = new HashMap<String, Object>();
//        map.put("total", total);
//        map.put("rows", list);
//        return map;
//    }
//
//    /**
//     * 有查询条件，带分页，排序
//     **/
//    @RequestMapping(value = "/pageSort", method = RequestMethod.GET)
//    @ResponseBody
//    public Map<String, Object> pagerSortList(HttpServletRequest request, Company company, @RequestParam int offset, @RequestParam int limit, @RequestParam String sort, @RequestParam String order) {
//        PageRequest pagerequest = new PageRequest(offset / limit, limit);
//        long total = companyService.count(company);
//        List<Company> list = companyService.find(company, pagerequest, sort, order);
//        Map<String, Object> map = new HashMap<String, Object>();
//        map.put("total", total);
//        map.put("rows", list);
//        return map;
//    }
//
//    /**
//     * 添加
//     **/
//    @RequestMapping(method = RequestMethod.POST)
//    @ResponseBody
//    @TokenSubmit(remove = true)
//    @SystemLog(description = "景区管理--添加景区和初始化超级管理员", modelName = "景区管理")
//    public String create(HttpServletRequest request, Company company) {
//        //判断景区手机号码唯一
//        if(!companyService.validateMobile(company.getMobile(),  null)){
//            return "该手机号码已存在，请重新添加";
//        }
//        String msg = "";
//        String appid = company.getAppId();
//        String code = company.getCompanyCode();
//        String time = company.getDataCreateTime();
//        company.setAppKey(HxTools.generateKey(appid, code, time));
//        company.setPwd(DigestUtils.md5Hex(Constants.INIT_PWD));
//        Boolean b = companyService.createCompany(company);
//        if (b) {
//            msg = "添加成功！";
//        } else {
//            msg = "景区代码重复，添加失败！";
//        }
//        return msg;
//    }
//
//    /**
//     * 更新
//     **/
//    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
//    @ResponseBody
//    @SystemLog(description = "景区管理--更新景区", modelName = "景区管理")
//    public String update(HttpServletRequest request, Company company, @PathVariable String id) {
//        //判断景区手机号码唯一
//        if(!companyService.validateMobile(company.getMobile(),  company.getId())){
//            return "该手机号码已存在，请重新修改";
//        }
//        companyService.updateCompany(company);
//        return messageSource.getMessage("ac.uSuccess", null, null);
//    }
//
//    @RequestMapping(value = "checkcode")
//    @ResponseBody
//    public boolean checkcode(HttpServletRequest request,
//                             @RequestParam(value = "suppliercode") String supplierCode) {
//        long c = companyService.validCode(supplierCode);
//        if (c == 0) {
//            return true;
//        }
//        return false;
//    }
//
//    /*
//     * 验证appid唯一性
//     */
//    @RequestMapping(value = "checkappid")
//    @ResponseBody
//    public boolean checkappid(HttpServletRequest request,
//                              @RequestParam(value = "appid") String appid) {
//        long c = companyService.validAppid(appid);
//        if (c == 0) {
//            return true;
//        }
//        return false;
//    }
//
//    /**
//     * 根据id获取唯一记录
//     **/
//    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
//    @ResponseBody
//    @SystemLog(description = "景区管理--根据id获取唯一记录", modelName = "景区管理")
//    public Company view(@PathVariable String id) {
//        Company company = companyService.findById(id);
//        return company;
//    }
//
//    /**
//     * 根据id删除一条记录
//     **/
//    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
//    @ResponseBody
//    @SystemLog(description = "景区管理--根据id删除一条记录", modelName = "景区管理")
//    public String delete(@PathVariable String id) {
//        String msg = "";
//        List<CompanyLinkGroup> linkGroups = companyLinkGroupService.findGroup(id);
//        List<WhiteIp> whiteIps = whiteIpService.findCompanyId(id);
//        List<Scenic> scenics = scenicService.listByCompany(id);
//        List<CompanyDept> company = companyDeptService.findCompany(id);
//        if (whiteIps.size() == 0 && linkGroups.size() == 0 && scenics.size() == 0 && company.size() == 0) {
//            companyService.delete(id);
//        } else if (linkGroups.size() == 0 && scenics.size() == 0 && company.size() == 0) {
//            msg = "该景区在白名单中被引用，无法删除";
//        } else if (scenics.size() == 0 && company.size() == 0) {
//            msg = "该景区在权限分组中被引用，无法删除";
//        } else if (company.size() == 0) {
//            msg = "该景区在景点中被引用，无法删除";
//        } else {
//            msg = "该景区在部门中被引用，无法删除";
//        }
//        return msg;
//    }
//
//    /**
//     * 启用/禁用
//     **/
//    @RequestMapping(value = "/use/{id}", method = RequestMethod.PUT)
//    @ResponseBody
//    @SystemLog(description = "景区管理--启用/禁用", modelName = "景区管理")
//    public String updateUse(Boolean useflag, @PathVariable String id) {
//        Company company = companyService.findById(id);
//        company.setUseFlag(useflag);
//        companyService.update(company);
//        if (useflag) {
//            return messageSource.getMessage("ac.userfalgTrue", null, null);
//        } else {
//            return messageSource.getMessage("ac.userfalgFalse", null, null);
//        }
//    }
//
//
//    /**
//     * 重置景区超级管理员密码
//     *
//     * @param request
//     * @param id
//     * @return
//     */
//    @RequestMapping(value = "/initCompanyManagerPwd", method = RequestMethod.PUT)
//    @ResponseBody
//    @SystemLog(description = "景区管理--重置景区密码", modelName = "景区管理")
//    public String initCompanyManagerPwd(HttpServletRequest request, String id) {
//        Company company = companyService.findById(id);
//        company.setPwd(DigestUtils.md5Hex(Constants.INIT_PWD));
//        companyService.resetManagerPwd(company);
//        return messageSource.getMessage("ac.uDeleteflagTrue", null, null);
//    }
//
//    /***
//     * 创建appkey
//     * @param request
//     * @param company
//     * @return
//     */
//    @RequestMapping(value = "/createAppKey", method = RequestMethod.POST)
//    @ResponseBody
//    @SystemLog(description = "景区管理--生成appkey", modelName = "景区管理")
//    public String createAppKey(HttpServletRequest request, Company company) {
//        company = companyService.findById(company.getId());
//        String appId = company.getAppId();
//        String startTime = companyService.findStartTime(company.getId());
//        String companyCode = company.getCompanyCode();
//        String appKey = HxTools.generateKey(companyCode, appId, startTime);
//        company.setAppKey(appKey);
//        companyService.update(company);
//        return messageSource.getMessage("ac.uSuccess", null, null);
//    }
//
//    /**
//     * 判断appkey是否存在
//     *
//     * @param request
//     * @param company
//     * @return
//     */
//    @RequestMapping(value = "/findAppKey", method = RequestMethod.POST)
//    @ResponseBody
//    public int findAppKey(HttpServletRequest request, Company company) {
//        String appkey = companyService.findAppKey(company.getId());
//        if ("".equals(appkey) || appkey == null) {
//            return 1;
//        } else {
//            return 0;
//        }
//    }
//
//    /**
//     * 随机生成appid 和companyCode
//     *
//     * @param request
//     * @param company
//     * @return
//     */
//    @RequestMapping(value = "/randomCode")
//    @ResponseBody
//    @SystemLog(description = "景区管理--生成appid，companycode", modelName = "景区管理")
//    public Company randomCode(HttpServletRequest request, Company company) {
//        String random = StrUtils.generateNumberCode(Constants.INIT_CODELENGTH);
//        String code = Constants.COMPANY_PREFIX;
//        if ((companyService.findAppId(code + random)) == null && (companyService.findCompanyCode(code + random)) == null) {
//            company.setCompanyCode(code + random);
//            company.setAppId(code + random);
//            return company;
//        } else {
//            randomCode(request, company);
//        }
//        return null;
//    }
//
//    /**
//     * 获取景区现有的通道数量
//     * @param request
//     * @param companyId
//     * @return
//     */
//    @RequestMapping(value = "/getChannelNum", method = RequestMethod.POST)
//    @ResponseBody
//    public int getChannelNum(HttpServletRequest request, String  companyId) {
//        return channelService.getChannelNum(companyId);
//    }
//
//    /**
//     *  验证景区手机号全局唯一
//     *
//     * @param mobile
//     * @param id
//     * @return
//     */
//    @RequestMapping(value = "/validateMobile")
//    @ResponseBody
//    public Boolean validateMobile(String mobile, String  id) {
//        if(mobile==null||"".equals(mobile)){
//            return false;
//        }
//        return companyService.validateMobile(mobile,   id);
//    }
//}
