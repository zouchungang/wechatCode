package com.rent.authority.service;

import com.rent.authority.dao.BussinessMenuDao;
import com.rent.authority.dao.GroupBussinessMenuDao;
import com.rent.authority.entity.BussinessMenu;
import com.rent.authority.vo.BussinessMenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * 菜单权限Service
 * Created by sbd on 2016-11-23.
 */
@Service
public class BussinessMenuService {

    @Autowired
    private BussinessMenuDao bussinessMenuDao;
    @Autowired
    private GroupBussinessMenuDao groupBussinessMenuDao;

    /**
     * 单个查询
     * @param id
     * @return
     */
    public BussinessMenu findById(String id) {
        BussinessMenu bussinessMenu = bussinessMenuDao.findById(id);
        return bussinessMenu;
    }

    /**
     * 查询所有 不带条件
     * @return
     */
    public List<BussinessMenu> getAll() {
        List<BussinessMenu> list = bussinessMenuDao.findAll();
        return list;
    }

    /**
     * 带分页查询
     * @param pagerequest
     * @return
     */
    public List<BussinessMenu> getPage(PageRequest pagerequest) {
        List<BussinessMenu> list = bussinessMenuDao.findAll(pagerequest).getContent();
        return list;
    }

    /**
     * 带分页、条件、排序 查询
     * @param baseMenu
     * @param pagerequest
     * @param sort
     * @param order
     * @return
     */
    public List<BussinessMenu> find(BussinessMenuVo baseMenu, PageRequest pagerequest, String sort, String order) {
        List<BussinessMenu> list = bussinessMenuDao.find(baseMenu, pagerequest, sort, order);
        return list;
    }

    /**
     * 带 条件、分页查询
     * @param baseMenu
     * @param pagerequest
     * @return
     */
    public List<BussinessMenu> find(BussinessMenuVo baseMenu, PageRequest pagerequest) {
        List<BussinessMenu> list = bussinessMenuDao.find(baseMenu, pagerequest,null,null);
        return list;
    }

    /**
     * 带条件查询
     * @param baseMenu
     * @return
     */
    public List<BussinessMenu> find(BussinessMenuVo baseMenu) {
        List<BussinessMenu> list = bussinessMenuDao.find(baseMenu, null,"dataSort","asc");
        return list;
    }

    /**
     * 保存方法
     * @param bussinessMenu
     * @return
     */
    public BussinessMenu create(BussinessMenu bussinessMenu) {
        BussinessMenu savedBussinessMenu = bussinessMenuDao.save(bussinessMenu);
        return savedBussinessMenu;
    }

    /**
     * 批量保存方法
     * @param bussinessMenuList
     * @return
     */
    public List<BussinessMenu> batchcreate(List<BussinessMenu> bussinessMenuList) {
        List<BussinessMenu> relist = bussinessMenuDao.save(bussinessMenuList);
        return relist;
    }

    /**
     * 更新菜单
     * @param bussinessMenu
     * @return
     */
    public boolean update(BussinessMenu bussinessMenu) {
        bussinessMenuDao.save(bussinessMenu);
        return true;
    }

    /**
     * 删除菜单
     * @param id
     */
    public boolean delete(String id) {
        List<String> listStr1 = groupBussinessMenuDao.findByMenuId(id);
        if(listStr1!=null&&listStr1.size()>0){
            return false;
        }
        bussinessMenuDao.delete(id);
        return true;
    }

    /**
     * 查询个数，主要为分页使用
     * @return
     */
    public long getCount() {
        return bussinessMenuDao.count();
    }

    /**
     * 按条件统计数量
     * @param bussinessMenuVo
     * @return
     */
    public long count(BussinessMenuVo bussinessMenuVo) {
        long count = bussinessMenuDao.count(bussinessMenuVo);
        return count;
    }

    public long findCountByName(String name,String pid) {
        long count = bussinessMenuDao.findCountByName(name,pid);
        return count;
    }
}
