package com.rent.system.dao;

import com.rent.system.entity.PlatformEmployee;
import com.rent.system.vo.PlatformEmployeeVo;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 平台企业员工DAO--动态查询
 *
 * @author lgl
 */
public interface PlatformEmployeeDaoCustom {
    /**
     * 动态条件查询
     *
     * @param platformEmployeeVo
     * @param pageable
     * @return
     */
    public List<PlatformEmployee> find(PlatformEmployeeVo platformEmployeeVo, Pageable pageable, String sort, String order);

    /**
     * 动态条件合计总数
     *
     * @param platformEmployeeVo
     * @return
     */
    public long count(PlatformEmployeeVo platformEmployeeVo);
}
