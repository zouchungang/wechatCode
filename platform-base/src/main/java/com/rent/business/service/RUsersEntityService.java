package com.rent.business.service;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.rent.business.dao.RUsersEntityDao;
//import com.rent.business.service.RUsersEntityService;
import com.rent.business.entity.RUsersEntity;
import com.rent.business.vo.RUsersEntityVo;
/**
* --service层
*
**/
@Service
public class RUsersEntityService {
	private static Logger logger = LoggerFactory.getLogger(RUsersEntityService.class);
	@Autowired
	private RUsersEntityDao rUsersEntityDao;
	/**
	* 根据id获取唯一记录
	*
	* @param id
	* @return
	*/
	public RUsersEntity findById(String id){
		RUsersEntity rUsersEntity = rUsersEntityDao.findById(id);
		return rUsersEntity;
	}

	/**
	* 判断用户是否存在
	*
	* @param uname
	* @return
	*/
	public RUsersEntity findByName(String uname){
		RUsersEntity rUsersEntity = rUsersEntityDao.findByName(uname);
		return rUsersEntity;
	}

	/**
	* 根据用户名与密码获取唯一记录
	*
	* @param uname
	* @param upwd
	* @return
	*/
	public RUsersEntity findByUnameAndUpwd(String uname,String upwd){
		RUsersEntity rUsersEntity = rUsersEntityDao.findByUnameAndUpwd(uname,upwd);
		return rUsersEntity;
	}
	/**
	* 获取全部记录
	*
	* @return
	*/
	public List<RUsersEntity> getAll(){
		List<RUsersEntity> list = rUsersEntityDao.findAll();
		return list;
	}
	/**
	* 获取分页数据，全部数据，没有查询条件
	*
	* @param pagerequest
	* @return
	*/
	public List<RUsersEntity> getPage(PageRequest pagerequest){
		List<RUsersEntity> list = rUsersEntityDao.findAll(pagerequest).getContent();
		return list;
	}

    /**
    * 获取分页数据，有查询条件，有排序
    *
    * @param rUsersEntityVo
    * @param pagerequest
    * @param sort
    * @param order
    * @return
    */
	public List<RUsersEntity> find(RUsersEntityVo rUsersEntityVo, PageRequest pagerequest,String sort,String order){
		List<RUsersEntity> list = rUsersEntityDao.find(rUsersEntityVo, pagerequest,sort,order);
		return list;
	}

	/**
	* 添加数据
	*
	* @param rUsersEntity
	* @return
	*/
	public RUsersEntity create(RUsersEntity rUsersEntity){
		String pwd=rUsersEntity.getUpwd();
		if (pwd != null) {
			String pwdmd5 = pwd != null ? DigestUtils.md5Hex(pwd) : null;
			rUsersEntity.setUpwd(pwdmd5);
		}
		RUsersEntity savedRUsersEntity = rUsersEntityDao.save(rUsersEntity);
		return savedRUsersEntity;
	}
	/**
	* 批量添加数据
	*
	* @param rUsersEntityList
	* @return
	*/
	public List<RUsersEntity> batchcreate(List<RUsersEntity> rUsersEntityList){
		List<RUsersEntity> relist = rUsersEntityDao.save(rUsersEntityList);
		return relist;
	}
	/**
	* 更新数据
	*
	* @param rUsersEntity
	* @return
	*/
	public RUsersEntity update(RUsersEntity rUsersEntity){
		RUsersEntity savedRUsersEntity = rUsersEntityDao.save(rUsersEntity);
		return savedRUsersEntity;
	}
	/**
	* 删除数据，根据id做删除
	*
	* @param id
	*/
	public void delete(String id){
		rUsersEntityDao.delete(id);
	}
	/**
	* 获取全部记录数
	*
	* @return
	*/
	public long getCount(){
		return rUsersEntityDao.count();
	}

    /**
    * 根据查询添加获取记录数
    *
    * @param rUsersEntityVo
    * @return
    */
	public long count(RUsersEntityVo rUsersEntityVo){
		long count = rUsersEntityDao.count(rUsersEntityVo);
		return count;
	}

}
