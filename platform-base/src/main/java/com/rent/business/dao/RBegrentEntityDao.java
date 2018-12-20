package com.rent.business.dao;

import com.rent.business.entity.RBegrentEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
/**
*
* --DAO层
*
**/
@Repository
public interface RBegrentEntityDao extends JpaRepository<RBegrentEntity, String>, RBegrentEntityDaoCustom {

    /**
    * 根据主键获取唯一记录
    * @param id
    * @return
    */
    @Query("select t from RBegrentEntity t where t.id = :id")
    public RBegrentEntity findById(@Param("id") String id);

}
