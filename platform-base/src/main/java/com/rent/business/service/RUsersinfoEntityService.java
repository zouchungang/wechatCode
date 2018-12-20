package com.rent.business.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.rent.business.dao.RUsersinfoEntityDao;
//import com.rent.business.service.RUsersinfoEntityService;
import com.rent.business.entity.RUsersinfoEntity;
import com.rent.business.vo.RUsersinfoEntityVo;
/**
* --service层
*
**/
@Service
public class RUsersinfoEntityService {
	private static Logger logger = LoggerFactory.getLogger(RUsersinfoEntityService.class);
	@Autowired
	private RUsersinfoEntityDao rUsersinfoEntityDao;
	/**
	* 根据id获取唯一记录
	*
	* @param id
	* @return
	*/
	public RUsersinfoEntity findById(String id){
		RUsersinfoEntity rUsersinfoEntity = rUsersinfoEntityDao.findById(id);
		return rUsersinfoEntity;
	}
	/**
	* 获取全部记录
	*
	* @return
	*/
	public List<RUsersinfoEntity> getAll(){
		List<RUsersinfoEntity> list = rUsersinfoEntityDao.findAll();
		return list;
	}
	/**
	* 获取分页数据，全部数据，没有查询条件
	*
	* @param pagerequest
	* @return
	*/
	public List<RUsersinfoEntity> getPage(PageRequest pagerequest){
		List<RUsersinfoEntity> list = rUsersinfoEntityDao.findAll(pagerequest).getContent();
		return list;
	}

    /**
    * 获取分页数据，有查询条件，有排序
    *
    * @param rUsersinfoEntityVo
    * @param pagerequest
    * @param sort
    * @param order
    * @return
    */
	public List<RUsersinfoEntity> find(RUsersinfoEntityVo rUsersinfoEntityVo, PageRequest pagerequest,String sort,String order){
		List<RUsersinfoEntity> list = rUsersinfoEntityDao.find(rUsersinfoEntityVo, pagerequest,sort,order);
		return list;
	}

	/**
	* 添加数据
	*
	* @param rUsersinfoEntity
	* @return
	*/
	public RUsersinfoEntity create(RUsersinfoEntity rUsersinfoEntity){
		RUsersinfoEntity savedRUsersinfoEntity = rUsersinfoEntityDao.save(rUsersinfoEntity);
		return savedRUsersinfoEntity;
	}
	/**
	* 批量添加数据
	*
	* @param rUsersinfoEntityList
	* @return
	*/
	public List<RUsersinfoEntity> batchcreate(List<RUsersinfoEntity> rUsersinfoEntityList){
		List<RUsersinfoEntity> relist = rUsersinfoEntityDao.save(rUsersinfoEntityList);
		return relist;
	}
	/**
	* 更新数据
	*
	* @param rUsersinfoEntity
	* @return
	*/
	public RUsersinfoEntity update(RUsersinfoEntity rUsersinfoEntity){
		RUsersinfoEntity savedRUsersinfoEntity = rUsersinfoEntityDao.save(rUsersinfoEntity);
		return savedRUsersinfoEntity;
	}
	/**
	* 删除数据，根据id做删除
	*
	* @param id
	*/
	public void delete(String id){
		rUsersinfoEntityDao.delete(id);
	}
	/**
	* 获取全部记录数
	*
	* @return
	*/
	public long getCount(){
		return rUsersinfoEntityDao.count();
	}

    /**
    * 根据查询添加获取记录数
    *
    * @param rUsersinfoEntityVo
    * @return
    */
	public long count(RUsersinfoEntityVo rUsersinfoEntityVo){
		long count = rUsersinfoEntityDao.count(rUsersinfoEntityVo);
		return count;
	}

}
