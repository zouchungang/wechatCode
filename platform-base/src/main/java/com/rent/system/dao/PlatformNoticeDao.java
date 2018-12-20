package com.rent.system.dao;

import com.rent.system.entity.PlatformNotice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 公告管理DAO
 *
 * @author lgl
 */
@Repository
public interface PlatformNoticeDao extends JpaRepository<PlatformNotice, String>,
        PlatformNoticeDaoCustom {
    @Query("delete from PlatformNotice t where t.id = :id")
    @Modifying
    void deleteById(@Param("id") String id);

    /**
     * 获取没有过期的通知公告
     *
     * @param date
     * @return
     */
    @Query(value = "SELECT t FROM PlatformNotice t where t.availabilityDate >=:date")
    List<PlatformNotice> findActiveList(@Param("date") String date);

    /**
     * @param date
     * @return
     */
    @Query(value = "SELECT COUNT(t.id) FROM p_notice t where t.availabilityDate >=:date", nativeQuery = true)
    Integer getActiveCount(@Param("date") String date);
}
