package com.rent.system.dao;

import com.rent.system.entity.PlatformEmployeeMenu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 平台员工权限DAO
 *
 * @author lgl
 */
@Repository
public interface PlatformEmployeeMenuDao extends
        JpaRepository<PlatformEmployeeMenu, String>, PlatformEmployeeMenuDaoCustom {

    /**
     * 根据employeecode（主键）删除记录
     *
     * @param employeecode
     * @return
     */
    @Query("delete from PlatformEmployeeMenu c where c.platformEmployee.employeeCode = :employeecode")
    @Modifying
    public void deleteByEmployeecode(@Param("employeecode") String employeecode);

    /**
     * 根据employeecode（主键）删除记录
     *
     * @param empid  员工id
     * @param mid    菜单id
     * @return
     */
    @Query("delete from PlatformEmployeeMenu c where c.platformEmployee.id = :empid and c.platformMenu.id = :mid")
    @Modifying
    public void deleteByEidMid(@Param("empid") String empid, @Param("mid") String mid);

    /**
     * 根据员工id查询员工权限
     * @param id
     * @return
     */
    @Query("select c from PlatformEmployeeMenu c where c.platformEmployee.id = :id")
    public List<PlatformEmployeeMenu> allListByEmployeeId(@Param("id") String id);

    /**
     * 根据员工id查询员工权限(只查启用状态)
     * @param id
     * @return
     */
    @Query("select c from PlatformEmployeeMenu c where c.platformEmployee.id = :id and c.platformMenu.useFlag = true order by c.platformMenu.levelSequence asc ")
    public List<PlatformEmployeeMenu> canUseListByEmployeeId(@Param("id") String id);

}
