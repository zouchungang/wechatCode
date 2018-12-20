package com.rent.business.dao.impl;

import com.rent.business.dao.RChooseroomEntityDaoCustom;
import com.rent.business.entity.RChooseroomEntity;
import com.rent.business.entity.RChooseroomEntity_;
import com.rent.business.vo.RChooseroomEntityVo;
import io.swagger.models.auth.In;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Pageable;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.*;
import java.util.List;
/**
* --自定义查询接口实现类(JPA)
*
**/
public class RChooseroomEntityDaoImpl implements RChooseroomEntityDaoCustom {
private static Logger logger = LoggerFactory.getLogger(RChooseroomEntityDaoImpl.class);
@PersistenceContext
private EntityManager em;

@Override
public List<RChooseroomEntity> find(RChooseroomEntityVo rChooseroomEntityVo, Pageable pageable,String sort,String order) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<RChooseroomEntity> criteriaQuery = criteriaBuilder.createQuery(RChooseroomEntity.class);
        Root<RChooseroomEntity> root = criteriaQuery.from(RChooseroomEntity.class);
        criteriaQuery.select(root);
        Predicate where = null;
        where = genWhereCondition(rChooseroomEntityVo, root, criteriaBuilder);
        if(where != null){
            criteriaQuery.where(where);
        }
//排序
        Path<java.sql.Timestamp> timesortPath = root.get(RChooseroomEntity_.time);
        if(sort!=null&&"time".equals(sort)&&"desc".equals(order)){
                criteriaQuery.orderBy(criteriaBuilder.desc(timesortPath));
        }
        if(sort!=null&&"time".equals(sort)&&"asc".equals(order)){
                criteriaQuery.orderBy(criteriaBuilder.asc(timesortPath));
        }

        TypedQuery<RChooseroomEntity> tq = em.createQuery(criteriaQuery);
        if(pageable != null)
        tq.setFirstResult(pageable.getPageNumber() * pageable.getPageSize()).setMaxResults(pageable.getPageSize());
                return tq.getResultList();
        }

@Override
public long count(RChooseroomEntityVo rChooseroomEntityVo) {
    CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
    CriteriaQuery <Long> criteriaQuery = criteriaBuilder.createQuery(Long.class);
    Root<RChooseroomEntity> root = criteriaQuery.from(RChooseroomEntity.class);
    criteriaQuery.select(criteriaBuilder.count(root));
    Predicate where = null;
    where = genWhereCondition(rChooseroomEntityVo, root, criteriaBuilder);
    if(where != null){
    criteriaQuery.where(where);
    }
    long count = em.createQuery(criteriaQuery).getSingleResult();
    return count;
    }

private Predicate genWhereCondition(RChooseroomEntityVo rChooseroomEntityVo,Root<RChooseroomEntity> root, CriteriaBuilder
    criteriaBuilder) {
    Predicate where = null;
    int idSearch = rChooseroomEntityVo.getId();
    if (idSearch != -1) {
    Path<Integer> idSearchPath = root.get(RChooseroomEntity_.id);
    if (where != null) {
    } else {
    }
    }
int lidSearch = rChooseroomEntityVo.getLid();
    if (lidSearch != -1) {
    Path<Integer> lidSearchPath = root.get(RChooseroomEntity_.lid);
    if (where != null) {
    } else {
    }
    }
int uidSearch = rChooseroomEntityVo.getUid();
    if (uidSearch !=-1) {
    Path<Integer> uidSearchPath = root.get(RChooseroomEntity_.uid);
    if (where != null) {
    } else {
    }
    }
java.sql.Timestamp timeSearch = rChooseroomEntityVo.getTime();
    if (timeSearch != null && !"".equals(timeSearch)) {
    Path<java.sql.Timestamp> timeSearchPath = root.get(RChooseroomEntity_.time);
    if (where != null) {
    } else {
    }
    }
    return where;
    }

}
