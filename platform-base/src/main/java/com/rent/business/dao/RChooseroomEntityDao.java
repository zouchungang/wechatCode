package com.rent.business.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.rent.business.entity.RChooseroomEntity;
/**
*
* --DAO层
*
**/
@Repository
public interface RChooseroomEntityDao extends JpaRepository<RChooseroomEntity, String>, RChooseroomEntityDaoCustom {

    /**
    * 根据主键获取唯一记录
    * @param id
    * @return
    */
    @Query("select t from RChooseroomEntity t where t.id = :id")
    public RChooseroomEntity findById(@Param("id") String id);

}
