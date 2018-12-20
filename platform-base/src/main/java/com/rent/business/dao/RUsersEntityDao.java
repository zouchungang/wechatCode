package com.rent.business.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.rent.business.entity.RUsersEntity;
/**
*
* --DAO层
*
**/
@Repository
public interface RUsersEntityDao extends JpaRepository<RUsersEntity, String>, RUsersEntityDaoCustom {

    /**
    * 根据主键获取唯一记录
    * @param id
    * @return
    */
    @Query("select t from RUsersEntity t where t.id = :id")
    public RUsersEntity findById(@Param("id") String id);

    /**
    * 判断用户名是否存在
    * @param uname
    * @return
    */
    @Query("select t from RUsersEntity t where t.uname = :uname")
    public RUsersEntity findByName(@Param("uname") String uname);

    /**
    * 根据主键获取唯一记录
    * @param uname
    * @param upwd
    * @return
    */
    @Query("select t from RUsersEntity t where t.uname = :uname and t.upwd= :upwd")
    public RUsersEntity findByUnameAndUpwd(@Param("uname") String uname,@Param("upwd")String upwd);

}
