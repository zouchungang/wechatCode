package com.rent.authority.dao;


import com.rent.authority.entity.AuthorityGroup;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Created by Administrator on 2016/11/18 0018.
 */
public interface AuthorityGroupDaoCustom {
    /**
     * 动态查询
     * @param pageable
     * @param sort
     * @param order
     * @return
     */
    public List<AuthorityGroup> find(AuthorityGroup authorityGroup, Pageable pageable, String sort, String order);

    /**
     * 动态 合计总数
     * @return
     */
    public long count(AuthorityGroup authorityGroup);

}
