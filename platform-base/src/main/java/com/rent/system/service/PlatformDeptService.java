package com.rent.system.service;

import com.rent.common.Constants;
import com.rent.system.dao.PlatformDeptDao;
import com.rent.system.entity.PlatformDept;
import com.rent.system.vo.PlatformDeptVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PlatformDeptService {

    @Autowired
    private PlatformDeptDao deptDao;


    public List<PlatformDept> findALL() {
        return deptDao.findAll();
    }

    public List<PlatformDept> findAllBySort() {
        return deptDao.findAllBySort();
    }


    public void create(PlatformDept platformDept) {
        platformDept.setDataSort(deptDao.getDataSortValue());
        deptDao.save(platformDept);
    }


    public void update(PlatformDept platformDept) {
        deptDao.save(platformDept);
    }


    public PlatformDept findById(String id) {
        return deptDao.findById(id);
    }


    @Transactional
    public void deleteById(String id) {
        deptDao.deleteById(id);
    }


    public List<PlatformDept> find(PlatformDeptVo platformDept, Pageable pageable, String sort, String order) {
        return deptDao.find(platformDept, pageable, sort, order);
    }


    public long count(PlatformDeptVo platformDept) {
        return deptDao.count(platformDept);
    }


    public List<PlatformDept> findActiveALL() {
        return deptDao.findActiveAll();
    }


    public String updateUse(Boolean useflag, String[] deptids, String id) {
        PlatformDept platformDept = findById(id);
        if (!useflag) {// 如果是禁用
            for (int i = 0; i < deptids.length; i++) {
                PlatformDept bct = findById(deptids[i]);
                bct.setUseFlag(Constants.INACTIVE);
                update(bct);
            }
        } else {
            platformDept.setUseFlag(useflag);
            update(platformDept);
        }
        return "1";
    }

    /**
     * 根据部门编码获取记录数
     **/
    public long findCountByCode(String code) {
        long count = deptDao.findCountByCode(code);
        return count;
    }

    /**
     * 根据部门名称获取记录数
     **/
    public long findCountByName(String name) {
        long count = deptDao.findCountByName(name);
        return count;
    }


    public List<String> findOrderByCode() {
        return deptDao.findOrderByCode();
    }
}
