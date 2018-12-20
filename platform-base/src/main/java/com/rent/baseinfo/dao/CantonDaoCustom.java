package com.rent.baseinfo.dao;

import com.rent.baseinfo.entity.Canton;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CantonDaoCustom {
    /**
     * 动态条件查询地区
     *
     * @param canton
     * @return
     */
    public List<Canton> find(Canton canton, Pageable pageable, String sort, String order);

    /**
     * 动态查询地区数分页使用的总数量
     *
     * @param canton
     * @return
     */
    public long count(Canton canton);
}
