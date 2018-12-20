package com.rent.system.dao.impl;

import com.rent.system.dao.PlatformMenuDaoCustom;
import com.rent.system.entity.PlatformMenu;
import com.rent.system.entity.PlatformMenu_;
import org.springframework.data.domain.Pageable;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.*;
import java.util.List;

public class PlatformMenuDaoImpl implements PlatformMenuDaoCustom {
    @PersistenceContext
    private EntityManager em;

    @Override
    public List<PlatformMenu> find(PlatformMenu menu, Pageable pageable, String sort, String order) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<PlatformMenu> criteriaQuery = criteriaBuilder
                .createQuery(PlatformMenu.class);
        Root<PlatformMenu> root = criteriaQuery.from(PlatformMenu.class);
        criteriaQuery.select(root);
        Predicate where = null;
        Integer functionType = menu.getFunctionType();
        if (functionType != null) {// 拼接功能分类
            Path<Integer> functionTypePath = root.get(PlatformMenu_.functionType);
            where = criteriaBuilder.equal(functionTypePath, functionType);
        }
        // 可用状态匹配
        Boolean useflag = menu.getUseFlag();
        if (useflag != null) {
            Path<Boolean> useflagPath = root.get(PlatformMenu_.useFlag);
            if (where != null) {
                where = criteriaBuilder.and(where,
                        criteriaBuilder.equal(useflagPath, useflag));
            } else {
                where = criteriaBuilder.equal(useflagPath, useflag);
            }
        }
        // 层级序号
        Integer dataLevels = menu.getDataLevels();
        if (dataLevels != null && dataLevels > 0) {
            Path<Integer> dataLevelsPath = root.get(PlatformMenu_.dataLevels);
            if (where != null) {
                where = criteriaBuilder.and(where,
                        criteriaBuilder.equal(dataLevelsPath, dataLevels));
            } else {
                where = criteriaBuilder.equal(dataLevelsPath, dataLevels);
            }
        }
        // 层级序号
        String parentId = menu.getParentId();
        if (parentId != null && !"".equals(parentId)) {
            Path<String> parentIdPath = root.get(PlatformMenu_.parentId);
            if (where != null) {
                where = criteriaBuilder.and(where,
                        criteriaBuilder.equal(parentIdPath, parentId));
            } else {
                where = criteriaBuilder.equal(parentIdPath, parentId);
            }
        }

        if (where != null) {
            criteriaQuery.where(where);
        }
        //按照排序号
        Path<Integer> levelsequencePath = root.get(PlatformMenu_.levelSequence);
        if (sort != null && "levelSequence".equals(sort) && "desc".equals(order)) {
            criteriaQuery.orderBy(criteriaBuilder.desc(levelsequencePath));
        } else if (sort != null && "levelSequence".equals(sort) && "asc".equals(order)) {
            criteriaQuery.orderBy(criteriaBuilder.asc(levelsequencePath));
        }
        TypedQuery<PlatformMenu> tq = em.createQuery(criteriaQuery);
        if (pageable != null) {
            tq.setFirstResult(pageable.getPageNumber() * pageable.getPageSize())
                    .setMaxResults(pageable.getPageSize());
        }
        // TODO Auto-generated method stub
        return tq.getResultList();
    }

    @Override
    public long count(PlatformMenu menu) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Long> criteriaQuery = criteriaBuilder
                .createQuery(Long.class);
        Root<PlatformMenu> root = criteriaQuery.from(PlatformMenu.class);
        criteriaQuery.select(criteriaBuilder.count(root));
        Predicate where = null;
        Integer functionType = menu.getFunctionType();
        if (functionType != null ) {// 拼接功能分类
            Path<Integer> functionTypePath = root.get(PlatformMenu_.functionType);
            where = criteriaBuilder.equal(functionTypePath, functionType);
        }
        if (where != null) {
            criteriaQuery.where(where);
        }
        long count = em.createQuery(criteriaQuery).getSingleResult();
        // TODO Auto-generated method stub
        return count;
    }


}
