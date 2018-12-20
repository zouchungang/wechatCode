package ${packageName}.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import ${packageName}.dao.${className}Dao;
//import ${packageName}.service.${className}Service;
import ${packageName}.entity.${className};
import ${packageName}.vo.${className}Vo;
/**
*${moduleMemo!} --service层
*
**/
@Service
public class ${className}Service {
	private static Logger logger = LoggerFactory.getLogger(${className}Service.class);
	@Autowired
	private ${className}Dao ${classNameL}Dao;
	/**
	* 根据id获取唯一记录
	*
	* @param id
	* @return
	*/
	public ${className} findById(String id){
		${className} ${classNameL} = ${classNameL}Dao.findById(id);
		return ${classNameL};
	}
	/**
	* 获取全部记录
	*
	* @return
	*/
	public List<${className}> getAll(){
		List<${className}> list = ${classNameL}Dao.findAll();
		return list;
	}
	/**
	* 获取分页数据，全部数据，没有查询条件
	*
	* @param pagerequest
	* @return
	*/
	public List<${className}> getPage(PageRequest pagerequest){
		List<${className}> list = ${classNameL}Dao.findAll(pagerequest).getContent();
		return list;
	}

    /**
    * 获取分页数据，有查询条件，有排序
    *
    * @param ${classNameL}Vo
    * @param pagerequest
    * @param sort
    * @param order
    * @return
    */
	public List<${className}> find(${className}Vo ${classNameL}Vo, PageRequest pagerequest,String sort,String order){
		List<${className}> list = ${classNameL}Dao.find(${classNameL}Vo, pagerequest,sort,order);
		return list;
	}

	/**
	* 添加数据
	*
	* @param ${classNameL}
	* @return
	*/
	public ${className} create(${className} ${classNameL}){
		${className} saved${className} = ${classNameL}Dao.save(${classNameL});
		return saved${className};
	}
	/**
	* 批量添加数据
	*
	* @param ${classNameL}List
	* @return
	*/
	public List<${className}> batchcreate(List<${className}> ${classNameL}List){
		List<${className}> relist = ${classNameL}Dao.save(${classNameL}List);
		return relist;
	}
	/**
	* 更新数据
	*
	* @param ${classNameL}
	* @return
	*/
	public ${className} update(${className} ${classNameL}){
		${className} saved${className} = ${classNameL}Dao.save(${classNameL});
		return saved${className};
	}
	/**
	* 删除数据，根据id做删除
	*
	* @param id
	*/
	public void delete(String id){
		${classNameL}Dao.delete(id);
	}
	/**
	* 获取全部记录数
	*
	* @return
	*/
	public long getCount(){
		return ${classNameL}Dao.count();
	}

    /**
    * 根据查询添加获取记录数
    *
    * @param ${classNameL}Vo
    * @return
    */
	public long count(${className}Vo ${classNameL}Vo){
		long count = ${classNameL}Dao.count(${classNameL}Vo);
		return count;
	}

<#list allList as entity>
	<#if entity.validateType == "codeValidate">
    /**
    * 根据${entity.fieldNameU}获取记录数
    **/
    public long findCountBy${entity.fieldNameF}(String ${entity.fieldName}) {
    long count = ${classNameL}Dao.findCountBy${entity.fieldNameF}(${entity.fieldName});
    return count;
    }
	</#if>
</#list>
}
