package com.rent.system.dao;

import com.rent.system.entity.PlatformSystemLog;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 操作日志记录DAO
 *
 * @author lgl
 */
@Repository
public interface PlatformSystemLogDao extends
        JpaRepository<PlatformSystemLog, String> {
    /**
     * 根据id删除，在service层需要加上事物注解
     *
     * @param id
     */
    @Query("delete from PlatformSystemLog c where c.id= :id")
    @Modifying
    public void deleteById(@Param("id") String id);

    /**
     * 根据访问时间排序，并进行分页。
     *
     * @param pageable
     * @return
     */
    @Transactional(readOnly = true)
    @Query("select c from PlatformSystemLog c order by c.operationTime desc")
    public List<PlatformSystemLog> findAllPagerDesc(Pageable pageable);

    /**
     * 根据访问时间排序，并进行分页。
     *
     * @param pageable
     * @return
     */
    @Transactional(readOnly = true)
    @Query("select c from PlatformSystemLog c order by c.operationTime asc")
    public List<PlatformSystemLog> findAllPagerAsc(Pageable pageable);



    /**
     * 删除某时间之前的数据
     *
     * @param date
     */
    @Query("delete from PlatformSystemLog c where c.operationTime<:operationTime")
    @Modifying
    public void deleteBeforeTime(@Param("operationTime") String date);
}
