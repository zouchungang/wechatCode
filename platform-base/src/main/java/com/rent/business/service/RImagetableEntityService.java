package com.rent.business.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.rent.business.dao.RImagetableEntityDao;
//import com.rent.business.service.RImagetableEntityService;
import com.rent.business.entity.RImagetableEntity;
import com.rent.business.vo.RImagetableEntityVo;
/**
* --service层
*
**/
@Service
public class RImagetableEntityService {
	private static Logger logger = LoggerFactory.getLogger(RImagetableEntityService.class);
	@Autowired
	private RImagetableEntityDao rImagetableEntityDao;
	/**
	* 根据id获取唯一记录
	*
	* @param id
	* @return
	*/
	public RImagetableEntity findById(String id){
		RImagetableEntity rImagetableEntity = rImagetableEntityDao.findById(id);
		return rImagetableEntity;
	}
	/**
	* 获取全部记录
	*
	* @return
	*/
	public List<RImagetableEntity> getAll(){
		List<RImagetableEntity> list = rImagetableEntityDao.findAll();
		return list;
	}
	/**
	* 获取分页数据，全部数据，没有查询条件
	*
	* @param pagerequest
	* @return
	*/
	public List<RImagetableEntity> getPage(PageRequest pagerequest){
		List<RImagetableEntity> list = rImagetableEntityDao.findAll(pagerequest).getContent();
		return list;
	}

    /**
    * 获取分页数据，有查询条件，有排序
    *
    * @param rImagetableEntityVo
    * @param pagerequest
    * @param sort
    * @param order
    * @return
    */
	public List<RImagetableEntity> find(RImagetableEntityVo rImagetableEntityVo, PageRequest pagerequest,String sort,String order){
		List<RImagetableEntity> list = rImagetableEntityDao.find(rImagetableEntityVo, pagerequest,sort,order);
		return list;
	}

	/**
	* 添加数据
	*
	* @param rImagetableEntity
	* @return
	*/
	public RImagetableEntity create(RImagetableEntity rImagetableEntity){
		RImagetableEntity savedRImagetableEntity = rImagetableEntityDao.save(rImagetableEntity);
		return savedRImagetableEntity;
	}
	/**
	* 批量添加数据
	*
	* @param rImagetableEntityList
	* @return
	*/
	public List<RImagetableEntity> batchcreate(List<RImagetableEntity> rImagetableEntityList){
		List<RImagetableEntity> relist = rImagetableEntityDao.save(rImagetableEntityList);
		return relist;
	}
	/**
	* 更新数据
	*
	* @param rImagetableEntity
	* @return
	*/
	public RImagetableEntity update(RImagetableEntity rImagetableEntity){
		RImagetableEntity savedRImagetableEntity = rImagetableEntityDao.save(rImagetableEntity);
		return savedRImagetableEntity;
	}
	/**
	* 删除数据，根据id做删除
	*
	* @param id
	*/
	public void delete(String id){
		rImagetableEntityDao.delete(id);
	}
	/**
	* 获取全部记录数
	*
	* @return
	*/
	public long getCount(){
		return rImagetableEntityDao.count();
	}

    /**
    * 根据查询添加获取记录数
    *
    * @param rImagetableEntityVo
    * @return
    */
	public long count(RImagetableEntityVo rImagetableEntityVo){
		long count = rImagetableEntityDao.count(rImagetableEntityVo);
		return count;
	}

}
