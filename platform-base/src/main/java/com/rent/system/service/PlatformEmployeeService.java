package com.rent.system.service;

import com.rent.system.dao.PlatformEmployeeDao;
import com.rent.system.entity.PlatformEmployee;
import com.rent.system.vo.PlatformEmployeeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PlatformEmployeeService {
    @Autowired
    private PlatformEmployeeDao platformEmployeeDao;

    /**
     * @return
     */
    public List<PlatformEmployee> findALL() {
        return platformEmployeeDao.findAll();
    }

    /**
     * @param platformEmployee
     */
    public void create(PlatformEmployee platformEmployee) {
        platformEmployeeDao.save(platformEmployee);
    }

    /**
     * @param platformEmployee
     */
    public void update(PlatformEmployee platformEmployee) {
        platformEmployeeDao.save(platformEmployee);
    }

    /**
     * @param id
     * @return
     */
    public PlatformEmployee findById(String id) {
        return platformEmployeeDao.findById(id);
    }

    /**
     * @param id
     */
    public void deleteById(String id) {
        platformEmployeeDao.deleteById(id);
    }

    /**
     * @param platformEmployeeVo
     * @param pageable
     * @param sort
     * @param order
     * @return
     */
    public List<PlatformEmployee> find(PlatformEmployeeVo platformEmployeeVo, Pageable pageable, String sort, String order) {
        return platformEmployeeDao.find(platformEmployeeVo, pageable, sort, order);
    }

    /**
     * @param platformEmployeeVo
     * @return
     */
    public long count(PlatformEmployeeVo platformEmployeeVo) {
        return platformEmployeeDao.count(platformEmployeeVo);
    }

    /**
     * 根据用户名密码获取唯一用户信息
     *
     * @param usename
     * @param pwd
     * @return
     */
    public PlatformEmployee getByEmployeecodeAndPwd(String usename, String pwd) {
        return platformEmployeeDao.getByEmployeecodeAndPwd(usename, pwd);
    }

    /**
     * 根据手机号码获取唯一用户信息
     *
     * @param phone
     * @param pwd
     * @return
     */
    public PlatformEmployee getByPhoneAndPwd(String phone, String pwd) {
        return platformEmployeeDao.getByPhoneAndPwd(phone, pwd);
    }

    /**
     * @param employeecode
     * @return
     */
    public List<PlatformEmployee> getByEmployeeCode(String employeecode) {
        return platformEmployeeDao.getByEmployeeCode(employeecode);
    }

    /**
     * @param platformEmployee
     */
    @Transactional
    public void save(PlatformEmployee platformEmployee) {
        platformEmployeeDao.save(platformEmployee);
    }


    /**
     * @param depts
     * @return
     */
    public List<PlatformEmployee> findBydepts(String[] depts) {
        return platformEmployeeDao.findBydepts(depts);
    }

    /**
     * @param deptId
     * @return
     */
    public long findByDeptId(String deptId) {
        return platformEmployeeDao.findByDeptId(deptId);
    }

    /**
     * 根据id 修改 状态
     *
     * @return
     */
    @Transactional
    public boolean updateUseFlag(String id, boolean useFlag) {
        try {
            platformEmployeeDao.updateUseFlag(id, useFlag);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 根据查询添加获取记录数
     **/
    public long findCountByCode(String code) {
        long count = platformEmployeeDao.findCountByCode(code);
        return count;
    }

    /**
     * @param mobile
     * @return
     */
    public List<PlatformEmployee> findMobile(String mobile) {
        return platformEmployeeDao.findMobile(mobile);
    }

    /**
     * @param id
     * @param mobile
     * @return
     */
    public long findIdAndMobile(String id, String mobile) {
        return platformEmployeeDao.findIdAndMobile(id, mobile);
    }
}
