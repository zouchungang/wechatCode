//package com.rent.system.action;
//
//import com.rent.authority.entity.AuthorityGroup;
//import com.rent.authority.service.AuthorityGroupService;
//import com.rent.common.BaseController;
//import com.rent.common.annotation.SystemLog;
//import com.rent.common.annotation.TokenSubmit;
//import com.rent.company.system.entity.Company;
//import com.rent.company.system.entity.CompanyLinkGroup;
//import com.rent.company.system.entity.Enterprise;
//import com.rent.company.system.service.CompanyLinkGroupService;
//import com.rent.company.system.service.CompanyService;
//import com.rent.company.system.service.EnterpriseService;
//import com.rent.company.system.vo.CompanyLinkGroupVo;
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
// * Created by Administrator on 2016/11/18 0018.
// * 景区权限组
// */
//@Controller
//@RequestMapping("/platform/companyGroup")
//public class PlatformAuthorityGroupAction extends BaseController {
//    @Autowired
//    private AuthorityGroupService authorityGroupService;
//    @Autowired
//    private CompanyLinkGroupService companyLinkGroupService;
//    @Autowired
//    private CompanyService companyService;
//    @Autowired
//    private EnterpriseService enterpriseService;
//    /**
//     * @param request
//     * @return
//     */
//    @RequestMapping(value = "index", method = RequestMethod.GET)
//    public ModelAndView index(HttpServletRequest request) {
//        return new ModelAndView("platform/authoritygroup/index");
//    }
//
//
//    /**
//     * 有查询条件，有分页，有排序
//     *
//     * @param offset
//     * @param limit
//     * @param sort
//     * @param order
//     * @return
//     */
//    @RequestMapping(value = "/listBySort")
//    @ResponseBody
//    public Map<String, Object> listBySort(HttpServletRequest request, AuthorityGroup authorityGroup, @RequestParam int offset, @RequestParam int limit, @RequestParam String sort, @RequestParam String order) {
//        PageRequest pagerequest = new PageRequest(offset / limit, limit);
//        List<AuthorityGroup> list =  authorityGroupService.find(authorityGroup, pagerequest, sort, order);
//        long total = total = authorityGroupService.count();
//        Map<String, Object> map = new HashMap<String, Object>();
//        map.put("total", total);
//        map.put("rows", list);
//        return map;
//    }
//
//    /**
//     * @param request
//     * @param authorityGroup
//     * @param offset
//     * @param limit
//     * @param sort
//     * @param order
//     * @return
//     */
//    @RequestMapping(value = "/list")
//    @ResponseBody
//    public Map<String, Object> list(HttpServletRequest request, AuthorityGroup authorityGroup, @RequestParam int offset, @RequestParam int limit, @RequestParam String sort, @RequestParam String order) {
//        String companyName = request.getParameter("companyName");
//        PageRequest pagerequest = new PageRequest(offset / limit, limit);
//        List<AuthorityGroup> list = authorityGroupService.find(companyName, authorityGroup, pagerequest, sort, order);
//        long total = total = authorityGroupService.count();
//        Map<String, Object> map = new HashMap<String, Object>();
//        map.put("total", total);
//        map.put("rows", list);
//        return map;
//    }
//
//    @RequestMapping(value = "/canUse")
//    @ResponseBody
//    public List<AuthorityGroup> listAll(HttpServletRequest request) {
//        List<AuthorityGroup> list = authorityGroupService.findCanUse();
//        return list;
//    }
//
//    /**
//     * 添加
//     *
//     * @param authorityGroup
//     * @return
//     */
//    @RequestMapping(method = RequestMethod.POST)
//    @ResponseBody
//    @TokenSubmit(remove = true)
//    @SystemLog(description = "企业分组--添加企业分组", modelName = "企业分组")
//    public String create(AuthorityGroup authorityGroup) {
//        authorityGroupService.creat(authorityGroup);
//        return messageSource.getMessage("ac.success", null, null);
//    }
//
//    /**
//     * 更新
//     *
//     * @param authorityGroup
//     * @param id
//     * @return
//     */
//    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
//    @ResponseBody
//    @SystemLog(description = "企业分组--更新企业分组", modelName = "企业分组")
//    public String update(AuthorityGroup authorityGroup, @PathVariable String id) {
//        boolean t = authorityGroupService.update(authorityGroup);
//        if (t) {
//            return messageSource.getMessage("ac.uSuccess", null, null);
//        }
//        return "该分组正在使用不可禁用！";
//    }
//
//    /**
//     * 根据id删除
//     *
//     * @param id
//     * @return
//     */
//    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
//    @ResponseBody
//    @SystemLog(description = "企业分组--企业分组根据id删除", modelName = "企业分组")
//    public String delete(@PathVariable String id) {
//        boolean t = authorityGroupService.deleteById(id);
//        if (t) {
//            return messageSource.getMessage("ac.dSuccess", null, null);
//        }
//        return "该分组正在使用不可删除！";
//    }
//
//    @RequestMapping(value = "remoteName")
//    @ResponseBody
//    @SystemLog(description = "企业分组--校验权限组名称", modelName = "企业分组")
//    public Boolean remoteName(HttpServletRequest request, @RequestParam(value = "name") String name, @RequestParam(value = "id") String id) {
//        if (id != null && id.length() > 0) {//有id代表是修改时候的验证，验证是否与老的一样
//            AuthorityGroup pd = authorityGroupService.findById(id);
//            if (pd != null && name != null && name.trim().equals(pd.getGroupName())) {
//                return true;
//            } else {
//                long c = authorityGroupService.findCountByName(name);
//                return c == 0;
//            }
//        } else {//没有id代表是新增时候的验证，验证是否可用
//            long c = authorityGroupService.findCountByName(name.trim());
//            return c == 0;
//        }
//    }
//
//    /**
//     * 获取所有可用企业rows1
//     * <p/>
//     * 获取分组已分配的企业CompanyRows
//     *
//     * @param company
//     * @param groupId
//     * @return
//     */
//    @RequestMapping(value = "listCompany", method = RequestMethod.GET)
//    @ResponseBody
//    public Map<String, Object> listCompany(Company company, @RequestParam String groupId) {
//
//        Enterprise enterprise = new Enterprise();
//        List<Enterprise> list1 = enterpriseService.find(enterprise, "dataSort", "desc");
//        company.setUseFlag(true);
//        List<Company> list2 = companyService.find(company, null, null, null);
//        Map<String, Object> map = new HashMap<String, Object>();
//        CompanyLinkGroupVo companyLinkGroup = new CompanyLinkGroupVo();
//        AuthorityGroup authorityGroup = new AuthorityGroup();
//        authorityGroup.setId(groupId);
//        companyLinkGroup.setAuthorityGroup(authorityGroup);
//        List<CompanyLinkGroup> list3 = companyLinkGroupService.find(companyLinkGroup, null, null, null);
//        map.put("rows1", list1);
//        map.put("rows2", list2);
//        map.put("companyRows", list3);
//        return map;
//    }
//
//    /**
//     * 通过企业id获取 已分配的权限组
//     *
//     * @param companyId
//     * @return
//     */
//    @RequestMapping(value = "listGroupByComp", method = RequestMethod.GET)
//    @ResponseBody
//    public List<CompanyLinkGroup> listGroupByComp(@RequestParam String companyId) {
//        List<CompanyLinkGroup> list = companyLinkGroupService.findByCompany(companyId);
//        return list;
//    }
//
//    /**
//     * 根据公司id获取分组id列表
//     *
//     * @param companyId
//     * @return
//     */
//    @RequestMapping(value = "groupIdByCompanyId", method = RequestMethod.GET)
//    @ResponseBody
//    public List<String> findGroupIdByCompanyId(@RequestParam String companyId) {
//        List<String> list = companyLinkGroupService.findGroupIdByCompanyId(companyId);
//        return list;
//    }
//
//    /**
//     * 保存权限组权限
//     *
//     * @param pathCompanys
//     * @param authorityGroupId
//     * @return
//     */
//    @RequestMapping(value = "updateAuthCompany", method = RequestMethod.PUT)
//    @ResponseBody
//    @SystemLog(description = "企业分组--保存权限组权限", modelName = "景区企业权限组")
//    public String updateAuthCompany(String pathCompanys, String authorityGroupId) {
//        companyLinkGroupService.updateAuthCompany(pathCompanys, authorityGroupId);
//        return messageSource.getMessage("ac.success", null, null);
//    }
//}
