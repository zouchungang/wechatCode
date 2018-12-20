package com.rent.business.dao;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.rent.business.entity.RChooseroomEntity;
import com.rent.business.vo.RChooseroomEntityVo;
/**
*--自定义查询接口
*
**/
public interface RChooseroomEntityDaoCustom {
/**
* 带查询条件的分页查询
*
* @param rChooseroomEntityVo 查询条件
* @param pageable 分页参数，不需要分页就传入null
* @param sort     排序参数 desc 或者asc，不需要就传入null需要和order配合使用
* @param order    需要排序的字段，不需要就传入null需要和sort配合使用
* @return
*/
public List<RChooseroomEntity> find(RChooseroomEntityVo rChooseroomEntityVo, Pageable pageable,String sort,String order);
/**
*
* @param rChooseroomEntityVo 查询条件
* @return
*/
public long count(RChooseroomEntityVo rChooseroomEntityVo);
}
