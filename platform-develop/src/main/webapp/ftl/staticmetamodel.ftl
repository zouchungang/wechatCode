package ${packageName}.entity;

import java.io.Serializable;

import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import com.uticket.baseinfo.entity.BaseEntity_;

/**
*${moduleMemo!} --实体类校验
*
**/
@StaticMetamodel(${className}.class)
public class ${className}_ extends BaseEntity_{
	private static final long serialVersionUID = 1L;
	<#list allList as entity>
	public static volatile SingularAttribute<${className}, ${entity.type}> ${entity.fieldName};
	</#list>
}
