package com.rent.authority.service;

import com.rent.authority.dao.AuthorityGroupDao;
import com.rent.authority.dao.BussinessMenuDao;
import com.rent.authority.dao.GroupBussinessMenuDao;
import com.rent.authority.entity.AuthorityGroup;
import com.rent.authority.entity.BussinessMenu;
import com.rent.authority.entity.GroupBussinessMenu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 权限分配表Service
 * Created by Administrator on 2016-11-23.
 */
@Service
public class GroupBussinessMenuService {
    @Autowired
    private GroupBussinessMenuDao groupBussinessMenuDao;
    @Autowired
    private BussinessMenuDao bussinessMenuDao;
    @Autowired
    private AuthorityGroupDao authorityGroupDao;
    /**
     * 单个查询
     * @param id
     * @return
     */
    public GroupBussinessMenu findById(String id) {
        GroupBussinessMenu groupBussinessMenu = groupBussinessMenuDao.findById(id);
        return groupBussinessMenu;
    }

    /**
     *查询所有
     * @return
     */
    public List<GroupBussinessMenu> getAll() {
        List<GroupBussinessMenu> list = groupBussinessMenuDao.findAll();
        return list;
    }

    /**
     *带分页查询
     * @param pagerequest
     * @return
     */
    public List<GroupBussinessMenu> getPage(PageRequest pagerequest) {
        List<GroupBussinessMenu> list = groupBussinessMenuDao.findAll(pagerequest).getContent();
        return list;
    }

    /**
     *查询
     * @param groupBussinessMenu
     * @return
     */
    public List<GroupBussinessMenu> find(GroupBussinessMenu groupBussinessMenu) {
        List<GroupBussinessMenu> list = groupBussinessMenuDao.find(groupBussinessMenu, null,null,null);
        return list;
    }

    /**
     * 保存
     *
     * @param groupBussinessMenu
     * @return
     */
    public GroupBussinessMenu create(GroupBussinessMenu groupBussinessMenu) {
        GroupBussinessMenu savedGroupBussinessMenu = groupBussinessMenuDao.save(groupBussinessMenu);
        return savedGroupBussinessMenu;
    }

    /**
     *批量保存
     * @param groupBussinessMenuList
     * @return
     */
    public List<GroupBussinessMenu> batchcreate(List<GroupBussinessMenu> groupBussinessMenuList) {
        List<GroupBussinessMenu> relist = groupBussinessMenuDao.save(groupBussinessMenuList);
        return relist;
    }

    /**
     *更新分组信息
     * @param groupBussinessMenu
     * @return
     */
    public GroupBussinessMenu update(GroupBussinessMenu groupBussinessMenu) {
        GroupBussinessMenu savedGroupBussinessMenu = groupBussinessMenuDao.save(groupBussinessMenu);
        return savedGroupBussinessMenu;
    }

    /**
     *删除
     * @param id
     */
    public void delete(String id) {
        groupBussinessMenuDao.delete(id);
    }

    /**
     *统计
     * @return
     */
    public long getCount() {
        return groupBussinessMenuDao.count();
    }

    /**
     *删除分组
     * @param authorityGroupId
     */
    public void deleteByGroup(String authorityGroupId) {
        groupBussinessMenuDao.deleteByGroup(authorityGroupId);
    }

    /**
     *保存更新权限组分配
     * @param pathMenus
     * @param authorityGroupId
     */
    @Transactional
    public void updateAuthMenu(String pathMenus, String authorityGroupId,int bussinessType) {
        GroupBussinessMenu groupBussinessMenu = new GroupBussinessMenu();
        AuthorityGroup authorityGroup = authorityGroupDao.findById(authorityGroupId);
        groupBussinessMenu.setAuthorityGroup(authorityGroup);
        List<GroupBussinessMenu> oldAuths = groupBussinessMenuDao.findByGroupAndbussinessType(authorityGroupId, bussinessType);
        List<GroupBussinessMenu> auths = new ArrayList<GroupBussinessMenu>();
        if (oldAuths != null && oldAuths.size() > 0) {
            for (GroupBussinessMenu g : oldAuths) {
                String bmId = g.getBussinessMenu().getId();
                String gbmId = g.getId();
                if (!pathMenus.contains(bmId)) {
                    groupBussinessMenuDao.deleteById(gbmId);
                    continue;
                } else {
                    pathMenus = pathMenus.replace(bmId+",","");
                    continue;
                }
            }
        }
        if (!"".equals(pathMenus)) {
            String authMenus2 = pathMenus.substring(0, pathMenus.lastIndexOf(","));
            String[] newAuthMenus = authMenus2.split(",");
            for (int i = 0; i < newAuthMenus.length; i++) {
                String menuId = newAuthMenus[i];
                GroupBussinessMenu gbm = new GroupBussinessMenu();
                BussinessMenu bussinessMenu = bussinessMenuDao.findById(menuId);
                gbm.setAuthorityGroup(authorityGroup);
                gbm.setBussinessMenu(bussinessMenu);
                auths.add(gbm);
            }
            groupBussinessMenuDao.save(auths);
        }
    }
}
