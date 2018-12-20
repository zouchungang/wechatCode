package com.rent.business.dao.impl;

import com.rent.business.dao.RBegrentEntityDaoCustom;
import com.rent.business.entity.RBegrentEntity;
import com.rent.business.entity.RBegrentEntity_;
import com.rent.business.vo.RBegrentEntityVo;
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
public class RBegrentEntityDaoImpl implements RBegrentEntityDaoCustom {
private static Logger logger = LoggerFactory.getLogger(RBegrentEntityDaoImpl.class);
@PersistenceContext
private EntityManager em;

@Override
public List<RBegrentEntity> find(RBegrentEntityVo rBegrentEntityVo, Pageable pageable,String sort,String order) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<RBegrentEntity> criteriaQuery = criteriaBuilder.createQuery(RBegrentEntity.class);
        Root<RBegrentEntity> root = criteriaQuery.from(RBegrentEntity.class);
        criteriaQuery.select(root);
        Predicate where = null;
        where = genWhereCondition(rBegrentEntityVo, root, criteriaBuilder);
        if(where != null){
            criteriaQuery.where(where);
        }
//排序
        Path<java.sql.Timestamp> timesortPath = root.get(RBegrentEntity_.time);
        if(sort!=null&&"time".equals(sort)&&"desc".equals(order)){
                criteriaQuery.orderBy(criteriaBuilder.desc(timesortPath));
        }
        if(sort!=null&&"time".equals(sort)&&"asc".equals(order)){
                criteriaQuery.orderBy(criteriaBuilder.asc(timesortPath));
        }

        TypedQuery<RBegrentEntity> tq = em.createQuery(criteriaQuery);
        if(pageable != null)
        tq.setFirstResult(pageable.getPageNumber() * pageable.getPageSize()).setMaxResults(pageable.getPageSize());
                return tq.getResultList();
        }

@Override
public long count(RBegrentEntityVo rBegrentEntityVo) {
    CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
    CriteriaQuery <Long> criteriaQuery = criteriaBuilder.createQuery(Long.class);
    Root<RBegrentEntity> root = criteriaQuery.from(RBegrentEntity.class);
    criteriaQuery.select(criteriaBuilder.count(root));
    Predicate where = null;
    where = genWhereCondition(rBegrentEntityVo, root, criteriaBuilder);
    if(where != null){
    criteriaQuery.where(where);
    }
    long count = em.createQuery(criteriaQuery).getSingleResult();
    return count;
    }

