package com.rent.system.service;

import com.rent.common.util.UUIDUtil;
import com.rent.system.dao.PlatformEmployeeDao;
import com.rent.system.dao.PlatformEmployeeMenuDao;
import com.rent.system.dao.PlatformMenuDao;
import com.rent.system.entity.PlatformEmployee;
import com.rent.system.entity.PlatformEmployeeMenu;
import com.rent.system.entity.PlatformMenu;
import com.rent.system.vo.EmployeeMenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class PlatformEmployeeMenuService {

    @Autowired
    private PlatformEmployeeDao platformEmployeeDao;
    @Autowired
    private PlatformMenuDao platformMenuDao;
    @Autowired
    private PlatformEmployeeMenuDao platformEmployeeMenuDao;


    public List<PlatformEmployeeMenu> findALL() {
        // TODO Auto-generated method stub
        return null;
    }

    /**
     * 根据员工id查询员工权限
     *
     * @param empId
     * @return
     */
    public List<PlatformEmployeeMenu> allListByEmployeeId(String empId) {
        return platformEmployeeMenuDao.allListByEmployeeId(empId);
    }

    public List<EmployeeMenuVo> menuListByEmployeeId(String employeeId) {
//        获得员工权限列表
        List<PlatformEmployeeMenu> pemList = platformEmployeeMenuDao.canUseListByEmployeeId(employeeId);
        List<EmployeeMenuVo> returnList1 = new ArrayList<EmployeeMenuVo>();//存储1级菜单
        List<EmployeeMenuVo> returnList2 = new ArrayList<EmployeeMenuVo>();//存储2级菜单
        PlatformMenu platformMenu = null;
        EmployeeMenuVo employeeMenuVo = null;
        for (PlatformEmployeeMenu pem : pemList) {
            employeeMenuVo = new EmployeeMenuVo();
            platformMenu = pem.getPlatformMenu();
            employeeMenuVo.setMenuid(platformMenu.getId());
            employeeMenuVo.setMenuname(platformMenu.getMenuName());
            employeeMenuVo.setParentid(platformMenu.getParentId());
            employeeMenuVo.setDataLevels(platformMenu.getDataLevels());
            employeeMenuVo.setUrl(platformMenu.getGotoPageUrl());
            employeeMenuVo.setLevelSequence(platformMenu.getLevelSequence());
            employeeMenuVo.setIconCss(platformMenu.getIconCss());
            if (employeeMenuVo.getDataLevels() == 1) {
                returnList1.add(employeeMenuVo);
            } else if (employeeMenuVo.getDataLevels() == 2) {
                returnList2.add(employeeMenuVo);
            }
        }

        if (returnList1.size() > 0) {
            for (EmployeeMenuVo menuVo : returnList1) {
                treeGrid(returnList2, menuVo);
            }

        }
        return returnList1;
    }

    /**
     * 超级管理员获取全部菜单
     *
     * @return
     */
    public List<EmployeeMenuVo> menuListAll() {
        List<EmployeeMenuVo> returnList1 = new ArrayList<EmployeeMenuVo>();//存储1级菜单
        List<EmployeeMenuVo> returnList2 = new ArrayList<EmployeeMenuVo>();//存储2级菜单
        Sort s = new Sort(Sort.Direction.ASC, "levelSequence");
        List<PlatformMenu> pemList = platformMenuDao.findAll(s);
        PlatformMenu platformMenu = null;
        EmployeeMenuVo employeeMenuVo = null;
        for (PlatformMenu pem : pemList) {
            if (pem.getUseFlag() == true) {
                employeeMenuVo = new EmployeeMenuVo();
                employeeMenuVo.setMenuid(pem.getId());
                employeeMenuVo.setMenuname(pem.getMenuName());
                employeeMenuVo.setParentid(pem.getParentId());
                employeeMenuVo.setDataLevels(pem.getDataLevels());
                employeeMenuVo.setUrl(pem.getGotoPageUrl());
                employeeMenuVo.setLevelSequence(pem.getLevelSequence());
                employeeMenuVo.setIconCss(pem.getIconCss());
                if (employeeMenuVo.getDataLevels() == 1) {
                    returnList1.add(employeeMenuVo);
                } else if (employeeMenuVo.getDataLevels() == 2) {
                    returnList2.add(employeeMenuVo);
                }
            }
        }
        if (returnList1.size() > 0) {
            for (EmployeeMenuVo menuVo : returnList1) {
                treeGrid(returnList2, menuVo);
            }
        }
        return returnList1;
    }

    private EmployeeMenuVo treeGrid(List<EmployeeMenuVo> list, EmployeeMenuVo employeeMenuVo) {
        List<EmployeeMenuVo> childArray = new ArrayList<EmployeeMenuVo>();
        /*
         * 循环遍历原始数据列表，判断列表中某对象的父id值是否等于当前节点的id值，
		 * 如果相等，进入递归创建新节点的子节点，直至无子节点时，返回节点，并将该 节点放入当前节点的子节点列表中
		 */
        for (EmployeeMenuVo newNode : list) {
            if (newNode.getParentid() != null && newNode.getParentid().equals(employeeMenuVo.getMenuid())) {
                childArray.add(newNode);
            }
        }
        /*
         * 判断当前子节点数组是否为空，不为空将子节点数组加入children字段中
		 */
        if (!childArray.isEmpty()) {
            employeeMenuVo.setChildren(childArray);
        }
        return employeeMenuVo;
    }

    public void create(PlatformEmployeeMenu platformEmployeeMenu) {
        // TODO Auto-generated method stub

    }


    public void update(PlatformEmployeeMenu platformEmployeeMenu) {
        // TODO Auto-generated method stub

    }


    public PlatformEmployeeMenu findById(String id) {
        // TODO Auto-generated method stub
        return null;
    }

    @Transactional
    public void insert(List<EmployeeMenuVo> employeeMenuLi, String employeeCode) {
        platformEmployeeMenuDao.deleteByEmployeecode(employeeCode);
        if (employeeMenuLi != null && employeeMenuLi.size() > 0) {
            List<PlatformEmployeeMenu> list = new ArrayList<PlatformEmployeeMenu>();
            PlatformEmployee em = new PlatformEmployee();
            em.setEmployeeCode(employeeCode);
            for (EmployeeMenuVo employeeMenuVo : employeeMenuLi) {
                PlatformEmployeeMenu emMenu = new PlatformEmployeeMenu();
                PlatformMenu menu = new PlatformMenu();
                emMenu.setId(UUIDUtil.getUUID());
                emMenu.setPlatformEmployee(em);
                menu.setId(employeeMenuVo.getMenuid());
                emMenu.setPlatformMenu(menu);
                list.add(emMenu);
            }
            platformEmployeeMenuDao.save(list);
        }

    }


//    public EmployeeMenuVo treeGrid(List<EmployeeMenuVo> list, EmployeeMenuVo employeeMenuVo) {
//        List<EmployeeMenuVo> childArray = new ArrayList<EmployeeMenuVo>();
//        /*
//         * 循环遍历原始数据列表，判断列表中某对象的父id值是否等于当前节点的id值，
//		 * 如果相等，进入递归创建新节点的子节点，直至无子节点时，返回节点，并将该 节点放入当前节点的子节点列表中
//		 */
//        for (int i = 0; i < list.size(); i++) {
//            EmployeeMenuVo newNode = list.get(i);
//            if (newNode.getParentid() != null
//                    && newNode.getParentid().equals(employeeMenuVo.getMenuid())) {
//                EmployeeMenuVo childObj = treeGrid(list, newNode);
//                childArray.add(childObj);
//            }
//        }
//
//		/*
//         * 判断当前子节点数组是否为空，不为空将子节点数组加入children字段中
//		 */
//        if (!childArray.isEmpty()) {
//            employeeMenuVo.setChildren(childArray);
//        }
//        return employeeMenuVo;
//    }

    /**
     * 保存更新权限
     *
     * @param pathMenus
     * @param employeeId
     */
    @Transactional
    public void updateAuthMenu(String pathMenus, String employeeId) {
        PlatformEmployee employee = platformEmployeeDao.findById(employeeId);
//        会员信息正确
        if (employee != null) {
//            查询修改前有的权限
            List<PlatformEmployeeMenu> oldAuths = platformEmployeeMenuDao.allListByEmployeeId(employeeId);
            List<PlatformEmployeeMenu> auths = new ArrayList<PlatformEmployeeMenu>();
            if (oldAuths != null && oldAuths.size() > 0) {
//                删除权限
                for (PlatformEmployeeMenu p : oldAuths) {
                    String pMenuId = p.getPlatformMenu().getId();
//                    String pmId = p.getId();
                    if (!pathMenus.contains(pMenuId)) {
                        platformEmployeeMenuDao.deleteByEidMid(employeeId, pMenuId);
                        continue;
                    } else {
                        pathMenus = pathMenus.replace(pMenuId, "");
                        continue;
                    }
                }
            }
            if (!"".equals(pathMenus)) {//保存权限
                String[] newAuthMenus = pathMenus.split(",");
                for (int i = 0; i < newAuthMenus.length; i++) {
                    String menuId = newAuthMenus[i];
                    if (menuId != null && menuId.length() > 0) {
                        PlatformEmployeeMenu pem = new PlatformEmployeeMenu();
                        PlatformMenu pm = platformMenuDao.findOne(menuId);
                        pem.setPlatformEmployee(employee);
                        pem.setPlatformMenu(pm);
                        auths.add(pem);
                    }

                }
                platformEmployeeMenuDao.save(auths);
            }
        }

    }

}
