package com.rent.system.action;

import com.rent.common.BaseController;
import com.rent.common.Constants;
import com.rent.common.annotation.SystemLog;
import com.rent.common.annotation.TokenSubmit;
import com.rent.common.validation.ValidationResult;
import com.rent.common.validation.ValidationUtils;
import com.rent.system.entity.PlatformDept;
import com.rent.system.entity.PlatformEmployee;
import com.rent.system.entity.PlatformInfo;
import com.rent.system.service.PlatformDeptService;
import com.rent.system.service.PlatformEmployeeService;
import com.rent.system.vo.PlatformDeptVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 平台部门管理action
 *
 * @author lgl
 */
@Controller
@RequestMapping("/platform/dept")
public class PlatformDeptAction extends BaseController {
    @Autowired
    private PlatformDeptService platformDeptService;
    @Autowired
    private PlatformEmployeeService platformEmployeeService;

    /**
     * 转向到平台部门管理主页面
     *
     * @return
     */
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request) {
        return new ModelAndView("/platform/dept/index");
    }


    /**
     * 有查询条件，带分页，无排序
     **/
    @RequestMapping(value = "/listBySort", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> pagerList(HttpServletRequest request, PlatformDeptVo platformDept) {
        List<PlatformDept> list = platformDeptService.findAllBySort();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("rows", list);
        return map;
    }

    /**
     * 获取递增编码
     *
     * @return
     */
    @RequestMapping(value = "/getDeptCode", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(description = "平台部门管理--获取递增编码", modelName = "平台部门管理")
    public Map<String, Object> getCount(HttpServletRequest request) {
        List<String> list  = platformDeptService.findOrderByCode();
        Map<String, Object> map = new HashMap<String, Object>();
        if (list != null && list.size() > 0) {
            Integer code = Integer.parseInt(list.get(0)) + 1;
            map.put("deptCode", code);
            return map;
        } else {
            map.put("deptCode", 101);
            return map;
        }
    }

    /**
     * 有查询条件，带分页排序
     **/
    @RequestMapping(value = "/pageSort", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> pageSort(PlatformDeptVo platformDept, @RequestParam int offset, @RequestParam int limit, @RequestParam String sort, @RequestParam String order) {
        PageRequest pagerequest = new PageRequest(offset / limit, limit);
        List<PlatformDept> list = platformDeptService.find(platformDept, pagerequest, sort, order);
        long total = platformDeptService.count(platformDept);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", total);
        map.put("rows", list);
        return map;
    }

    /**
     * 添加部门信息
     *
     * @param dept
     * @return
     */
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    @SystemLog(description = "平台部门管理--添加部门信息", modelName = "平台部门管理")
    @TokenSubmit(remove = true)
    public Map<String, String> add(HttpServletRequest request, PlatformDept dept) {
        String token = UUID.randomUUID().toString();//
        Map<String, String> map = new HashMap<String, String>();
        ValidationResult vr = ValidationUtils.validateEntity(dept);
        if (vr.isHasErrors()) {
            map.put("token", token);
            map.put("msg", vr.toString());
            sessionManager.setSessionValue(request, "token", token);
        } else {
            String pid = (String) sessionManager.getSessionValue(request, Constants.PLATFORMID);
            long c = platformDeptService.findCountByCode(dept.getDeptCode());
            if (c == 0) {
                PlatformInfo platformInfo = new PlatformInfo();
                platformInfo.setId(pid);
                dept.setPlatformInfo(platformInfo);
                platformDeptService.create(dept);
                map.put("code", "200");
                map.put("msg", messageSource.getMessage("ac.success", null, null));
            } else {
                map.put("msg", "该编码已使用");
                map.put("token", token);
                sessionManager.setSessionValue(request, "token", token);
            }
        }
        return map;
    }

    /**
     * 更新部门信息
     *
     * @param dept
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    @ResponseBody
    @SystemLog(description = "平台部门管理--更新部门信息", modelName = "平台部门管理")
    public Map<String, String> update(PlatformDept dept, @PathVariable String id) {
        PlatformDept oldDept = platformDeptService.findById(id);
        dept.setPlatformInfo(oldDept.getPlatformInfo());
        Map<String, String> map = new HashMap<String, String>();
        ValidationResult vr = ValidationUtils.validateEntity(dept);
        if (vr.isHasErrors()) {
            map.put("msg", vr.toString());
        } else {
            platformDeptService.update(dept);
            map.put("code", "200");
            map.put("msg", messageSource.getMessage("ac.success", null, null));
        }
        return map;
    }

    /**
     * 根据ID删除
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    @SystemLog(description = "平台部门管理--删除部门", modelName = "平台部门管理")
    public String delete(@PathVariable String id) {
        try {
            long num = platformEmployeeService.findByDeptId(id);
            if (num == 0) {
                platformDeptService.deleteById(id);
                return messageSource.getMessage("ac.dSuccess", null, null);
            } else {
                return "该部门有员工,不可删除";
            }
        } catch (Exception e) {
            return "删除失败";
        }
    }

    /**
     * 更新部门状态，useFlag
     *
     * @param useflag
     * @param id
     * @return
     */
    @RequestMapping(value = "/use/{id}", method = RequestMethod.PUT)
    @ResponseBody
    @SystemLog(description = "平台部门管理--更新部门状态", modelName = "平台部门管理")
    public String updateUse(Boolean useflag, String depts,
                            @PathVariable String id) {
        if (!"".equals(depts)) {
            String[] deptids = depts.split(",");
            List<PlatformEmployee> listemp = platformEmployeeService.findBydepts(deptids);
            if (listemp == null || listemp.size() == 0) {
                String result = platformDeptService.updateUse(useflag, deptids, id);
                if ("1".equals(result)) {
                    if (useflag) {
                        return messageSource.getMessage("ac.userfalgTrue", null, null);
                    } else {
                        return messageSource.getMessage("ac.userfalgFalse", null, null);
                    }
                } else {
                    return result;
                }
            } else {
                return "该部门或下级部门有员工，不能禁用";
            }
        }
        return messageSource.getMessage("ac.error", null, null);
    }

    /**
     * 验证部门编码可用
     *
     * @param code
     * @return
     */
    @RequestMapping(value = "remote")
    @ResponseBody
    @SystemLog(description = "平台部门管理--验证部门编码唯一", modelName = "平台部门管理")
    public Boolean remote(HttpServletRequest request, @RequestParam(value = "code") String code, @RequestParam(value = "id") String id) {

        if (id != null && id.length() > 0) {//有id代表是修改时候的验证，验证是否与老的一样
            PlatformDept pd = platformDeptService.findById(id);
            if (pd != null) {
                return true;
            } else {
                return false;
            }
        } else {//没有id代表是新增时候的验证，验证是否可用
            long c = platformDeptService.findCountByCode(code);
            if (c == 0) {
                return true;
            } else {
                return false;
            }
        }
    }

    /**
     * 根据部门编码查询部门数
     *
     * @param name
     * @return
     */
    @RequestMapping(value = "remoteName")
    @ResponseBody
    @SystemLog(description = "平台部门管理--验证部门编码唯一", modelName = "平台部门管理")
    public Boolean remoteName(HttpServletRequest request, @RequestParam(value = "name") String name, @RequestParam(value = "id") String id) {
        if (id != null && id.length() > 0) {//有id代表是修改时候的验证，验证是否与老的一样
            PlatformDept pd = platformDeptService.findById(id);
            if (pd != null && name != null && name.trim().equals(pd.getDeptName())) {
                return true;
            } else {
                long c = platformDeptService.findCountByName(name);
                if (c == 0) {
                    return true;
                } else {
                    return false;
                }
            }
        } else {//没有id代表是新增时候的验证，验证是否可用
            long c = platformDeptService.findCountByName(name.trim());
            if (c == 0) {
                return true;
            } else {
                return false;
            }
        }
    }

    /**
     * 获得启用部门列表
     *
     * @return
     */
    @RequestMapping(value = "deptList", method = RequestMethod.GET)
    @ResponseBody
    public List<PlatformDept> sublists() {
        return platformDeptService.findActiveALL();
    }

}
