package com.rent.business.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.rent.business.entity.RImagetableEntity;
/**
*
* --DAO层
*
**/
@Repository
public interface RImagetableEntityDao extends JpaRepository<RImagetableEntity, String>, RImagetableEntityDaoCustom {

    /**
    * 根据主键获取唯一记录
    * @param id
    * @return
    */
    @Query("select t from RImagetableEntity t where t.id = :id")
    public RImagetableEntity findById(@Param("id") String id);

}
