package com.rent.baseinfo.dao;

import com.rent.baseinfo.entity.PayMode;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface PayModeDaoCustom {
    /**
     * 动态条件查询支付方式
     *
     * @param payMode
     * @return
     */
    public List<PayMode> find(PayMode payMode, Pageable pageable);

    /**
     * 动态查询支付方式数分页使用的总数量
     *
     * @param payMode
     * @return
     */
    public long count(PayMode payMode);
}
