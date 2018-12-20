package com.rent.system.action;

import com.rent.common.BaseController;
import com.rent.common.annotation.SystemLog;
import com.rent.common.annotation.TokenSubmit;
import com.rent.system.entity.PlatformMenu;
import com.rent.system.service.PlatformMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 平台管理菜单action
 *
 * @author lgl
 */
@Controller
@RequestMapping("/platform/menu")
public class PlatformMenuAction extends BaseController {
    @Autowired
    private PlatformMenuService platformMenuService;

    /**
     * 转向平台菜单主页面
     *
     * @return
     */
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request) {
        return new ModelAndView("/platform/menu/index");
    }

    /**
     * 获得启用部门列表
     *
     * @return
     */
    @RequestMapping(value = "firstLevelMenu", method = RequestMethod.GET)
    @ResponseBody
    public List<PlatformMenu> sublists() {
        return platformMenuService.menuByLevel(1);
    }

    /**
     * 有查询条件，带分页，无排序
     **/
    @RequestMapping(value = "/listBySort", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> pagerList(HttpServletRequest request, String parentid, @RequestParam String sort, @RequestParam String order) {
        List<PlatformMenu> list = null;
        PlatformMenu pm = new PlatformMenu();
        pm.setDataLevels(2);
        if (parentid != null && parentid.length() > 0) {
            pm.setParentId(parentid);
        }
        list = platformMenuService.find(pm,null,sort,order);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("rows", list);
        return map;
    }

    /**
     * 添加菜单
     *
     * @param platformMenu
     * @return
     */
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    @TokenSubmit(remove = true)
    @SystemLog(description = "菜单管理功能--添加菜单", modelName = "菜单管理功能")
    public String add(PlatformMenu platformMenu) {
        platformMenu.setDataLevels(2);
        platformMenuService.create(platformMenu);
        return messageSource.getMessage("ac.success", null, null);
    }

    /**
     * 更新菜单
     *
     * @param platformMenu
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    @ResponseBody
    @SystemLog(description = "菜单管理功能--更新菜单", modelName = "菜单管理功能")
    public String update(PlatformMenu platformMenu, @PathVariable String id) {
        platformMenu.setDataLevels(2);
        platformMenuService.update(platformMenu);
        return messageSource.getMessage("ac.uSuccess", null, null);
    }

    /**
     * 逻辑删除
     *
     * @param id
     */
    @RequestMapping(value = "/use/{id}", method = RequestMethod.PUT)
    @ResponseBody
    @SystemLog(description = "菜单管理功能--平台菜单启用禁用", modelName = "平台菜单")
    public String logicUpdate(@PathVariable("id") String id, boolean useflag) {
        if (useflag) {
            platformMenuService.updateUseFlag(id, false);
        } else {
            platformMenuService.updateUseFlag(id, true);
        }
        return messageSource.getMessage("ac.uSuccess", null, null);
    }

    /**
     * 平台菜单名称查重
     *
     * @param name
     * @return
     */
    @RequestMapping(value = "remote")
    @ResponseBody
    @SystemLog(description = "菜单管理功能--验证菜单名称是否唯一", modelName = "平台菜单")
    public Boolean remoteName(HttpServletRequest request, @RequestParam(value = "name") String name, @RequestParam(value = "id") String id, @RequestParam(value = "pid") String pid) {
        if(pid!=null&&pid.length()>0){
            if (id != null && id.length() > 0) {//有id代表是修改时候的验证，验证是否与老的一样
                PlatformMenu pm = platformMenuService.findById(id);
                if (pm != null && name != null && name.trim().equals(pm.getMenuName())) {
                    return true;
                } else{
                    long c = platformMenuService.findCountByPidName(pid, name);
                    if (c == 0) {
                        return true;
                    } else {
                        return false;
                    }
                }
            } else {//没有id代表是新增时候的验证，验证是否可用
                long c = platformMenuService.findCountByPidName(pid, name.trim());
                if (c == 0) {
                    return true;
                } else {
                    return false;
                }
            }
        }else {
            return false;
        }
    }


}
