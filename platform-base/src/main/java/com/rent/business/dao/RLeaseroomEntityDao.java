package com.rent.business.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.rent.business.entity.RLeaseroomEntity;
/**
*
* --DAO层
*
**/
@Repository
public interface RLeaseroomEntityDao extends JpaRepository<RLeaseroomEntity, String>, RLeaseroomEntityDaoCustom {

    /**
    * 根据主键获取唯一记录
    * @param id
    * @return
    */
    @Query("select t from RLeaseroomEntity t where t.id = :id")
    public RLeaseroomEntity findById(@Param("id") String id);

}
