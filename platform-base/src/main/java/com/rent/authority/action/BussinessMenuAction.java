package com.rent.authority.action;

import com.rent.authority.entity.AuthorityGroup;
import com.rent.authority.entity.BussinessMenu;
import com.rent.authority.entity.GroupBussinessMenu;
import com.rent.authority.service.BussinessMenuService;
import com.rent.authority.service.GroupBussinessMenuService;
import com.rent.authority.vo.BussinessMenuVo;
import com.rent.common.BaseController;
import com.rent.common.annotation.SystemLog;
import com.rent.common.annotation.TokenSubmit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 菜单管理模块
 * Created by sbd on 2016-11-23.
 */
@Controller
@RequestMapping("/auth/bussinessMenu")
public class BussinessMenuAction extends BaseController {

    @Autowired
    private BussinessMenuService bussinessMenuService;
    @Autowired
    private GroupBussinessMenuService groupBussinessMenuService;


    /**
     * 转向到主页面
     *
     * @return
     */
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request) {
        return new ModelAndView("/auth/basemenu/index");
    }


    /**
     * 根据查询条件显示分页数据
     *
     * @param bussinessMenuVo
     * @param offset
     * @param limit
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> listTwo(BussinessMenuVo bussinessMenuVo,
                                       @RequestParam int offset, @RequestParam int limit, @RequestParam String sort, @RequestParam String order) {
        PageRequest pagerequest = new PageRequest(offset / limit, limit);
        bussinessMenuVo.setDataLevels(2);
        List<BussinessMenu> list = bussinessMenuService.find(bussinessMenuVo, pagerequest,sort, order);
        long total = bussinessMenuService.count(bussinessMenuVo);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", total);
        map.put("rows", list);
        return map;
    }

    /**
     * 查询一级菜单
     * @param bussinessMenuVo
     * @return
     */
    @RequestMapping(value = "listOne", method = RequestMethod.GET)
    @ResponseBody
    public List<BussinessMenu> listOne(BussinessMenuVo bussinessMenuVo) {
        bussinessMenuVo.setDataLevels(1);
        List<BussinessMenu> list = bussinessMenuService.find(bussinessMenuVo);
        return list;
    }


    /**
     * 查询所有权限，在分组权限使用
     * @param bussinessMenuVo
     * @param groupId
     * @return
     */
    @RequestMapping(value = "listMenu", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> listMenu(BussinessMenuVo bussinessMenuVo, @RequestParam String groupId) {
        bussinessMenuVo.setUseFlag(true);
        bussinessMenuVo.setDataLevels(1);
        List<BussinessMenu> list1 = bussinessMenuService.find(bussinessMenuVo);
        bussinessMenuVo.setDataLevels(2);
        List<BussinessMenu> list2 = bussinessMenuService.find(bussinessMenuVo);
        Map<String, Object> map = new HashMap<String, Object>();
        GroupBussinessMenu groupBussinessMenu = new GroupBussinessMenu();
        AuthorityGroup authorityGroup = new AuthorityGroup();
        authorityGroup.setId(groupId);
        groupBussinessMenu.setAuthorityGroup(authorityGroup);
        List<GroupBussinessMenu> list3 = groupBussinessMenuService.find(groupBussinessMenu);
        map.put("rows1", list1);
        map.put("rows2", list2);
        map.put("pathRows",list3);
        return map;
    }



    /**
     * 添加企业基础菜单
     *
     * @param bussinessMenu
     * @return
     */
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    @SystemLog(description = "景区企业菜单--添加景区企业菜单", modelName = "景区企业菜单")
    @TokenSubmit(remove = true)
    public String create(BussinessMenu bussinessMenu) {
        bussinessMenuService.create(bussinessMenu);
        return messageSource.getMessage("ac.success", null, null);
    }

    /**
     * 更新景区企业菜单
     *
     * @param bussinessMenu
     * @return
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    @ResponseBody
    @SystemLog(description = "景区企业菜单--更新景区企业菜单", modelName = "景区企业菜单")
    public String update(@PathVariable String id, BussinessMenu bussinessMenu) {
        boolean t =bussinessMenuService.update(bussinessMenu);
        if(t){
            return messageSource.getMessage("ac.uSuccess", null, null);
        }
        return "该菜单已分配，不可禁用！";
    }

    /**
     * 根据id获取单个
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public BussinessMenu getById(@PathVariable String id) {
        return bussinessMenuService.findById(id);
    }

    /**
     * 根据ID删除景区企业菜单
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    @SystemLog(description = "景区企业菜单--删除景区企业菜单", modelName = "景区企业菜单")
    public String delete(@PathVariable String id) {
        boolean t =bussinessMenuService.delete(id);
        if(t){
            return messageSource.getMessage("ac.dSuccess", null, null);
        }
        return "该菜单已分配，不可删除！";
    }

    @RequestMapping(value = "remoteName")
    @ResponseBody
    @SystemLog(description = "景区企业菜单--验证名称唯一", modelName = "景区企业菜单")
    public String remoteName(HttpServletRequest request, @RequestParam(value = "name") String name, @RequestParam(value = "id") String id, @RequestParam(value = "parentId") String parentId) {
        if(parentId == null){
            return "请先选择父节点";
        }else if(name == null){
            return "请先输入菜单名称";
        }else if (id != null && id.length() > 0) {//有id代表是修改时候的验证，验证是否与老的一样
            BussinessMenu pd = bussinessMenuService.findById(id);
            if (pd != null && name.trim().equals(pd.getMenuName())) {
                return "true";
            } else {
                long c = bussinessMenuService.findCountByName(name.trim(),parentId);
                if (c == 0) {
                    return "true";
                } else {
                    return "该名称不可用";
                }
            }
        } else {//没有id代表是新增时候的验证，验证是否可用
            long c = bussinessMenuService.findCountByName(name.trim(),parentId);
            if (c == 0) {
                return "true";
            } else {
                return "该名称不可用";
            }
        }
    }
}
