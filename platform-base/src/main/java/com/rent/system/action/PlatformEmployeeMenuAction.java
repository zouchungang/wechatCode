package com.rent.system.action;

import com.rent.common.BaseController;
import com.rent.common.Constants;
import com.rent.common.annotation.SystemLog;
import com.rent.system.entity.PlatformEmployee;
import com.rent.system.entity.PlatformEmployeeMenu;
import com.rent.system.entity.PlatformMenu;
import com.rent.system.service.PlatformEmployeeMenuService;
import com.rent.system.service.PlatformEmployeeService;
import com.rent.system.service.PlatformMenuService;
import com.rent.system.vo.EmployeeMenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 平台企业员工管理
 *
 * @author lgl
 */
@Controller
@RequestMapping("/platform/employeeMenu")
public class PlatformEmployeeMenuAction extends BaseController {
    @Autowired
    private PlatformEmployeeService platformEmployeeService;
    @Autowired
    private PlatformEmployeeMenuService platformEmployeeMenuService;
    @Autowired
    private PlatformMenuService platformMenuService;

    /**
     * 转向到企业员工权限主页面
     *
     * @return
     */
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request) {
        return new ModelAndView("/sys/employee_index");
    }

    /**
     * 查询所有权限，平台员工使用
     *
     * @param empId
     * @return
     */
    @RequestMapping(value = "listMenu", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> listMenu(@RequestParam String empId) {
//        获得一级菜单，二级菜单
        Map<String, Object> map = new HashMap<String, Object>();
        List<PlatformMenu> menuList1 = platformMenuService.menuByLevel(1);
        List<PlatformMenu> menuList2 = platformMenuService.menuByLevel(2);
//        获得员工已有权限
        List<PlatformEmployeeMenu> emList = platformEmployeeMenuService.allListByEmployeeId(empId);
        map.put("rows1", menuList1);
        map.put("rows2", menuList2);
        map.put("pathRows", emList);
        return map;
    }

    /**
     * 保存权权限
     *
     * @param pathMenus
     * @param empid
     * @return
     */
    @RequestMapping(value = "updateAuthMenu", method = RequestMethod.PUT)
    @ResponseBody
    @SystemLog(description = "平台员工权限--修改员工权限", modelName = "平台员工权限")
    public String updateAuthMenu(String pathMenus, String empid) {
        platformEmployeeMenuService.updateAuthMenu(pathMenus, empid);
        return "权限修改成功";
    }

    /**
     * 查询所有权限，平台员工使用
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "tree", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> tree(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        String empId = (String) sessionManager.getSessionValue(request, Constants.PLATFORMEMPLOYEEID);
        if (empId != null && !"".equals(empId)) {
            PlatformEmployee platformEmployee = platformEmployeeService.findById(empId);
            List<EmployeeMenuVo> emList;
            if (platformEmployee.getAdminManager()) {
                //获取超级管理员全部权限
                emList = platformEmployeeMenuService.menuListAll();
            } else {
                //        获得员工已有权限
                emList = platformEmployeeMenuService.menuListByEmployeeId(empId);
            }
            map.put("pathRows", emList);
            return map;
        } else {
            return null;
        }
    }
}
