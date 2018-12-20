package com.rent.business.dao.impl;

import com.rent.business.dao.RUsersEntityDaoCustom;
import com.rent.business.entity.RUsersEntity;
import com.rent.business.entity.RUsersEntity_;
import com.rent.business.vo.RUsersEntityVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Pageable;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.*;
import java.util.List;

/**
 * --自定义查询接口实现类(JPA)
 **/
public class RUsersEntityDaoImpl implements RUsersEntityDaoCustom {
	private static Logger logger = LoggerFactory.getLogger(RUsersEntityDaoImpl.class);
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<RUsersEntity> find(RUsersEntityVo rUsersEntityVo, Pageable pageable, String sort, String order) {
		CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
		CriteriaQuery<RUsersEntity> criteriaQuery = criteriaBuilder.createQuery(RUsersEntity.class);
		Root<RUsersEntity> root = criteriaQuery.from(RUsersEntity.class);
		criteriaQuery.select(root);
		Predicate where = null;
		where = genWhereCondition(rUsersEntityVo, root, criteriaBuilder);
		if (where != null) {
			criteriaQuery.where(where);
		}
//排序

		TypedQuery<RUsersEntity> tq = em.createQuery(criteriaQuery);
		if (pageable != null)
			tq.setFirstResult(pageable.getPageNumber() * pageable.getPageSize()).setMaxResults(pageable.getPageSize());
		return tq.getResultList();
	}

	@Override
	public long count(RUsersEntityVo rUsersEntityVo) {
		CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
		CriteriaQuery<Long> criteriaQuery = criteriaBuilder.createQuery(Long.class);
		Root<RUsersEntity> root = criteriaQuery.from(RUsersEntity.class);
		criteriaQuery.select(criteriaBuilder.count(root));
		Predicate where = null;
		where = genWhereCondition(rUsersEntityVo, root, criteriaBuilder);
		if (where != null) {
			criteriaQuery.where(where);
		}
		long count = em.createQuery(criteriaQuery).getSingleResult();
		return count;
	}

	private Predicate genWhereCondition(RUsersEntityVo rUsersEntityVo, Root<RUsersEntity> root, CriteriaBuilder
			criteriaBuilder) {
		Predicate where = null;
		java.lang.String unameSearch = rUsersEntityVo.getUname();
		if (unameSearch != null && !"".equals(unameSearch)) {
			Path<java.lang.String> unameSearchPath = root.get(RUsersEntity_.uname);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.like(unameSearchPath, "%" + unameSearch + "%"));
			} else {
				where = criteriaBuilder.like(unameSearchPath, "%" + unameSearch + "%");
			}
		}
		java.lang.String upwdSearch = rUsersEntityVo.getUpwd();
		if (upwdSearch != null && !"".equals(upwdSearch)) {
			Path<java.lang.String> upwdSearchPath = root.get(RUsersEntity_.upwd);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.like(upwdSearchPath, "%" + upwdSearch + "%"));
			} else {
				where = criteriaBuilder.like(upwdSearchPath, "%" + upwdSearch + "%");
			}
		}
		java.lang.String phoneSearch = rUsersEntityVo.getPhone();
		if (phoneSearch != null && !"".equals(phoneSearch)) {
			Path<java.lang.String> phoneSearchPath = root.get(RUsersEntity_.phone);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.like(phoneSearchPath, "%" + phoneSearch + "%"));
			} else {
				where = criteriaBuilder.like(phoneSearchPath, "%" + phoneSearch + "%");
			}
		}
		java.lang.String emailSearch = rUsersEntityVo.getEmail();
		if (emailSearch != null && !"".equals(emailSearch)) {
			Path<java.lang.String> emailSearchPath = root.get(RUsersEntity_.email);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.like(emailSearchPath, "%" + emailSearch + "%"));
			} else {
				where = criteriaBuilder.like(emailSearchPath, "%" + emailSearch + "%");
			}
		}
		java.lang.String truenameSearch = rUsersEntityVo.getTruename();
		if (truenameSearch != null && !"".equals(truenameSearch)) {
			Path<java.lang.String> truenameSearchPath = root.get(RUsersEntity_.truename);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.like(truenameSearchPath, "%" + truenameSearch + "%"));
			} else {
				where = criteriaBuilder.like(truenameSearchPath, "%" + truenameSearch + "%");
			}
		}
		java.lang.String sexSearch = rUsersEntityVo.getSex();
		if (sexSearch != null && !"".equals(sexSearch)) {
			Path<java.lang.String> sexSearchPath = root.get(RUsersEntity_.sex);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.like(sexSearchPath, "%" + sexSearch + "%"));
			} else {
				where = criteriaBuilder.like(sexSearchPath, "%" + sexSearch + "%");
			}
		}
		java.lang.String addressSearch = rUsersEntityVo.getAddress();
		if (addressSearch != null && !"".equals(addressSearch)) {
			Path<java.lang.String> addressSearchPath = root.get(RUsersEntity_.address);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.like(addressSearchPath, "%" + addressSearch + "%"));
			} else {
				where = criteriaBuilder.like(addressSearchPath, "%" + addressSearch + "%");
			}
		}
		java.lang.String imageSearch = rUsersEntityVo.getImage();
		if (imageSearch != null && !"".equals(imageSearch)) {
			Path<java.lang.String> imageSearchPath = root.get(RUsersEntity_.image);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.like(imageSearchPath, "%" + imageSearch + "%"));
			} else {
				where = criteriaBuilder.like(imageSearchPath, "%" + imageSearch + "%");
			}
		}
		java.lang.String remarkSearch = rUsersEntityVo.getRemark();
		if (remarkSearch != null && !"".equals(remarkSearch)) {
			Path<java.lang.String> remarkSearchPath = root.get(RUsersEntity_.remark);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.like(remarkSearchPath, "%" + remarkSearch + "%"));
			} else {
				where = criteriaBuilder.like(remarkSearchPath, "%" + remarkSearch + "%");
			}
		}
		return where;
	}

}
