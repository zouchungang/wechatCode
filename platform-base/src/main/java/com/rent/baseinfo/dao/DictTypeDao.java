package com.rent.baseinfo.dao;

import com.rent.baseinfo.entity.DictType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface DictTypeDao extends JpaRepository<DictType, String>{
    /**
     * @param id
     * @return
     */
    @Query("select c from DictType c where c.id = :id")
    public DictType findById(@Param("id") String id);

    /**
     * @param id
     */
    @Query("delete from DictType c where c.id= :id")
    @Modifying
    public void deleteById(@Param("id") String id);
}
