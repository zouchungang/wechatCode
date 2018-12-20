package ${packageName}.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Pageable;

import ${packageName}.entity.${className};
import ${packageName}.vo.${className}Vo;
import ${packageName}.entity.${className}_;
import ${packageName}.dao.${className}DaoCustom;
/**
*${moduleMemo!} --自定义查询接口实现类(JPA)
*
**/
public class ${className}DaoImpl implements ${className}DaoCustom {
private static Logger logger = LoggerFactory.getLogger(${className}DaoImpl.class);
@PersistenceContext
private EntityManager em;

@Override
public List<${className}> find(${className}Vo ${classNameL}Vo, Pageable pageable,String sort,String order) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<${className}> criteriaQuery = criteriaBuilder.createQuery(${className}.class);
        Root<${className}> root = criteriaQuery.from(${className}.class);
        criteriaQuery.select(root);
        Predicate where = null;
        where = genWhereCondition(${classNameL}Vo, root, criteriaBuilder);
        if(where != null){
            criteriaQuery.where(where);
        }
//排序
<#list sortList as entity>
        Path<${entity.type}> ${entity.fieldName}sortPath = root.get(${className}_.${entity.fieldName});
        if(sort!=null&&"${entity.fieldName}".equals(sort)&&"desc".equals(order)){
                criteriaQuery.orderBy(criteriaBuilder.desc(${entity.fieldName}sortPath));
        }
        if(sort!=null&&"${entity.fieldName}".equals(sort)&&"asc".equals(order)){
                criteriaQuery.orderBy(criteriaBuilder.asc(${entity.fieldName}sortPath));
        }
</#list>

        TypedQuery<${className}> tq = em.createQuery(criteriaQuery);
        if(pageable != null)
        tq.setFirstResult(pageable.getPageNumber() * pageable.getPageSize()).setMaxResults(pageable.getPageSize());
                return tq.getResultList();
        }

@Override
public long count(${className}Vo ${classNameL}Vo) {
    CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
    CriteriaQuery <Long> criteriaQuery = criteriaBuilder.createQuery(Long.class);
    Root<${className}> root = criteriaQuery.from(${className}.class);
    criteriaQuery.select(criteriaBuilder.count(root));
    Predicate where = null;
    where = genWhereCondition(${classNameL}Vo, root, criteriaBuilder);
    if(where != null){
    criteriaQuery.where(where);
    }
    long count = em.createQuery(criteriaQuery).getSingleResult();
    return count;
    }

private Predicate genWhereCondition(${className}Vo ${classNameL}Vo,Root<${className}> root, CriteriaBuilder
    criteriaBuilder) {
    Predicate where = null;
<#list searchList as entity>
${entity.type} ${entity.fieldName}Search = ${classNameL}Vo.get${entity.fieldNameF}();
    if (${entity.fieldName}Search != null && !"".equals(${entity.fieldName}Search)) {
    Path<${entity.type}> ${entity.fieldName}SearchPath = root.get(${className}_.${entity.fieldName});
    if (where != null) {
    <#if entity.type=="java.lang.String">
        where = criteriaBuilder.and(where,criteriaBuilder.like(${entity.fieldName}SearchPath, "%" +  ${entity.fieldName}
        Search + "%"));
    </#if>
    <#if entity.type=="java.lang.Integer"||entity.type=="java.lang.Boolean">
        where = criteriaBuilder.and(where,criteriaBuilder.equal(${entity.fieldName}SearchPath, ${entity.fieldName}
        Search));
    </#if>
    } else {
    <#if entity.type=="java.lang.String">
        where = criteriaBuilder.like(${entity.fieldName}SearchPath, "%" + ${entity.fieldName}Search + "%");
    </#if>
    <#if entity.type=="java.lang.Integer" || entity.type=="java.lang.Boolean">
        where = criteriaBuilder.equal(${entity.fieldName}SearchPath,  ${entity.fieldName}Search);
    </#if>
    }
    }
</#list>
    return where;
    }

}