private Predicate genWhereCondition(RBegrentEntityVo rBegrentEntityVo,Root<RBegrentEntity> root, CriteriaBuilder
    criteriaBuilder) {
    Predicate where = null;
    int uidSearch = rBegrentEntityVo.getUid();
    if (uidSearch !=-1) {
    Path<Integer> uidSearchPath = root.get(RBegrentEntity_.uid);
        if (where != null) {
            where = criteriaBuilder.and(where,criteriaBuilder.equal(uidSearchPath, uidSearch));
        } else {
            where = criteriaBuilder.equal(uidSearchPath, uidSearch);
        }
    }
java.lang.String hidSearch = rBegrentEntityVo.getHid();
    if (hidSearch != null && !"".equals(hidSearch)) {
    Path<java.lang.String> hidSearchPath = root.get(RBegrentEntity_.hid);
    if (where != null) {
        where = criteriaBuilder.and(where,criteriaBuilder.like(hidSearchPath, "%" +  hidSearch + "%"));
    } else {
        where = criteriaBuilder.like(hidSearchPath, "%" + hidSearch + "%");
    }
    }
java.lang.String aidSearch = rBegrentEntityVo.getAid();
    if (aidSearch != null && !"".equals(aidSearch)) {
    Path<java.lang.String> aidSearchPath = root.get(RBegrentEntity_.aid);
    if (where != null) {
        where = criteriaBuilder.and(where,criteriaBuilder.like(aidSearchPath, "%" +  aidSearch + "%"));
    } else {
        where = criteriaBuilder.like(aidSearchPath, "%" + aidSearch + "%");
    }
    }
int chamberSearch = rBegrentEntityVo.getChamber();
    if (chamberSearch!=-1) {
    Path<Integer> chamberSearchPath = root.get(RBegrentEntity_.chamber);
        if (where != null) {
            where = criteriaBuilder.and(where,criteriaBuilder.equal(chamberSearchPath, chamberSearch));
        } else {
            where = criteriaBuilder.equal(chamberSearchPath, chamberSearch);
        }
    }
int hallSearch = rBegrentEntityVo.getHall();
    if (hallSearch !=-1) {
    Path<Integer> hallSearchPath = root.get(RBegrentEntity_.hall);
        if (where != null) {
            where = criteriaBuilder.and(where,criteriaBuilder.equal(hallSearchPath, hallSearch));
        } else {
            where = criteriaBuilder.equal(hallSearchPath, hallSearch);
        }
    }
int toiletSearch = rBegrentEntityVo.getToilet();
    if (toiletSearch !=-1) {
    Path<Integer> toiletSearchPath = root.get(RBegrentEntity_.toilet);
        if (where != null) {
            where = criteriaBuilder.and(where,criteriaBuilder.equal(toiletSearchPath,   toiletSearch ));
        } else {
            where = criteriaBuilder.equal(toiletSearchPath, toiletSearch );
        }
    }
java.lang.String addressSearch = rBegrentEntityVo.getAddress();
    if (addressSearch != null && !"".equals(addressSearch)) {
    Path<java.lang.String> addressSearchPath = root.get(RBegrentEntity_.address);
    if (where != null) {
        where = criteriaBuilder.and(where,criteriaBuilder.like(addressSearchPath, "%" +  addressSearch + "%"));
    } else {
        where = criteriaBuilder.like(addressSearchPath, "%" + addressSearch + "%");
    }
    }
java.lang.String minpriceSearch = rBegrentEntityVo.getMinprice();
    if (minpriceSearch != null && !"".equals(minpriceSearch)) {
    Path<java.lang.String> minpriceSearchPath = root.get(RBegrentEntity_.minprice);
    if (where != null) {
        where = criteriaBuilder.and(where,criteriaBuilder.like(minpriceSearchPath, "%" +  minpriceSearch + "%"));
    } else {
        where = criteriaBuilder.like(minpriceSearchPath, "%" + minpriceSearch + "%");
    }
    }
java.lang.String maxpriceSearch = rBegrentEntityVo.getMaxprice();
    if (maxpriceSearch != null && !"".equals(maxpriceSearch)) {
    Path<java.lang.String> maxpriceSearchPath = root.get(RBegrentEntity_.maxprice);
    if (where != null) {
        where = criteriaBuilder.and(where,criteriaBuilder.like(maxpriceSearchPath, "%" +  maxpriceSearch + "%"));
    } else {
        where = criteriaBuilder.like(maxpriceSearchPath, "%" + maxpriceSearch + "%");
    }
    }
java.lang.String minarceageSearch = rBegrentEntityVo.getMinarceage();
    if (minarceageSearch != null && !"".equals(minarceageSearch)) {
    Path<java.lang.String> minarceageSearchPath = root.get(RBegrentEntity_.minarceage);
    if (where != null) {
        where = criteriaBuilder.and(where,criteriaBuilder.like(minarceageSearchPath, "%" +  minarceageSearch + "%"));
    } else {
        where = criteriaBuilder.like(minarceageSearchPath, "%" + minarceageSearch + "%");
    }
    }
java.lang.String maxarceageSearch = rBegrentEntityVo.getMaxarceage();
    if (maxarceageSearch != null && !"".equals(maxarceageSearch)) {
    Path<java.lang.String> maxarceageSearchPath = root.get(RBegrentEntity_.maxarceage);
    if (where != null) {
        where = criteriaBuilder.and(where,criteriaBuilder.like(maxarceageSearchPath, "%" +  maxarceageSearch + "%"));
    } else {
        where = criteriaBuilder.like(maxarceageSearchPath, "%" + maxarceageSearch + "%");
    }
    }
java.sql.Timestamp timeSearch = rBegrentEntityVo.getTime();
    if (timeSearch != null && !"".equals(timeSearch)) {
    Path<java.sql.Timestamp> timeSearchPath = root.get(RBegrentEntity_.time);
    if (where != null) {
    } else {
    }
    }
java.lang.String remarkSearch = rBegrentEntityVo.getRemark();
    if (remarkSearch != null && !"".equals(remarkSearch)) {
    Path<java.lang.String> remarkSearchPath = root.get(RBegrentEntity_.remark);
    if (where != null) {
        where = criteriaBuilder.and(where,criteriaBuilder.like(remarkSearchPath, "%" +  remarkSearch + "%"));
    } else {
        where = criteriaBuilder.like(remarkSearchPath, "%" + remarkSearch + "%");
    }
    }
java.lang.Integer stateSearch = rBegrentEntityVo.getState();
    if (stateSearch != null && !"".equals(stateSearch)) {
    Path<java.lang.Integer> stateSearchPath = root.get(RBegrentEntity_.state);
    if (where != null) {
        where = criteriaBuilder.and(where,criteriaBuilder.equal(stateSearchPath, stateSearch));
    } else {
        where = criteriaBuilder.equal(stateSearchPath,  stateSearch);
    }
    }
java.lang.String esthmentSearch = rBegrentEntityVo.getEsthment();
    if (esthmentSearch != null && !"".equals(esthmentSearch)) {
    Path<java.lang.String> esthmentSearchPath = root.get(RBegrentEntity_.esthment);
    if (where != null) {
        where = criteriaBuilder.and(where,criteriaBuilder.like(esthmentSearchPath, "%" +  esthmentSearch + "%"));
    } else {
        where = criteriaBuilder.like(esthmentSearchPath, "%" + esthmentSearch + "%");
    }
    }
    return where;
    }

}
