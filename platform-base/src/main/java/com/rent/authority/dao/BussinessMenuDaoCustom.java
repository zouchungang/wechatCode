package com.rent.authority.dao;

import com.rent.authority.entity.BussinessMenu;
import com.rent.authority.vo.BussinessMenuVo;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Created by sbd on 2016-11-23.
 */
public interface BussinessMenuDaoCustom {


    /**
     * 带查询条件的分页查询
     * pageable:分页参数，不需要分页就传入null
     * sort:排序参数 desc 或者asc，不需要就传入null需要和order配合使用
     * order:需要排序的字段，不需要就传入null需要和sort配合使用
     **/
    public List<BussinessMenu> find(BussinessMenuVo baseMenu, Pageable pageable, String sort, String order);

    /**
     * 带查询条件的查询数量
     **/
    public long count(BussinessMenuVo baseMenu);
}
