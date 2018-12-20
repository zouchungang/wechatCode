package ${packageName}.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import ${packageName}.dao.${className}Dao;
import ${packageName}.service.I${className}Service;
import ${packageName}.entity.${className};

@Service
public class ${className}ServiceImpl implements I${className}Service {

	@Autowired
	private ${className}Dao ${classNameL}Dao;
	
	public ${className} findById(String id){
		${className} ${classNameL} = ${classNameL}Dao.findById(id);
		return ${classNameL};
	}
	
	public List<${className}> getAll(){
		List<${className}> list = ${classNameL}Dao.findAll();
		return list;
	}
	
	public List<${className}> getPage(PageRequest pagerequest){
		List<${className}> list = ${classNameL}Dao.findAll(pagerequest).getContent();
		return list;
	}
	<#if searchFlag>
	public List<${className}> find(${className} ${classNameL}, PageRequest pagerequest,String sort,String order){
		List<${className}> list = ${classNameL}Dao.find(${classNameL}, pagerequest,sort,order);
		return list;
	}
	</#if>
	public ${className} create(${className} ${classNameL}){
		${className} saved${className} = ${classNameL}Dao.save(${classNameL});
		return saved${className};
	}
	public List<${className}> batchcreate(List<${className}> ${classNameL}List){
		List<${className}> relist = ${classNameL}Dao.save(${classNameL}List);
		return relist;
	}
	public ${className} update(${className} ${classNameL}){
		${className} saved${className} = ${classNameL}Dao.save(${classNameL});
		return saved${className};
	}
	
	public void delete(String id){
		${classNameL}Dao.delete(id);
	}
	
	public long getCount(){
		return ${classNameL}Dao.count();
	}
	<#if searchFlag>
	public long count(${className} ${classNameL}){
		long count = ${classNameL}Dao.count(${classNameL});
		return count;
	}
	</#if>
}
