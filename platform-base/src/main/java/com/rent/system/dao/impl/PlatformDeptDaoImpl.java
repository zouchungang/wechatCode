package com.rent.system.dao.impl;

import com.rent.system.dao.PlatformDeptDaoCustom;
import com.rent.system.entity.PlatformDept;
import com.rent.system.entity.PlatformDept_;
import com.rent.system.vo.PlatformDeptVo;
import org.springframework.data.domain.Pageable;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.*;
import java.util.List;

public class PlatformDeptDaoImpl implements PlatformDeptDaoCustom {
    @PersistenceContext
    private EntityManager em;

    @Override
    public List<PlatformDept> find(PlatformDeptVo platformDept, Pageable pageable, String sort, String order) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<PlatformDept> criteriaQuery = criteriaBuilder
                .createQuery(PlatformDept.class);
        Root<PlatformDept> root = criteriaQuery.from(PlatformDept.class);
        criteriaQuery.select(root);
        Predicate where = genWhereCondition(platformDept, root, criteriaBuilder);
        if (where != null) {
            criteriaQuery.where(where);
        }//排序
        Path<Integer> dataSortsortPath = root.get(PlatformDept_.dataSort);
        if (sort != null && "dataSort".equals(sort) && "desc".equals(order)) {
            criteriaQuery.orderBy(criteriaBuilder.desc(dataSortsortPath));
        } else if (sort != null && "dataSort".equals(sort) && "asc".equals(order)) {
            criteriaQuery.orderBy(criteriaBuilder.asc(dataSortsortPath));
        }
        TypedQuery<PlatformDept> tq = em.createQuery(criteriaQuery);
        if (pageable != null) {
            tq.setFirstResult(pageable.getPageNumber() * pageable.getPageSize())
                    .setMaxResults(pageable.getPageSize());
        }
        // TODO Auto-generated method stub
        return tq.getResultList();
    }

    @Override
    public long count(PlatformDeptVo platformDept) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Long> criteriaQuery = criteriaBuilder
                .createQuery(Long.class);
        Root<PlatformDept> root = criteriaQuery.from(PlatformDept.class);
        criteriaQuery.select(criteriaBuilder.count(root));
        Predicate where = genWhereCondition(platformDept, root, criteriaBuilder);
        if (where != null) {
            criteriaQuery.where(where);
        }
        long count = em.createQuery(criteriaQuery).getSingleResult();
        return count;
    }

    private Predicate genWhereCondition(PlatformDeptVo platformDept,
                                        Root<PlatformDept> root, CriteriaBuilder criteriaBuilder) {
        Predicate where = null;
        String deptname = platformDept.getDeptName();// 拼接部门名称
        if (deptname != null && !"".equals(deptname)) {
            Path<String> deptnamePath = root.get(PlatformDept_.deptName);
                where = criteriaBuilder.like(deptnamePath, deptname + "%");
        }
        Boolean useflag = platformDept.getUseFlag();// 拼接启用状态
        if (useflag != null ) {
            Path<Boolean> useflagPath = root.get(PlatformDept_.useFlag);
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
        return where;
    }
}
