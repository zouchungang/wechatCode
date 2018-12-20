package com.rent.system.dao.impl;

import com.rent.common.Constants;
import com.rent.system.dao.PlatformEmployeeDaoCustom;
import com.rent.system.entity.PlatformDept;
import com.rent.system.entity.PlatformDept_;
import com.rent.system.entity.PlatformEmployee;
import com.rent.system.entity.PlatformEmployee_;
import com.rent.system.vo.PlatformEmployeeVo;
import org.springframework.data.domain.Pageable;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.List;

public class PlatformEmployeeDaoImpl implements PlatformEmployeeDaoCustom {
    @PersistenceContext
    private EntityManager em;

    @Override
    public List<PlatformEmployee> find(PlatformEmployeeVo platformEmployeeVo, Pageable pageable, String sort, String order) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<PlatformEmployee> criteriaQuery = criteriaBuilder
                .createQuery(PlatformEmployee.class);
        Root<PlatformEmployee> root = criteriaQuery.from(PlatformEmployee.class);
        criteriaQuery.select(root);
        Predicate where = genWhereCondition(platformEmployeeVo, root, criteriaBuilder);
        if (where != null) {
            criteriaQuery.where(where);
        }
        List<Order> orderList = new ArrayList<Order>();
        //按照排序
        Path<Integer> datasortPath = root.get(PlatformEmployee_.dataSort);
        if (sort != null && "dataSort".equals(sort) && "desc".equals(order)) {
            orderList.add(criteriaBuilder.desc(datasortPath));
        } else if (sort != null && "dataSort".equals(sort) && "asc".equals(order)) {
            orderList.add(criteriaBuilder.asc(datasortPath));
        }
        Path<Boolean> useFlagPath = root.get(PlatformEmployee_.useFlag);
        orderList.add(criteriaBuilder.desc(useFlagPath));
        criteriaQuery.orderBy(orderList);
        TypedQuery<PlatformEmployee> tq = em.createQuery(criteriaQuery);
        if (pageable != null) {
            tq.setFirstResult(pageable.getPageNumber() * pageable.getPageSize())
                    .setMaxResults(pageable.getPageSize());
        }
        return tq.getResultList();
    }

    @Override
    public long count(PlatformEmployeeVo platformEmployeeVo) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery<Long> criteriaQuery = criteriaBuilder
                .createQuery(Long.class);
        Root<PlatformEmployee> root = criteriaQuery.from(PlatformEmployee.class);
        criteriaQuery.select(criteriaBuilder.count(root));
        Predicate where = genWhereCondition(platformEmployeeVo, root, criteriaBuilder);
        criteriaQuery.where(where);
        long count = em.createQuery(criteriaQuery).getSingleResult();
        return count;
    }

    private Predicate genWhereCondition(PlatformEmployeeVo platformEmployeeVo,
                                        Root<PlatformEmployee> root, CriteriaBuilder criteriaBuilder) {
        Predicate where = null;
        PlatformDept pd = platformEmployeeVo.getPlatformDept();
        if (pd != null && !"".equals(pd.getId())) {
            Path<PlatformDept> platformDeptPath = root.get(PlatformEmployee_.platformDept);
            Path<String> platformDeptIdPath = platformDeptPath.get(PlatformDept_.id);
                where = criteriaBuilder.equal(platformDeptIdPath, pd.getId());
        }
        String pbmemployeeName = platformEmployeeVo.getEmployeeName();
        if (pbmemployeeName != null && !"".equals(pbmemployeeName)) {
            Path<String> employeenamePath = root.get(PlatformEmployee_.employeeName);
            if (where != null) {
                where = criteriaBuilder.and(where, criteriaBuilder.like(employeenamePath, "%" + pbmemployeeName + "%"));
            } else {
                where = criteriaBuilder.like(employeenamePath, "%" + pbmemployeeName + "%");
            }
        }
        Boolean useflag = platformEmployeeVo.getUseFlag();
        if (useflag != null) {
            Path<Boolean> useflagPath = root.get(PlatformEmployee_.useFlag);
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
        //Boolean isAdmin = platformEmployeeVo.getAdminManager();
        Boolean isAdmin = Constants.INACTIVE;
        if (isAdmin != null) {
            Path<Boolean> isadminPath = root.get(PlatformEmployee_.adminManager);
            if (isAdmin) {
                if (where != null) {
                    where = criteriaBuilder.and(
                            where, criteriaBuilder.isTrue(isadminPath));
                } else {
                    where = criteriaBuilder.isTrue(isadminPath);
                }
            } else {
                if (where != null) {
                    where = criteriaBuilder.and(
                            where, criteriaBuilder.isFalse(isadminPath));
                } else {
                    where = criteriaBuilder.isFalse(isadminPath);
                }
            }

        }
        return where;
    }
}
