package com.rent.system.action;

import com.rent.common.BaseController;
import com.rent.common.Constants;
import com.rent.common.annotation.SystemLog;
import com.rent.common.annotation.TokenSubmit;
import com.rent.common.util.FileUtils;
import com.rent.common.util.PropertiesUtils;
import com.rent.system.entity.PlatformEmployee;
import com.rent.system.service.PlatformEmployeeService;
import com.rent.system.vo.PlatformEmployeeVo;
import com.rent.system.vo.Tree;
import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 平台企业员工管理
 *
 * @author lgl
 */
@Controller
@RequestMapping("/platform/employee")
public class PlatformEmployeeAction extends BaseController {
    private static Logger logger = LoggerFactory.getLogger(PlatformEmployeeAction.class);
    @Autowired
    private PlatformEmployeeService platformEmployeeService;

    /**
     * 转向到企业员工主页面
     *
     * @return
     */
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request) {
        return new ModelAndView("/platform/employee/index");
    }

    /**
     * @param request
     * @return
     */
    @RequestMapping(value = "slefinfo", method = RequestMethod.GET)
    public ModelAndView slefinfo(HttpServletRequest request) {
        String employeeId = sessionManager.getSessionValue(request, Constants.PLATFORMEMPLOYEEID).toString();
        PlatformEmployee platformEmployee = platformEmployeeService.findById(employeeId);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("platformEmployee", platformEmployee);
        return new ModelAndView("/platform/employee/selfInfo", map);
    }

    /**
     * @param request
     * @return
     */
    @RequestMapping(value = "slefmanagerpwd", method = RequestMethod.GET)
    public ModelAndView slefManagerPwd(HttpServletRequest request) {
        String employeeId = sessionManager.getSessionValue(request, Constants.PLATFORMEMPLOYEEID).toString();
        String employeeName = sessionManager.getSessionValue(request, Constants.PLATFORMEMPLOYEENAME).toString();
        Map<String, String> map = new HashMap<String, String>();
        map.put("employeeId", employeeId);
        map.put("employeeName", employeeName);
        return new ModelAndView("/platform/employee/selfManagerPwd", map);
    }

    /**
     * 根据查询条件显示分页数据
     *
     * @param platformEmployeeVo
     * @param offset
     * @param limit
     * @return
     */
    @RequestMapping(value = "pageSort", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(description = "平台企业员工列表", modelName = "平台企业员工")
    public Map<String, Object> list(PlatformEmployeeVo platformEmployeeVo, @RequestParam int offset, @RequestParam int limit, @RequestParam String sort, @RequestParam String order) {
        PageRequest pagerequest = new PageRequest(offset / limit, limit);
        platformEmployeeVo.setAdminManager(false);
        List<PlatformEmployee> list = null;
        long total = 0;
        list = platformEmployeeService.find(platformEmployeeVo, pagerequest, sort, order);
        total = platformEmployeeService.count(platformEmployeeVo);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", total);
        map.put("rows", list);
        return map;
    }

    /**
     * 当前员工所具有的岗位
     *
     * @param platformEmployee
     * @return
     * @throws Exception
     */
    @RequestMapping("combotree")
    @ResponseBody
    public List<Tree> combotree(PlatformEmployee platformEmployee) throws Exception {
        List<Tree> trees = new ArrayList<Tree>();
        if (platformEmployee == null) {
            return trees;
        }
        return trees;
    }

    /**
     * 添加平台企业的员工
     *
     * @param request
     * @param platformEmployee
     */
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    @TokenSubmit(remove = true)
    @SystemLog(description = "平台企业员工--新增平台企业员工", modelName = "平台企业员工")
    public String insert(HttpServletRequest request, PlatformEmployee platformEmployee) {
        platformEmployee.setAdminManager(false);
        platformEmployee.setEmployeeCode(platformEmployee.getEmployeeCode().toUpperCase());
        platformEmployee.setPwd(DigestUtils.md5Hex(Constants.INIT_PWD));
        platformEmployee.setManagepwd(DigestUtils.md5Hex(Constants.INIT_PWD));
        platformEmployeeService.save(platformEmployee);
        return messageSource.getMessage("ac.success", null, null);
    }

    /**
     * 更新平台企业员工信息
     *
     * @param platformEmployee
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    @ResponseBody
    @SystemLog(description = "平台企业员工--修改平台企业员工", modelName = "平台企业员工")
    public String update(@PathVariable("id") String id, PlatformEmployee platformEmployee) {
        PlatformEmployee oldEmp = platformEmployeeService.findById(id);
        platformEmployee.setPwd(oldEmp.getPwd());
        platformEmployee.setManagepwd(oldEmp.getManagepwd());
        platformEmployeeService.save(platformEmployee);
        return messageSource.getMessage("ac.uSuccess", null, null);
    }


    /**
     * 逻辑删除
     *
     * @param id
     */
    @RequestMapping(value = "/use/{id}", method = RequestMethod.PUT)
    @ResponseBody
    @SystemLog(description = "平台企业员工--启用禁用平台企业员工", modelName = "平台企业员工")
    public String logicUpdate(@PathVariable("id") String id, boolean useflag) {
        if (useflag) {
            platformEmployeeService.updateUseFlag(id, false);
        } else {
            platformEmployeeService.updateUseFlag(id, true);
        }
        return messageSource.getMessage("ac.uSuccess", null, null);
    }

    /**
     * 验证用户名是否重复
     *
     * @param platformEmployee
     * @return
     */
    @RequestMapping("isOnly")
    @ResponseBody
    @SystemLog(description = "平台企业员工--验证用户名是否唯一", modelName = "平台企业员工")
    public Map<String, Object> isOnly(PlatformEmployee platformEmployee) {
        Map<String, Object> map = new HashMap<String, Object>();
        platformEmployee
                .setEmployeeCode(platformEmployee.getEmployeeCode().toUpperCase());
        PlatformEmployee employee = platformEmployeeService.findById(platformEmployee
                .getEmployeeCode());
        if (employee == null) {
            map.put("issuccess", 1); // 是唯一的
        } else {
            map.put("issuccess", 0); // 不是唯一的
        }
        return map;
    }

    /**
     * 验证商品编码是否重复
     *
     * @param platformEmployee
     * @return
     */
    @RequestMapping(value = "checkcode")
    @ResponseBody
    @SystemLog(description = "平台企业员工--验证商品编码是否唯一", modelName = "平台企业员工")
    public boolean checkcode(PlatformEmployee platformEmployee) {
        platformEmployee.setEmployeeCode(platformEmployee.getEmployeeCode().toUpperCase());
        PlatformEmployee employee = platformEmployeeService.findById(platformEmployee.getEmployeeCode());
        if (employee == null) {
            return true; // 可用
        } else {
            return false; // 不可
        }
    }

    /**
     * 首页更新密码使用
     *
     * @param oldPwd
     * @param newPwd
     * @return
     */
    @RequestMapping(value = "alterPwd", method = RequestMethod.PUT)
    @ResponseBody
    @SystemLog(description = "平台企业员工--平台员工自己更新密码", modelName = "平台企业员工")
    public String updatePwd(HttpServletRequest request, String oldPwd, String newPwd) {
        String employeeId = sessionManager.getSessionValue(request, Constants.PLATFORMEMPLOYEEID).toString();
        PlatformEmployee employee = platformEmployeeService.findById(employeeId);
        String msg = "";
        if (!DigestUtils.md5Hex(oldPwd).equals(employee.getPwd())) {
            msg = "原密码不正确，修改失败！";
        } else {
            employee.setPwd(DigestUtils.md5Hex(newPwd));
            platformEmployeeService.update(employee);
            msg = "密码修改成功，下次登录时生效！";
        }
        return msg;
    }

    /**
     * 首页更改个人资料
     *
     * @param platformEmployee
     */
    @RequestMapping(value = "/alterInfo", method = RequestMethod.PUT)
    @ResponseBody
    @SystemLog(description = "平台企业员工--平台员工自己修改信息", modelName = "平台企业员工")
    public String alterInfo(HttpServletRequest request, PlatformEmployee platformEmployee) {
        String msg = "";
        String employeeId = sessionManager.getSessionValue(request, Constants.PLATFORMEMPLOYEEID).toString();
        String mobile = platformEmployee.getMobile();
        long l = platformEmployeeService.findIdAndMobile(employeeId, mobile);
        if (l > 0) {
            msg = "手机号码已经绑定，请解除绑定其他用户";
        } else {
            PlatformEmployee oldEmp = platformEmployeeService.findById(employeeId);
            oldEmp.setCardId(platformEmployee.getCardId());
            oldEmp.setMobile(platformEmployee.getMobile());
            oldEmp.setSex(platformEmployee.getSex());
            oldEmp.setPhoto(platformEmployee.getPhoto());
            platformEmployeeService.save(oldEmp);
            msg = messageSource.getMessage("ac.uSuccess", null, null);
        }
        return msg;
    }

    /**
     * 初始化平台企业员工密码
     *
     * @param code
     * @return
     */
    @RequestMapping(value = "/initpwd/{code}", method = RequestMethod.PUT)
    @ResponseBody
    @SystemLog(description = "平台企业员工--初始化员工密码", modelName = "运营企业管理")
    public String initpwd(@PathVariable("code") String code) {
        String msg = "";
        try {
            String pwd = DigestUtils.md5Hex(Constants.INIT_PWD);
            List<PlatformEmployee> employeeList = platformEmployeeService.getByEmployeeCode(code);
            if (employeeList.size() > 0) {
                PlatformEmployee PlatformEmployee = employeeList.get(0);
                PlatformEmployee.setPwd(pwd);
                PlatformEmployee.setManagepwd(pwd);
                platformEmployeeService.update(PlatformEmployee);
                msg = "初始化成功";
            } else {
                msg = "初始化失败";
            }
        } catch (Exception e) {
            msg = "初始化不成功!";
        }
        return msg;
    }

    /**
     * 上传平台企业LOGO图片
     *
     * @return
     */
    @SuppressWarnings("finally")
    @RequestMapping(value = "/logo", method = RequestMethod.POST)
    @ResponseBody
    @SystemLog(description = "平台企业员工--上传企业logo", modelName = "运营企业管理")
    public String uploadPhoto(HttpServletRequest request, HttpServletResponse response, MultipartFile file) {
        String result = "";
        if (file.getSize() > 0) {
            try {
               // String realPath = request.getSession().getServletContext().getRealPath("");
                PropertiesUtils propertiesUtils = new PropertiesUtils();
                String realPath = propertiesUtils.getConfig("", "commonFiles");
                result = FileUtils.uploadFile(file, "platformEmployeePhoto", realPath);
            } catch (Exception e) {
                logger.error("上传企业logo失败:" + e.getMessage());
            }
        }
        return result;
    }

    /**
     * 用户编码查重
     *
     * @param code
     * @return
     */
    @RequestMapping(value = "remoteCode")
    @ResponseBody
    @SystemLog(description = "平台企业员工--验证用户编码是否唯一", modelName = "运营企业管理")
    public Boolean checkcode(HttpServletRequest request, @RequestParam(value = "code") String code, @RequestParam(value = "id") String id) {
        if (id != null && id.length() > 0) {//有id代表是修改时候的验证，验证是否与老的一样
            PlatformEmployee pe = platformEmployeeService.findById(id);
            if (pe != null) {
                return true;
            } else {
                return false;
            }
        } else {//没有id代表是新增时候的验证，验证是否可用
            long c = platformEmployeeService.findCountByCode(code);
            if (c == 0) {
                return true;
            } else {
                return false;
            }
        }
    }

    @RequestMapping(value = "/remoteMobile")
    @ResponseBody
    @SystemLog(description = "平台企业员工--验证手机号码是否唯一", modelName = "运营企业管理")
    public Boolean rempteMobile(@RequestParam(value = "mobile") String mobile, @RequestParam(value = "id") String id) {
        if (id != null && id.length() > 0) {
            PlatformEmployee platformEmployee = platformEmployeeService.findById(id);
            if (platformEmployee != null && platformEmployee.getMobile().equals(mobile)) {
                return true;
            } else {
                List<PlatformEmployee> list = platformEmployeeService.findMobile(mobile);
                return list.size() == 0;
            }
        } else {
            List<PlatformEmployee> list = platformEmployeeService.findMobile(mobile);
            return list.size() == 0;
        }
    }
}
