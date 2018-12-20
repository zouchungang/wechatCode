package com.rent.authority.dao.impl;

import com.rent.authority.dao.BussinessMenuDaoCustom;
import com.rent.authority.entity.BussinessMenu;
import com.rent.authority.entity.BussinessMenu_;
import com.rent.authority.vo.BussinessMenuVo;
import org.springframework.data.domain.Pageable;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.*;
import java.util.List;

/**
 * Created by sbd on 2016-11-18.
 */
public class BussinessMenuDaoImpl implements BussinessMenuDaoCustom {

    @PersistenceContext
    private EntityManager em;


    public List<BussinessMenu> find(BussinessMenuVo bussinessMenuVo, Pageable pageable, String sort, String order) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<BussinessMenu> criteriaQuery = criteriaBuilder
                .createQuery(BussinessMenu.class);
        Root<BussinessMenu> root = criteriaQuery.from(BussinessMenu.class);
        criteriaQuery.select(root);
        Predicate where = genWhereCondition(bussinessMenuVo, root, criteriaBuilder);
        if (where != null) {
            criteriaQuery.where(where);
        }
        //按照排序号
        Path<Integer> dataSortPath = root.get(BussinessMenu_.dataSort);
        if (sort != null && "dataSort".equals(sort) && "desc".equals(order)) {
            criteriaQuery.orderBy(criteriaBuilder.desc(dataSortPath));
        } else if (sort != null && "dataSort".equals(sort) && "asc".equals(order)) {
            criteriaQuery.orderBy(criteriaBuilder.asc(dataSortPath));
        }
        Path<String> menuNamePath = root.get(BussinessMenu_.menuName);
        if (sort != null && "menuName".equals(sort) && "desc".equals(order)) {
            criteriaQuery.orderBy(criteriaBuilder.desc(menuNamePath));
        } else if (sort != null && "menuName".equals(sort) && "asc".equals(order)) {
            criteriaQuery.orderBy(criteriaBuilder.asc(menuNamePath));
        }
        TypedQuery<BussinessMenu> tq = em.createQuery(criteriaQuery);
        if (pageable != null) {
            tq.setFirstResult(pageable.getPageNumber() * pageable.getPageSize())
                    .setMaxResults(pageable.getPageSize());
        }
        // TODO Auto-generated method stub
        return tq.getResultList();
    }

    public long count(BussinessMenuVo bussinessMenuVo) {
        // TODO Auto-generated method stub
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Long> criteriaQuery = criteriaBuilder
                .createQuery(Long.class);
        Root<BussinessMenu> root = criteriaQuery.from(BussinessMenu.class);
        criteriaQuery.select(criteriaBuilder.count(root));

        Predicate where = genWhereCondition(bussinessMenuVo, root, criteriaBuilder);

        if (where != null) {
            criteriaQuery.where(where);
        }
        long count = em.createQuery(criteriaQuery).getSingleResult();
        // TODO Auto-generated method stub
        return count;
    }

    private Predicate genWhereCondition(BussinessMenuVo bussinessMenuVo,
                                        Root<BussinessMenu> root, CriteriaBuilder criteriaBuilder) {
        Predicate where = null;
        String menuName = bussinessMenuVo.getMenuName();
        if (menuName != null && !"".equals(menuName)) {
            Path<String> menuNamePath = root.get(BussinessMenu_.menuName);
            where = criteriaBuilder.like(menuNamePath, "%" + menuName
                    + "%");
        }
        String parentId = bussinessMenuVo.getParentId();
        if (parentId != null && !"".equals(parentId)) {
            Path<String> parentIdPath = root.get(BussinessMenu_.parentId);
            if (where != null) {
                where = criteriaBuilder.and(
                        where,
                        criteriaBuilder.like(parentIdPath, "%" + parentId
                                + "%"));
            } else {
                where = criteriaBuilder.like(parentIdPath, "%" + parentId
                        + "%");
            }
        }
        Integer dataLevels = bussinessMenuVo.getDataLevels();
        if (dataLevels != null && dataLevels != 0) {
            Path<Integer> dataLevelsPath = root.get(BussinessMenu_.dataLevels);
            if (where != null) {
                where = criteriaBuilder.and(
                        where,
                        criteriaBuilder.equal(dataLevelsPath, dataLevels));
            } else {
                where = criteriaBuilder.equal(dataLevelsPath, dataLevels);
            }
        }
        Integer bussinessType = bussinessMenuVo.getBussinessType();
        if (bussinessType != null && bussinessType != 0) {
            Path<Integer> bussinessTypePath = root.get(BussinessMenu_.bussinessType);
            if (where != null) {
                where = criteriaBuilder.and(
                        where,
                        criteriaBuilder.equal(bussinessTypePath, bussinessType));
            } else {
                where = criteriaBuilder.equal(bussinessTypePath, bussinessType);
            }
        }
        Boolean useFlag = bussinessMenuVo.getUseFlag();
        if (useFlag != null) {
            Path<Boolean> useFlagPath = root.get(BussinessMenu_.useFlag);
            if (where != null) {
                where = criteriaBuilder.and(
                        where,
                        criteriaBuilder.equal(useFlagPath, useFlag));
            } else {
                where = criteriaBuilder.equal(useFlagPath, useFlag);
            }
        }
        return where;
    }
}
