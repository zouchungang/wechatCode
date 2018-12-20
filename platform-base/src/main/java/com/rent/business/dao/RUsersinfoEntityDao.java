package com.rent.business.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.rent.business.entity.RUsersinfoEntity;
/**
*
* --DAO层
*
**/
@Repository
public interface RUsersinfoEntityDao extends JpaRepository<RUsersinfoEntity, String>, RUsersinfoEntityDaoCustom {

    /**
    * 根据主键获取唯一记录
    * @param id
    * @return
    */
    @Query("select t from RUsersinfoEntity t where t.id = :id")
    public RUsersinfoEntity findById(@Param("id") String id);

}
