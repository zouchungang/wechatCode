package com.rent.baseinfo.dao.impl;

import com.rent.baseinfo.dao.PayModeDaoCustom;
import com.rent.baseinfo.entity.PayMode;
import com.rent.baseinfo.entity.PayMode_;
import org.springframework.data.domain.Pageable;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.*;
import java.util.List;

public class PayModeDaoImpl implements PayModeDaoCustom {
    @PersistenceContext
    private EntityManager em;

    @Override
    public List<PayMode> find(PayMode payMode, Pageable pageable) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<PayMode> criteriaQuery = criteriaBuilder
                .createQuery(PayMode.class);
        Root<PayMode> root = criteriaQuery.from(PayMode.class);
        criteriaQuery.select(root);
        Predicate where = genWhereCondition(payMode, root, criteriaBuilder);
        if (where != null) {
            criteriaQuery.where(where);
        }
        TypedQuery<PayMode> tq = em.createQuery(criteriaQuery);
        if (pageable != null) {
            tq.setFirstResult(pageable.getPageNumber() * pageable.getPageSize())
                    .setMaxResults(pageable.getPageSize());
        }
        return tq.getResultList();
    }

    @Override
    public long count(PayMode payMode) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Long> criteriaQuery = criteriaBuilder
                .createQuery(Long.class);
        Root<PayMode> root = criteriaQuery.from(PayMode.class);
        criteriaQuery.select(criteriaBuilder.count(root));
        Predicate where = genWhereCondition(payMode, root, criteriaBuilder);
        if (where != null) {
            criteriaQuery.where(where);
        }
        long count = em.createQuery(criteriaQuery).getSingleResult();
        return count;
    }

    private Predicate genWhereCondition(PayMode payMode,
                                        Root<PayMode> root, CriteriaBuilder criteriaBuilder) {
        Predicate where = null;
        String pcode = payMode.getPaymodeCode();
        if (pcode != null && !"".equals(pcode)) {// 支付方式编码条件判断
            Path<String> pidPath = root.get(PayMode_.paymodeCode);
            where = criteriaBuilder.equal(pidPath, pcode);
        }
        Boolean useflag = payMode.getUseFlag();// 是否启用条件判断
        if (useflag != null) {
            Path<Boolean> useflagPath = root.get(PayMode_.useFlag);
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
        String paymodename = payMode.getPaymodeName();// 名称条件判断
        if (paymodename != null && !"".equals(paymodename)) {
            Path<String> paymodenamePath = root.get(PayMode_.paymodeName);
            if (where != null) {
                where = criteriaBuilder.and(where,
                        criteriaBuilder.like(paymodenamePath, paymodename + "%"));
            } else {
                where = criteriaBuilder.like(paymodenamePath, "%" + paymodename + "%");
            }
        }
        return where;
    }
}
