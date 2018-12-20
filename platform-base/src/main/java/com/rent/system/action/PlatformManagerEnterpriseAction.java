//package com.rent.system.action;
//
//import com.rent.authority.entity.BussinessMenu;
//import com.rent.common.BaseController;
//import com.rent.common.annotation.SystemLog;
//import com.rent.common.annotation.TokenSubmit;
//import com.rent.company.system.entity.Company;
//import com.rent.company.system.entity.Enterprise;
//import com.rent.company.system.service.CompanyService;
//import com.rent.company.system.service.EnterpriseService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.*;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
///**
// * Created by liu_gl on 2016/11/18.
// */
//@Controller
//@RequestMapping("/platform/enterprise")
//public class PlatformManagerEnterpriseAction extends BaseController {
//    @Autowired
//    private EnterpriseService enterpriseService;
//    @Autowired
//    private CompanyService companyService;
//
//
//    @RequestMapping("index")
//    public String index(HttpServletRequest request) {
//        return "platform/enterprise/index";
//    }
//
//    /**
//     * 添加企业
//     *
//     * @param enterprise
//     * @return
//     */
//    @RequestMapping(value = "/add", method = RequestMethod.POST)
//    @ResponseBody
//    @TokenSubmit(remove = true)
//    @SystemLog(description = "企业管理--创建企业", modelName = "企业管理")
//    public String create(Enterprise enterprise) {
//        if (!enterpriseService.remoteName(enterprise.getId(), enterprise.getName().trim())) {
//            return "名称重复，添加失败";
//        }
//        enterprise.setName(enterprise.getName().trim());
//        enterpriseService.create(enterprise);
//        return "添加成功";
//
//    }
//
//    /**
//     * 所有企业列表
//     *
//     * @param request
//     * @param enterprise
//     * @return
//     */
//    @RequestMapping(value = "/list", method = RequestMethod.GET)
//    @ResponseBody
//    @SystemLog(description = "企业管理--显示所有企业", modelName = "企业管理")
//    public List<Enterprise> list(HttpServletRequest request, Enterprise enterprise) {
//        List<Enterprise> list = enterpriseService.find(enterprise, null, null);
//        return list;
//    }
//
//    /**
//     * 更新企业信息
//     *
//     * @param request
//     * @param enterprise
//     * @param id
//     * @return
//     */
//    @RequestMapping(value = "update/{id}", method = RequestMethod.POST)
//    @ResponseBody
//    @SystemLog(description = "企业管理--修改企业信息", modelName = "企业管理")
//    public String update(HttpServletRequest request, Enterprise enterprise, @PathVariable String id) {
//        if (!enterpriseService.remoteName(enterprise.getId(), enterprise.getName().trim())) {
//            return "名称重复，添加失败";
//        }
//        enterpriseService.update(enterprise);
//        return "更新成功";
//    }
//
//    /**
//     * 删除企业
//     *
//     * @param request
//     * @param id
//     * @return
//     */
//    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
//    @ResponseBody
//    @SystemLog(description = "企业管理--删除企业", modelName = "企业管理")
//    public int delete(HttpServletRequest request, @PathVariable String id) {
//        List<Company> company = companyService.findByEnterprise(id);
//        if (company.size() == 0) {
//            enterpriseService.delete(id);
//            return 1;
//        } else {
//            return 0;
//        }
//    }
//
//    /**
//     * 根据id查询企业信息
//     *
//     * @param request
//     * @param id
//     * @return
//     */
//    @RequestMapping(value = "find/{id}", method = RequestMethod.POST)
//    @ResponseBody
//    @SystemLog(description = "企业管理--获取要修改的企业信息", modelName = "企业管理")
//    public Enterprise findById(HttpServletRequest request, @PathVariable String id) {
//        Enterprise enterprise = enterpriseService.findById(id);
//        return enterprise;
//    }
//
//    /**
//     * 根据id查询景区
//     *
//     * @param request
//     * @param id
//     * @return
//     */
//    @RequestMapping("findCompany/{id}")
//    @ResponseBody
//    public List<Company> findCompany(HttpServletRequest request, @PathVariable String id) {
//        List<Company> list = companyService.findByEnterprise(id);
//        return list;
//    }
//
//    /**
//     * 验证名称是否重复
//     *
//     * @param request
//     * @param name
//     * @param id
//     * @return
//     */
//    @RequestMapping(value = "/findName", method = RequestMethod.GET)
//    @ResponseBody
//    @SystemLog(description = "企业管理--验证企业名称是否唯一", modelName = "企业管理")
//    public boolean findCompany(HttpServletRequest request, @RequestParam(value = "name") String name, @RequestParam(value = "id") String id) {
//        return enterpriseService.remoteName(id, name);
//    }
//
//    @RequestMapping(value = "/serchMenu", method = RequestMethod.GET)
//    @ResponseBody
//    @SystemLog(description = "企业管理--查看企业所有权限", modelName = "企业管理")
//    public Map<String, Object> serchMenu(HttpServletRequest request, @RequestParam String companyid) {
//        Map<String, Object> objectMap = new HashMap<String, Object>();
//        if (companyid != null && !"".equals(companyid)) {
//            for (int i = 1; i < 7; i++) {
//                List<BussinessMenu> bmList  = companyService.serchMenu(companyid, i);
//                objectMap.put("menuRows" + i, bmList);
//            }
//        }
//        return objectMap;
//    }
//
//    @RequestMapping("/companyInfoTxt")
//    public void download(String companyId, HttpServletRequest request, HttpServletResponse response) {
//        companyService.companyInfoTxt(companyId, response);
//    }
//}
