package com.rent.business.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.rent.business.dao.RLeaseroomEntityDao;
//import com.rent.business.service.RLeaseroomEntityService;
import com.rent.business.entity.RLeaseroomEntity;
import com.rent.business.vo.RLeaseroomEntityVo;
/**
* --service层
*
**/
@Service
public class RLeaseroomEntityService {
	private static Logger logger = LoggerFactory.getLogger(RLeaseroomEntityService.class);
	@Autowired
	private RLeaseroomEntityDao rLeaseroomEntityDao;
	/**
	* 根据id获取唯一记录
	*
	* @param id
	* @return
	*/
	public RLeaseroomEntity findById(String id){
		RLeaseroomEntity rLeaseroomEntity = rLeaseroomEntityDao.findById(id);
		return rLeaseroomEntity;
	}
	/**
	* 获取全部记录
	*
	* @return
	*/
	public List<RLeaseroomEntity> getAll(){
		List<RLeaseroomEntity> list = rLeaseroomEntityDao.findAll();
		return list;
	}
	/**
	* 获取分页数据，全部数据，没有查询条件
	*
	* @param pagerequest
	* @return
	*/
	public List<RLeaseroomEntity> getPage(PageRequest pagerequest){
		List<RLeaseroomEntity> list = rLeaseroomEntityDao.findAll(pagerequest).getContent();
		return list;
	}

    /**
    * 获取分页数据，有查询条件，有排序
    *
    * @param rLeaseroomEntityVo
    * @param pagerequest
    * @param sort
    * @param order
    * @return
    */
	public List<RLeaseroomEntity> find(RLeaseroomEntityVo rLeaseroomEntityVo, PageRequest pagerequest,String sort,String order){
		List<RLeaseroomEntity> list = rLeaseroomEntityDao.find(rLeaseroomEntityVo, pagerequest,sort,order);
		return list;
	}

	/**
	* 添加数据
	*
	* @param rLeaseroomEntity
	* @return
	*/
	public RLeaseroomEntity create(RLeaseroomEntity rLeaseroomEntity){
		RLeaseroomEntity savedRLeaseroomEntity = rLeaseroomEntityDao.save(rLeaseroomEntity);
		return savedRLeaseroomEntity;
	}
	/**
	* 批量添加数据
	*
	* @param rLeaseroomEntityList
	* @return
	*/
	public List<RLeaseroomEntity> batchcreate(List<RLeaseroomEntity> rLeaseroomEntityList){
		List<RLeaseroomEntity> relist = rLeaseroomEntityDao.save(rLeaseroomEntityList);
		return relist;
	}
	/**
	* 更新数据
	*
	* @param rLeaseroomEntity
	* @return
	*/
	public RLeaseroomEntity update(RLeaseroomEntity rLeaseroomEntity){
		RLeaseroomEntity savedRLeaseroomEntity = rLeaseroomEntityDao.save(rLeaseroomEntity);
		return savedRLeaseroomEntity;
	}
	/**
	* 删除数据，根据id做删除
	*
	* @param id
	*/
	public void delete(String id){
		rLeaseroomEntityDao.delete(id);
	}
	/**
	* 获取全部记录数
	*
	* @return
	*/
	public long getCount(){
		return rLeaseroomEntityDao.count();
	}

    /**
    * 根据查询添加获取记录数
    *
    * @param rLeaseroomEntityVo
    * @return
    */
	public long count(RLeaseroomEntityVo rLeaseroomEntityVo){
		long count = rLeaseroomEntityDao.count(rLeaseroomEntityVo);
		return count;
	}

}
