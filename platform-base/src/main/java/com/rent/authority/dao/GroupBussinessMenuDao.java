package com.rent.authority.dao;

import com.rent.authority.entity.GroupBussinessMenu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2016-11-23.
 */
@Repository
public interface GroupBussinessMenuDao extends JpaRepository<GroupBussinessMenu,String>, GroupBussinessMenuDaoCustom {
    /**
     * 景区企业平台菜单权限组_id单个查询
     * @param id
     * @return
     */
    @Query("select t from GroupBussinessMenu t where t.id = :id")
    public GroupBussinessMenu findById(@Param("id") String id);

    /**
     * 景区企业平台菜单权限组_删除
     * @param id
     */
    @Modifying
    @Query("delete from GroupBussinessMenu t where t.id =:id")
    public void deleteById(@Param("id") String id);

    /**
     * 根据分组id删除对应权限
     * @param authorityGroupId
     */
    @Modifying
    @Query("delete from GroupBussinessMenu t where t.authorityGroup.id = :authorityGroupId")
    public void deleteByGroup(@Param("authorityGroupId") String authorityGroupId);


    @Query("select t.id from GroupBussinessMenu t where t.authorityGroup.id = :groupId")
    public List<String> findByGroup(@Param("groupId") String groupId);

    @Query("select t.id from GroupBussinessMenu t where t.bussinessMenu.id = :menuId")
    public List<String> findByMenuId(@Param("menuId") String menuId);
    /**
     * 获取企业所在的分组的权限
     * @param listCLG
     * @return
     */
    @Query("select t.bussinessMenu.id from GroupBussinessMenu t where t.authorityGroup.id in(:listCLG)")
    public List<String> findInGroups(@Param("listCLG") List<String> listCLG);

    /**
     * 获取企业所在的分组的权限
     * @param listCLG
     * @return
     */
    @Query("select t from GroupBussinessMenu t where t.authorityGroup.id in(:listCLG)")
    public List<GroupBussinessMenu> findInGroups2(@Param("listCLG") List<String> listCLG);

    /**
     * 根据分组与分类查询
     * @param authorityGroupId
     * @param bussinessType
     * @return
     */
    @Query("select t from GroupBussinessMenu t where t.authorityGroup.id =:authorityGroupId and t.bussinessMenu.bussinessType =:bussinessType")
    List<GroupBussinessMenu> findByGroupAndbussinessType(@Param("authorityGroupId") String authorityGroupId, @Param("bussinessType") int bussinessType);
}
