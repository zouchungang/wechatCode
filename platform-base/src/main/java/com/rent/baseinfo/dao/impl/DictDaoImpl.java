package com.rent.baseinfo.dao.impl;

import com.rent.baseinfo.dao.DictDaoCustom;
import com.rent.baseinfo.entity.Dict;
import com.rent.baseinfo.entity.DictType;
import com.rent.baseinfo.entity.DictType_;
import com.rent.baseinfo.entity.Dict_;
import org.springframework.data.domain.Pageable;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.*;
import java.util.List;

public class DictDaoImpl implements DictDaoCustom {
    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Dict> find(Dict dict, Pageable pageable, String sort, String order) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Dict> criteriaQuery = criteriaBuilder
                .createQuery(Dict.class);
        Root<Dict> root = criteriaQuery.from(Dict.class);
        criteriaQuery.select(root);
        Predicate where = genWhereCondition(dict, root, criteriaBuilder);
        if (where != null) {
            criteriaQuery.where(where);
        }
        //按照排序
        Path<String> paramValuePath = root.get(Dict_.paramValue);
        if (sort != null && "paramValue".equals(sort) && "desc".equals(order)) {
            criteriaQuery.orderBy(criteriaBuilder.desc(paramValuePath));
        } else if (sort != null && "paramValue".equals(sort) && "asc".equals(order)) {
            criteriaQuery.orderBy(criteriaBuilder.asc(paramValuePath));
        }
        TypedQuery<Dict> tq = em.createQuery(criteriaQuery);
        if (pageable != null) {
            tq.setFirstResult(pageable.getPageNumber() * pageable.getPageSize())
                    .setMaxResults(pageable.getPageSize());
        }
        return tq.getResultList();
    }

    @Override
    public long count(Dict dict) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Long> criteriaQuery = criteriaBuilder
                .createQuery(Long.class);
        Root<Dict> root = criteriaQuery.from(Dict.class);
        criteriaQuery.select(criteriaBuilder.count(root));
        Predicate where = genWhereCondition(dict, root, criteriaBuilder);
        if (where != null) {
            criteriaQuery.where(where);
        }
        long count = em.createQuery(criteriaQuery).getSingleResult();
        return count;
    }

    private Predicate genWhereCondition(Dict dict,
                                        Root<Dict> root, CriteriaBuilder criteriaBuilder) {
        Predicate where = null;
        DictType dictType = dict.getDictType();
        if (dictType != null) {
            String dictTypeId = dictType.getId();
            if (dictTypeId != null && !"".equals(dictTypeId)) {// 父节点条件判断
                Path<DictType> dictTypePath = root.get(Dict_.dictType);
                Path<String> dictTypeIdPath = dictTypePath.get(DictType_.id);
                where = criteriaBuilder.equal(dictTypeIdPath, dictTypeId);
            }
        }
        String paramName = dict.getParamName();
        if (paramName != null && !"".equals(paramName)) {// 父节点条件判断
            Path<String> paramNamePath = root.get(Dict_.paramName);
            if (where != null) {
                where = criteriaBuilder.and(where, criteriaBuilder.like(paramNamePath, "%" + paramName + "%"));

            } else {
                where = criteriaBuilder.like(paramNamePath, "%" + paramName + "%");
            }
        }
        return where;
    }
}
