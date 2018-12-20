package com.rent.baseinfo.dao.impl;

import com.rent.baseinfo.dao.CantonDaoCustom;
import com.rent.baseinfo.entity.Canton;
import com.rent.baseinfo.entity.Canton_;
import org.springframework.data.domain.Pageable;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.*;
import java.util.List;

public class CantonDaoImpl implements CantonDaoCustom {
    @PersistenceContext
    private EntityManager em;

    public List<Canton> find(Canton canton, Pageable pageable, String sort, String order) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Canton> criteriaQuery = criteriaBuilder
                .createQuery(Canton.class);
        Root<Canton> root = criteriaQuery.from(Canton.class);
        criteriaQuery.select(root);
        Predicate where = genWhereCondition(canton, root, criteriaBuilder);
        if (where != null) {
            criteriaQuery.where(where);
        }
        Path<Integer> datasortPath = root.get(Canton_.dataSort);
        if (sort != null && "dataSort".equals(sort) && "asc".equals(order)) {
            criteriaQuery.orderBy(criteriaBuilder.asc(datasortPath));
        }
        if (sort != null && "dataSort".equals(sort) && "desc".equals(order)) {
            criteriaQuery.orderBy(criteriaBuilder.desc(datasortPath));
        }
        TypedQuery<Canton> tq = em.createQuery(criteriaQuery);
        if (pageable != null) {
            tq.setFirstResult(pageable.getPageNumber() * pageable.getPageSize())
                    .setMaxResults(pageable.getPageSize());
        }
        return tq.getResultList();
    }

    public long count(Canton canton) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Long> criteriaQuery = criteriaBuilder
                .createQuery(Long.class);
        Root<Canton> root = criteriaQuery.from(Canton.class);
        criteriaQuery.select(criteriaBuilder.count(root));
        Predicate where = genWhereCondition(canton, root, criteriaBuilder);
        if (where != null) {
            criteriaQuery.where(where);
        }
        long count = em.createQuery(criteriaQuery).getSingleResult();
        return count;
    }

    private Predicate genWhereCondition(Canton canton,
                                        Root<Canton> root, CriteriaBuilder criteriaBuilder) {
        Predicate where = null;
        String pid = canton.getParentId();
        if (pid != null && !"".equals(pid)) {// 父节点条件判断
            Path<String> pidPath = root.get(Canton_.parentId);
            where = criteriaBuilder.equal(pidPath, pid);
        }
        Boolean useflag = canton.getUseFlag();// 是否启用条件判断
        if (useflag != null ) {
            Path<Boolean> useflagPath = root.get(Canton_.useFlag);
            if (useflag) {
                if (where != null) {
                    where = criteriaBuilder.and(where,
                            criteriaBuilder.isTrue(useflagPath));
                } else {
                    where = criteriaBuilder.isTrue(useflagPath);
                }
            } else {
                if (where != null) {
                    where = criteriaBuilder.and(where,
                            criteriaBuilder.isFalse(useflagPath));
                } else {
                    where = criteriaBuilder.isFalse(useflagPath);
                }
            }
        }
        String cantonname = canton.getCantonName();// 区域名称条件判断
        if (cantonname != null && !"".equals(cantonname)) {
            Path<String> cantonnamePath = root.get(Canton_.cantonName);
            if (where != null) {
                where = criteriaBuilder.and(where,
                        criteriaBuilder.like(cantonnamePath, cantonname + "%"));
            } else {
                where = criteriaBuilder.like(cantonnamePath, cantonname + "%");
            }
        }
        return where;
    }
}
