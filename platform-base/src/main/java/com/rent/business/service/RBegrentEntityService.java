package com.rent.business.service;

import com.rent.business.dao.RBegrentEntityDao;
import com.rent.business.entity.RBegrentEntity;
import com.rent.business.vo.RBegrentEntityVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

//import com.rent.business.service.RBegrentEntityService;
/**
* --service层
*
**/
@Service
public class RBegrentEntityService {
	private static Logger logger = LoggerFactory.getLogger(RBegrentEntityService.class);
	@Autowired
	private RBegrentEntityDao rBegrentEntityDao;
	/**
	* 根据id获取唯一记录
	*
	* @param id
	* @return
	*/
	public RBegrentEntity findById(String id){
		RBegrentEntity rBegrentEntity = rBegrentEntityDao.findById(id);
		return rBegrentEntity;
	}
	/**
	* 获取全部记录
	*
	* @return
	*/
	public List<RBegrentEntity> getAll(){
		List<RBegrentEntity> list = rBegrentEntityDao.findAll();
		return list;
	}
	/**
	* 获取分页数据，全部数据，没有查询条件
	*
	* @param pagerequest
	* @return
	*/
	public List<RBegrentEntity> getPage(PageRequest pagerequest){
		List<RBegrentEntity> list = rBegrentEntityDao.findAll(pagerequest).getContent();
		return list;
	}

    /**
    * 获取分页数据，有查询条件，有排序
    *
    * @param rBegrentEntityVo
    * @param pagerequest
    * @param sort
    * @param order
    * @return
    */
	public List<RBegrentEntity> find(RBegrentEntityVo rBegrentEntityVo, PageRequest pagerequest,String sort,String order){
		List<RBegrentEntity> list = rBegrentEntityDao.find(rBegrentEntityVo, pagerequest,sort,order);
		return list;
	}

	/**
	* 添加数据
	*
	* @param rBegrentEntity
	* @return
	*/
	public RBegrentEntity create(RBegrentEntity rBegrentEntity){
		RBegrentEntity savedRBegrentEntity = rBegrentEntityDao.save(rBegrentEntity);
		return savedRBegrentEntity;
	}
	/**
	* 批量添加数据
	*
	* @param rBegrentEntityList
	* @return
	*/
	public List<RBegrentEntity> batchcreate(List<RBegrentEntity> rBegrentEntityList){
		List<RBegrentEntity> relist = rBegrentEntityDao.save(rBegrentEntityList);
		return relist;
	}
	/**
	* 更新数据
	*
	* @param rBegrentEntity
	* @return
	*/
	public RBegrentEntity update(RBegrentEntity rBegrentEntity){
		RBegrentEntity savedRBegrentEntity = rBegrentEntityDao.save(rBegrentEntity);
		return savedRBegrentEntity;
	}
	/**
	* 删除数据，根据id做删除
	*
	* @param id
	*/
	public void delete(String id){
		rBegrentEntityDao.delete(id);
	}
	/**
	* 获取全部记录数
	*
	* @return
	*/
	public long getCount(){
		return rBegrentEntityDao.count();
	}

    /**
    * 根据查询添加获取记录数
    *
    * @param rBegrentEntityVo
    * @return
    */
	public long count(RBegrentEntityVo rBegrentEntityVo){
		long count = rBegrentEntityDao.count(rBegrentEntityVo);
		return count;
	}

}
