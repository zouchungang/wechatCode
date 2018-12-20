package com.rent.business.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.rent.business.dao.RChooseroomEntityDao;
//import com.rent.business.service.RChooseroomEntityService;
import com.rent.business.entity.RChooseroomEntity;
import com.rent.business.vo.RChooseroomEntityVo;
/**
* --service层
*
**/
@Service
public class RChooseroomEntityService {
	private static Logger logger = LoggerFactory.getLogger(RChooseroomEntityService.class);
	@Autowired
	private RChooseroomEntityDao rChooseroomEntityDao;
	/**
	* 根据id获取唯一记录
	*
	* @param id
	* @return
	*/
	public RChooseroomEntity findById(String id){
		RChooseroomEntity rChooseroomEntity = rChooseroomEntityDao.findById(id);
		return rChooseroomEntity;
	}
	/**
	* 获取全部记录
	*
	* @return
	*/
	public List<RChooseroomEntity> getAll(){
		List<RChooseroomEntity> list = rChooseroomEntityDao.findAll();
		return list;
	}
	/**
	* 获取分页数据，全部数据，没有查询条件
	*
	* @param pagerequest
	* @return
	*/
	public List<RChooseroomEntity> getPage(PageRequest pagerequest){
		List<RChooseroomEntity> list = rChooseroomEntityDao.findAll(pagerequest).getContent();
		return list;
	}

    /**
    * 获取分页数据，有查询条件，有排序
    *
    * @param rChooseroomEntityVo
    * @param pagerequest
    * @param sort
    * @param order
    * @return
    */
	public List<RChooseroomEntity> find(RChooseroomEntityVo rChooseroomEntityVo, PageRequest pagerequest,String sort,String order){
		List<RChooseroomEntity> list = rChooseroomEntityDao.find(rChooseroomEntityVo, pagerequest,sort,order);
		return list;
	}

	/**
	* 添加数据
	*
	* @param rChooseroomEntity
	* @return
	*/
	public RChooseroomEntity create(RChooseroomEntity rChooseroomEntity){
		RChooseroomEntity savedRChooseroomEntity = rChooseroomEntityDao.save(rChooseroomEntity);
		return savedRChooseroomEntity;
	}
	/**
	* 批量添加数据
	*
	* @param rChooseroomEntityList
	* @return
	*/
	public List<RChooseroomEntity> batchcreate(List<RChooseroomEntity> rChooseroomEntityList){
		List<RChooseroomEntity> relist = rChooseroomEntityDao.save(rChooseroomEntityList);
		return relist;
	}
	/**
	* 更新数据
	*
	* @param rChooseroomEntity
	* @return
	*/
	public RChooseroomEntity update(RChooseroomEntity rChooseroomEntity){
		RChooseroomEntity savedRChooseroomEntity = rChooseroomEntityDao.save(rChooseroomEntity);
		return savedRChooseroomEntity;
	}
	/**
	* 删除数据，根据id做删除
	*
	* @param id
	*/
	public void delete(String id){
		rChooseroomEntityDao.delete(id);
	}
	/**
	* 获取全部记录数
	*
	* @return
	*/
	public long getCount(){
		return rChooseroomEntityDao.count();
	}

    /**
    * 根据查询添加获取记录数
    *
    * @param rChooseroomEntityVo
    * @return
    */
	public long count(RChooseroomEntityVo rChooseroomEntityVo){
		long count = rChooseroomEntityDao.count(rChooseroomEntityVo);
		return count;
	}

}
