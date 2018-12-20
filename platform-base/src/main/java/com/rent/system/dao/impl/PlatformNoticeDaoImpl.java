package com.rent.system.dao.impl;

import com.rent.system.dao.PlatformNoticeDaoCustom;
import com.rent.system.entity.PlatformNotice;
import com.rent.system.entity.PlatformNotice_;
import com.rent.system.vo.PlatformNoticeVo;
import org.springframework.data.domain.Pageable;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.*;
import java.util.List;

public class PlatformNoticeDaoImpl implements PlatformNoticeDaoCustom {

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<PlatformNotice> find(PlatformNoticeVo platformNoticeVo, Pageable pageable, String sort, String order) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<PlatformNotice> criteriaQuery = criteriaBuilder
                .createQuery(PlatformNotice.class);
        Root<PlatformNotice> root = criteriaQuery.from(PlatformNotice.class);
        criteriaQuery.select(root);
        Predicate where = genWhereCondition(platformNoticeVo, root, criteriaBuilder);
        if (where != null) {
            criteriaQuery.where(where);
        }
        //按照排序号
        Path<String> noticeNamePath = root.get(PlatformNotice_.noticeName);
        if (sort != null && "noticeName".equals(sort) && "desc".equals(order)) {
            criteriaQuery.orderBy(criteriaBuilder.desc(noticeNamePath));
        } else if (sort != null && "noticeName".equals(sort) && "asc".equals(order)) {
            criteriaQuery.orderBy(criteriaBuilder.asc(noticeNamePath));
        }
        Path<String> noticeDatePath = root.get(PlatformNotice_.noticeDate);
        if (sort != null && "noticeDate".equals(sort) && "desc".equals(order)) {
            criteriaQuery.orderBy(criteriaBuilder.desc(noticeDatePath));
        } else if (sort != null && "noticeDate".equals(sort) && "asc".equals(order)) {
            criteriaQuery.orderBy(criteriaBuilder.asc(noticeDatePath));
        }
        Path<String> availabilityDatePath = root.get(PlatformNotice_.availabilityDate);
        if (sort != null && "availabilityDate".equals(sort) && "desc".equals(order)) {
            criteriaQuery.orderBy(criteriaBuilder.desc(availabilityDatePath));
        } else if (sort != null && "availabilityDate".equals(sort) && "asc".equals(order)) {
            criteriaQuery.orderBy(criteriaBuilder.asc(availabilityDatePath));
        }
        TypedQuery<PlatformNotice> tq = em.createQuery(criteriaQuery);
        if (pageable != null) {
            tq.setFirstResult(pageable.getPageNumber() * pageable.getPageSize())
                    .setMaxResults(pageable.getPageSize());
        }
        // TODO Auto-generated method stub
        return tq.getResultList();
    }

    @Override
    public long count(PlatformNoticeVo platformNoticeVo) {
        // TODO Auto-generated method stub
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Long> criteriaQuery = criteriaBuilder
                .createQuery(Long.class);
        Root<PlatformNotice> root = criteriaQuery.from(PlatformNotice.class);
        criteriaQuery.select(criteriaBuilder.count(root));
        Predicate where = genWhereCondition(platformNoticeVo, root, criteriaBuilder);

        if (where != null) {
            criteriaQuery.where(where);
        }
        long count = em.createQuery(criteriaQuery).getSingleResult();
        // TODO Auto-generated method stub
        return count;
    }

    private Predicate genWhereCondition(PlatformNoticeVo platformNoticeVo,
                                        Root<PlatformNotice> root, CriteriaBuilder criteriaBuilder) {
        Predicate where = null;
        String noticename = platformNoticeVo.getNoticeName();
        if (noticename != null && !"".equals(noticename)) {
            Path<String> noticenamePath = root.get(PlatformNotice_.noticeName);
                where = criteriaBuilder.like(noticenamePath, "%" + noticename + "%");
        }
        return where;
    }
}
