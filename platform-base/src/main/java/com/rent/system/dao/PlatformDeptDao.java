package com.rent.system.dao;

import com.rent.system.entity.PlatformDept;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 平台部门维护DAO
 *
 * @author lgl
 */
@Repository
public interface PlatformDeptDao extends JpaRepository<PlatformDept, String>,
        PlatformDeptDaoCustom {
    /**
     * 根据id获取唯一记录
     *
     * @param id
     * @return
     */
    @Query("select c from PlatformDept c where c.id = :id")
    public PlatformDept findById(@Param("id") String id);

    /**
     * 根据id，删除一条记录，在service层需要加上事物注解
     *
     * @param id
     */
    @Query("delete from PlatformDept c where c.id= :id")
    @Modifying
    public void deleteById(@Param("id") String id);

//    /**
//     * 通过父类id获取子列表（不包括孙子节点）
//     *
//     * @param pid
//     * @return
//     */
//    @Query("select c from PlatformDept c where c.parentId = :pid")
//    public List<PlatformDept> findByPid(@Param("pid") String pid);

    /**
     * 获取所有可用的部门
     *
     * @return
     */
    @Query("select c from PlatformDept c where c.useFlag = true order by c.deptCode asc")
    public List<PlatformDept> findActiveAll();

    /**
     * 获取所有可用的部门并排序
     *
     * @return
     */
    @Query("select c from PlatformDept c order by c.dataSort asc")
    public List<PlatformDept> findAllBySort();

    /**
     * 根据编码查询数量
     *
     * @param code
     * @return
     */
    @Query("select count(t) from PlatformDept t where upper(t.deptCode) = upper(:code)")
    public Long findCountByCode(@Param("code") String code);

    /**
     * 根据部门名称获取记录数
     *
     * @param name
     * @return
     */
    @Query("select count(t) from PlatformDept t where t.deptName = upper(:name)")
    public Long findCountByName(@Param("name") String name);

    /**
     * 根据编码倒叙排列
     *
     * @return
     */
    @Query("select t.deptCode from PlatformDept t order by t.deptCode desc")
    public List<String> findOrderByCode();

    /**
     * 获取自定义序列值
     *
     * @return
     */
    @Query(value = "SELECT nextval('p_dept')", nativeQuery = true)
    public Integer getDataSortValue();
}
