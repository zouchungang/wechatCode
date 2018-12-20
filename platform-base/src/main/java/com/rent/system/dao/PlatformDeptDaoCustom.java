package com.rent.system.dao;

import com.rent.system.entity.PlatformDept;
import com.rent.system.vo.PlatformDeptVo;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 平台部门维护DAO -- 提供动态查询方法
 *
 * @author lgl
 */
public interface PlatformDeptDaoCustom {
    /**
     * 动态条件查询
     *
     * @param platformDept
     * @return
     */
    public List<PlatformDept> find(PlatformDeptVo platformDept, Pageable pageable, String sort, String order);

    /**
     * 动态条件合计总数
     *
     * @param platformDept
     * @return
     */
    public long count(PlatformDeptVo platformDept);
}
