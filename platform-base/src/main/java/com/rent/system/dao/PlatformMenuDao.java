package com.rent.system.dao;

import com.rent.system.entity.PlatformMenu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 系统管理--菜单管理功能DAO
 *
 * @author lgl
 */
@Repository
public interface PlatformMenuDao extends JpaRepository<PlatformMenu, String>,
        PlatformMenuDaoCustom {
    /**
     * 根据id查询出单一一条记录
     *
     * @param id
     * @return
     */
    @Query("select c from PlatformMenu c where c.id = :id")
    public PlatformMenu findById(@Param("id") String id);

    /**
     * 根据父类id查询出父类下的子类
     *
     * @param pid
     * @return
     */
    @Query("select c from PlatformMenu c where c.dataLevels = 2 and c.parentId = :pid  order by c.levelSequence asc")
    public List<PlatformMenu> findByPid(@Param("pid") String pid);

    /**
     * 根据功能分类查询列表
     *
     * @param type
     * @return
     */
    @Query("select c from PlatformMenu c where c.functionType = :type order by c.levelSequence asc")
    public List<PlatformMenu> findByType(@Param("type") Integer type);

    /**
     * 根据功能分类查询列表
     *
     * @param dataLevels
     * @return
     */
    @Query("select c from PlatformMenu c where c.dataLevels = :dataLevels and c.useFlag=true order by c.levelSequence asc")
    public List<PlatformMenu> menuByLevel(@Param("dataLevels") Integer dataLevels);

    /**
     * @return
     */
    @Query("select a from PlatformMenu a where a.id in "
            + "(select x.platformMenu.id from PlatformEmployeeMenu x where  x.platformEmployee.employeeCode='system') and a.useFlag=true")
    public List<PlatformMenu> findMenuForSys();

    /**
     * @return
     */
    @Query("select c from PlatformMenu c order by c.levelSequence asc")
    public List<PlatformMenu> findByAsc();

    /**
     * @param ins
     */
    @Modifying
    @Query("update PlatformMenu c set c.useFlag=false where c.id in(:ins)")
    public void batchForbidden(@Param("ins") List<String> ins);


    /**
     * 根据id 修改状态
     *
     * @return
     */
    @Modifying
    @Query("update PlatformMenu t set t.useFlag = :useflag where t.id = :id")
    public void updateUseFlag(@Param("id") String id, @Param("useflag") boolean useflag);

    /**
     * 根据父类id查询出父类下的子类
     *
     * @param pid
     * @return
     */
    @Query("select count(t) from PlatformMenu t where t.parentId = upper(:pid) and t.menuName = :name  ")
    public long findCountByPidName(@Param("pid") String pid, @Param("name") String name);
}
