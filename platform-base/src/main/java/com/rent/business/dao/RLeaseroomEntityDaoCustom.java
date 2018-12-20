package com.rent.business.dao;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.rent.business.entity.RLeaseroomEntity;
import com.rent.business.vo.RLeaseroomEntityVo;
/**
*--自定义查询接口
*
**/
public interface RLeaseroomEntityDaoCustom {
/**
* 带查询条件的分页查询
*
* @param rLeaseroomEntityVo 查询条件
* @param pageable 分页参数，不需要分页就传入null
* @param sort     排序参数 desc 或者asc，不需要就传入null需要和order配合使用
* @param order    需要排序的字段，不需要就传入null需要和sort配合使用
* @return
*/
public List<RLeaseroomEntity> find(RLeaseroomEntityVo rLeaseroomEntityVo, Pageable pageable,String sort,String order);
/**
*
* @param rLeaseroomEntityVo 查询条件
* @return
*/
public long count(RLeaseroomEntityVo rLeaseroomEntityVo);
}
