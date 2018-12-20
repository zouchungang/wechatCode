package ${packageName}.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import ${packageName}.entity.${className};
/**
*
*${moduleMemo!} --DAO层
*
**/
@Repository
public interface ${className}Dao extends JpaRepository<${className}, String>, ${className}DaoCustom {

    /**
    * 根据主键获取唯一记录
    * @param ${primaryKeyName}
    * @return
    */
    @Query("select t from ${className} t where t.id = :id")
    public ${className} findById(@Param("id") String id);

<#list allList as entity>
    <#if entity.validateType == "codeValidate">
    /**
    * 根据${entity.fieldNameU}获取记录数
    * @param ${entity.fieldName}
    * @return
    */
    @Query("select count(t) from ${className} t where t.${entity.fieldName} = :${entity.fieldName}")
    public long findCountBy${entity.fieldNameF}(@Param("${entity.fieldName}") String ${entity.fieldName});

    </#if>
</#list>
}
