package com.rent.baseinfo.dao;

import com.rent.baseinfo.entity.Dict;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface DictDaoCustom {
    /**
     * 动态条件查询地区
     *
     * @param dict
     * @return
     */
    public List<Dict> find(Dict dict, Pageable pageable, String sort, String order);

    /**
     * 动态查询地区数分页使用的总数量
     *
     * @param dict
     * @return
     */
    public long count(Dict dict);
}
