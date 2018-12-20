package com.rent.authority.dao.impl;

import com.rent.authority.dao.AuthorityGroupDaoCustom;
import com.rent.authority.entity.AuthorityGroup;
import com.rent.authority.entity.AuthorityGroup_;
import org.springframework.data.domain.Pageable;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.*;
import java.util.List;

/**
 * Created by Administrator on 2016/11/18 0018.
 */
public class AuthorityGroupDaoImpl implements AuthorityGroupDaoCustom {
    @PersistenceContext
    private EntityManager em;

    @Override
    public List<AuthorityGroup> find(AuthorityGroup authorityGroup, Pageable pageable, String sort, String order) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<AuthorityGroup> criteriaQuery = criteriaBuilder
                .createQuery(AuthorityGroup.class);
        Root<AuthorityGroup> root = criteriaQuery.from(AuthorityGroup.class);
        criteriaQuery.select(root);
        Predicate where = null;
        where = genWhereCondition(authorityGroup, root, criteriaBuilder);
        if (where != null) {
            criteriaQuery.where(where);
        }
        //按照排序
        Path<Integer> datasortPath = root.get(AuthorityGroup_.dataSort);
        if (sort != null && "dataSort".equals(sort) && "desc".equals(order)) {
            criteriaQuery.orderBy(criteriaBuilder.desc(datasortPath));
        } else if (sort != null && "dataSort".equals(sort) && "asc".equals(order)) {
            criteriaQuery.orderBy(criteriaBuilder.asc(datasortPath));
        }
        //按照名字
        Path<String> groupNamePath = root.get(AuthorityGroup_.groupName);
        if (sort != null && "groupName".equals(sort) && "desc".equals(order)) {
            criteriaQuery.orderBy(criteriaBuilder.desc(groupNamePath));
        } else if (sort != null && "groupName".equals(sort) && "asc".equals(order)) {
            criteriaQuery.orderBy(criteriaBuilder.asc(groupNamePath));
        }

        TypedQuery<AuthorityGroup> tq = em.createQuery(criteriaQuery);
        if (pageable != null) {
            tq.setFirstResult(pageable.getPageNumber() * pageable.getPageSize())
                    .setMaxResults(pageable.getPageSize());
        }
        return tq.getResultList();
    }

    @Override
    public long count(AuthorityGroup authorityGroup) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Long> criteriaQuery = criteriaBuilder
                .createQuery(Long.class);
        Root<AuthorityGroup> root = criteriaQuery.from(AuthorityGroup.class);
        criteriaQuery.select(criteriaBuilder.count(root));
        Predicate where = null;
        where = genWhereCondition(authorityGroup, root, criteriaBuilder);
        if (where != null) {
            criteriaQuery.where(where);
        }
        //按照排序
        long count = em.createQuery(criteriaQuery).getSingleResult();
        return count;
    }

    private Predicate genWhereCondition(AuthorityGroup authorityGroup, Root<AuthorityGroup> root, CriteriaBuilder criteriaBuilder) {
        Predicate where = null;
        String authorityGroupNameSearch = authorityGroup.getGroupName();
        if (authorityGroupNameSearch != null && !"".equals(authorityGroupNameSearch)) {
            Path<String> groupSearchPath = root.get(AuthorityGroup_.groupName);
            where = criteriaBuilder.equal(groupSearchPath, authorityGroupNameSearch);
        }
        return where;
    }
}
