package com.rent.authority.dao.impl;

import com.rent.authority.dao.GroupBussinessMenuDaoCustom;
import com.rent.authority.entity.AuthorityGroup;
import com.rent.authority.entity.GroupBussinessMenu;
import com.rent.authority.entity.GroupBussinessMenu_;
import org.springframework.data.domain.Pageable;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.*;
import java.util.List;

/**
 * Created by Administrator on 2016-11-23.
 */
public class GroupBussinessMenuDaoImpl implements GroupBussinessMenuDaoCustom {
    @PersistenceContext
    private EntityManager em;


    @Override
    public List<GroupBussinessMenu> find(GroupBussinessMenu groupBussinessMenu, Pageable pageable, String sort, String order) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<GroupBussinessMenu> criteriaQuery = criteriaBuilder
                .createQuery(GroupBussinessMenu.class);
        Root<GroupBussinessMenu> root = criteriaQuery.from(GroupBussinessMenu.class);
        criteriaQuery.select(root);
        Predicate where = genWhereCondition(groupBussinessMenu, root, criteriaBuilder);
        if (where != null) {
            criteriaQuery.where(where);
        }
        TypedQuery<GroupBussinessMenu> tq = em.createQuery(criteriaQuery);
        if (pageable != null) {
            tq.setFirstResult(pageable.getPageNumber() * pageable.getPageSize())
                    .setMaxResults(pageable.getPageSize());
        }
        // TODO Auto-generated method stub
        return tq.getResultList();
    }

    @Override
    public long count(GroupBussinessMenu groupBussinessMenu) {
        return 0;
    }

    private Predicate genWhereCondition(GroupBussinessMenu groupBussinessMenu,
                                        Root<GroupBussinessMenu> root, CriteriaBuilder criteriaBuilder) {
        Predicate where = null;
        AuthorityGroup authorityGroup = groupBussinessMenu.getAuthorityGroup();
        if (authorityGroup!=null) {
            Path<AuthorityGroup> authorityGroupPath = root.get(GroupBussinessMenu_.authorityGroup);
                where = criteriaBuilder.equal(authorityGroupPath, authorityGroup);
            }
        return where;
    }
}
