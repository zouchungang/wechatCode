package com.rent.system.dao;

import com.rent.system.entity.PlatformEmployee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 平台企业员工DAO
 *
 * @author lgl
 */
@Repository
public interface PlatformEmployeeDao extends JpaRepository<PlatformEmployee, String>,
        PlatformEmployeeDaoCustom {
    /**
     * 根据id获取唯一记录
     *
     * @param id
     * @return
     */
    @Query("select c from PlatformEmployee c where c.id=:id")
    public PlatformEmployee findById(@Param("id") String id);

    /**
     * 根据id，删除一条记录，在service层需要加上事物注解
     *
     * @param id
     */
    @Query("delete from PlatformEmployee c where c.id=:id")
    @Modifying
    public void deleteById(@Param("id") String id);

    /**
     * 根据登录employeecode和密码查询出唯一的登录人信息
     *
     * @param employeecode
     * @param pwd
     * @return
     */
    @Query("select c from PlatformEmployee c where c.employeeCode =:employeecode and c.pwd =:pwd")
    public PlatformEmployee getByEmployeecodeAndPwd(@Param("employeecode") String employeecode, @Param("pwd") String pwd);

    /**
     * 根据登录phone和密码查询出唯一的登录人信息
     *
     * @param phone
     * @param pwd
     * @return
     */
    @Query("select c from PlatformEmployee c where c.mobile =:phone and c.pwd =:pwd")
    public PlatformEmployee getByPhoneAndPwd(@Param("phone") String phone, @Param("pwd") String pwd);

    /**
     * 根据登录employeecode查询出唯一的登录人信息
     */
    @Query("select c from PlatformEmployee c where c.employeeCode =:employeecode")
    public List<PlatformEmployee> getByEmployeeCode(@Param("employeecode") String employeecode);

    /**
     * @param depts
     * @return
     */
    @Query("select c from PlatformEmployee c where c.platformDept.id in (:ids)")
    public List<PlatformEmployee> findBydepts(@Param("ids") String[] depts);

    /**
     * @param deptid
     * @return
     */
    @Query("select count(c) from PlatformEmployee c where c.platformDept.id = :deptid")
    public long findByDeptId(@Param("deptid") String deptid);

    /**
     * 修改状态
     *
     * @return
     */
    @Modifying
    @Query("update PlatformEmployee t set t.useFlag = :useflag where t.id = :id")
    public void updateUseFlag(@Param("id") String id, @Param("useflag") boolean useflag);

    /**
     * 根据编码查询数量
     *
     * @param code
     * @return
     */
    @Query("select count(t) from PlatformEmployee t where upper(t.employeeCode) = upper(:code)")
    public Long findCountByCode(@Param("code") String code);

    /**
     * @param mobile
     * @return
     */
    @Query("select t from PlatformEmployee t where t.mobile=:mobile ")
    public List<PlatformEmployee> findMobile(@Param("mobile") String mobile);

    /**
     * @param id
     * @param mobile
     * @return
     */
    @Query("select count(t.id) from PlatformEmployee t where t.mobile=:mobile and t.id!=:id")
    public long findIdAndMobile(@Param("id") String id, @Param("mobile") String mobile);
}
