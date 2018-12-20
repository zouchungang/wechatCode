package com.rent.authority.dao;

import com.rent.authority.entity.BussinessMenu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by sbd on 2016-11-23.
 */
@Repository
public interface BussinessMenuDao extends JpaRepository<BussinessMenu, String>, BussinessMenuDaoCustom {


    /**
     * 景区企业平台菜单_id单个查询
     * @param id
     * @return
     */
    @Query("select t from BussinessMenu t where t.id = :id")
    public BussinessMenu findById(@Param("id") String id);

    /**
     * 景区企业平台菜单_删除
     * @param id
     */
    @Modifying
    @Query("delete from BussinessMenu t where t.id = :id")
    public void deleteById(@Param("id") String id);

    @Query("select t from BussinessMenu t where t.id in(:listGBM) and t.useFlag = true and t.bussinessType =:type and t.dataLevels =:Level order by t.dataSort asc")
    List<BussinessMenu> findInMenuIds(@Param("listGBM") List<String> listGBM, @Param("type") int type, @Param("Level") int Level);

    @Query("select t from BussinessMenu t where t.id in(:listGBM) and t.useFlag = true and t.bussinessType =:type order by t.dataSort asc")
    List<BussinessMenu> findInMenuIds(@Param("listGBM") List<String> listGBM, @Param("type") int type);

    @Query("select t from BussinessMenu t where t.id in(:listGBM) and t.useFlag = true order by t.dataSort asc")
    List<BussinessMenu> findInMenuIds(@Param("listGBM") List<String> listGBM);

    @Query("select count(t) from BussinessMenu t where t.menuName = upper(:name) and t.parentId =:pid")
    public Long findCountByName(@Param("name") String name, @Param("pid") String pid);
}
