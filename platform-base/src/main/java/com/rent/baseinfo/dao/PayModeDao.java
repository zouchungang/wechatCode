package com.rent.baseinfo.dao;

import com.rent.baseinfo.entity.PayMode;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PayModeDao extends JpaRepository<PayMode, String>, PayModeDaoCustom {
    /**
     * 根据ID查询出唯一记录
     *
     * @param id
     * @return
     */
    @Query("select c from PayMode c where c.id = :id")
    public PayMode findById(@Param("id") String id);

    /**
     *
     * @param id
     * @return
     */
    @Query("select c from PayMode c where c.paymodeCode = :code")
    public PayMode findBycode(@Param("code") String id);
}
