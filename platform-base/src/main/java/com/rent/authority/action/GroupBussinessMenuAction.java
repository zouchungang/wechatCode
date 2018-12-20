package com.rent.authority.action;

import com.rent.authority.entity.GroupBussinessMenu;
import com.rent.authority.service.GroupBussinessMenuService;
import com.rent.common.BaseController;
import com.rent.common.annotation.SystemLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 权限分组分权限Action
 */
@Controller
@RequestMapping("/auth/groupBussinessMenu")
public class GroupBussinessMenuAction extends BaseController {

    @Autowired
    private GroupBussinessMenuService groupBussinessMenuService;

    /**
     * 列出权限组的权限
     * @param groupBussinessMenu
     * @return
     */
    @RequestMapping(value = "listAuth", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(description = "景区企业权限组--列出权限组的权限", modelName = "景区企业权限组")
    public List<GroupBussinessMenu> listAuth(GroupBussinessMenu groupBussinessMenu) {
        return groupBussinessMenuService.find(groupBussinessMenu);
    }


    /**
     * 保存权限组权限
     * @param pathMenus
     * @param authorityGroupId
     * @return
     */
    @RequestMapping(value = "updateAuthMenu",method = RequestMethod.PUT)
    @ResponseBody
    @SystemLog(description = "景区企业权限组--保存权限组权限", modelName = "景区企业权限组")
    public String updateAuthMenu(String pathMenus,String authorityGroupId,int bussinessType) {
        groupBussinessMenuService.updateAuthMenu(pathMenus,authorityGroupId,bussinessType);
        return messageSource.getMessage("ac.success", null, null);
    }
}
