package com.rent.baseinfo.dao;

import com.rent.baseinfo.entity.Canton;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CantonDao extends JpaRepository<Canton, String>, CantonDaoCustom {
    /**
     * 根据ID查询出唯一记录
     * 如果id为1 是总根 中国
     *
     * @param id
     * @return
     */
    @Query("select c from Canton c where c.id = :id")
    public Canton findById(@Param("id") String id);

    /**
     * 根据父级id查询出列表
     *
     * @param pid
     * @return
     */
    @Query("select c from Canton c where c.parentId = :pid order by c.dataSort asc")
    public List<Canton> findByPid(@Param("pid") String pid);

    /**
     * 启禁用本级以下的区域
     * update K05productcard set cardstatus = :cardstatus where productcardid = :productcardid
     *
     * @param pid
     * @return
     */
    @Query("update Canton set useFlag =:useflag where parentId = :pid")
    public void usefulCanton(@Param("pid") String pid, @Param("useflag") int useflag);

    /**
     * 删除回收本级以下的区域
     * update K05productcard set cardstatus = :cardstatus where productcardid = :productcardid
     *
     * @param pid
     * @return
     */
    @Query("update Canton set useFlag =0  where parentId = :pid")
    public void delfulCanton(@Param("pid") String pid);

    /**
     * 根据父级id,code 查数量
     *
     * @param pid
     * @return
     */
    @Query("select count(c) from Canton c where c.parentId = :pid  and c.cantonCode = :cantonCode")
    public long findCountByPidCode(@Param("pid") String pid, @Param("cantonCode") String cantonCode);

    /**
     * 根据父级id,name 查数量
     *
     * @param pid
     * @return
     */
    @Query("select count(c) from Canton c where c.parentId = :pid  and c.cantonName = :cantonName")
    public long findCountByPidName(@Param("pid") String pid, @Param("cantonName") String cantonName);
}
