package com.rent.system.service;

import com.rent.system.dao.PlatformMenuDao;
import com.rent.system.entity.PlatformMenu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PlatformMenuService {
    @Autowired
    private PlatformMenuDao platformMenuDao;

    public List<PlatformMenu> findAll() {
        // TODO Auto-generated method stub
        return platformMenuDao.findAll();
    }


    public List<PlatformMenu> find(PlatformMenu platformMenu, Pageable page, String sort, String order) {
        // TODO Auto-generated method stub
        return platformMenuDao.find(platformMenu, page, sort, order);
    }


    public void create(PlatformMenu platformMenu) {
        // TODO Auto-generated method stub
        platformMenuDao.save(platformMenu);
    }


    public void update(PlatformMenu platformMenu) {
        // TODO Auto-generated method stub
        platformMenuDao.save(platformMenu);
    }


    public PlatformMenu findById(String id) {
        // TODO Auto-generated method stub
        return platformMenuDao.findById(id);
    }


    public void deleteById(String id) {
        // TODO Auto-generated method stub
        platformMenuDao.delete(id);
    }

    public List<PlatformMenu> findByPid(String pid) {
        // TODO Auto-generated method stub
        return platformMenuDao.findByPid(pid);
    }

    public List<PlatformMenu> findByType(Integer type) {
        // TODO Auto-generated method stub
        return platformMenuDao.findByType(type);
    }

    public List<PlatformMenu> menuByLevel(Integer type) {
        // TODO Auto-generated method stub
        return platformMenuDao.menuByLevel(type);
    }

    /**
     * 根据id 修改 状态
     *
     * @return
     */
    @Transactional
    public boolean updateUseFlag(String id, boolean useFlag) {
        try {
            platformMenuDao.updateUseFlag(id, useFlag);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    /**
     * 根据父id和名字获取记录数
     **/
    public long findCountByPidName(String pId, String name) {
        long count = platformMenuDao.findCountByPidName(pId, name);
        return count;
    }

}
