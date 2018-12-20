package com.rent.business.dao.impl;

import com.rent.business.dao.RUsersinfoEntityDaoCustom;
import com.rent.business.entity.RUsersinfoEntity;
import com.rent.business.entity.RUsersinfoEntity_;
import com.rent.business.vo.RUsersinfoEntityVo;
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
public class RUsersinfoEntityDaoImpl implements RUsersinfoEntityDaoCustom {
	private static Logger logger = LoggerFactory.getLogger(RUsersinfoEntityDaoImpl.class);
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<RUsersinfoEntity> find(RUsersinfoEntityVo rUsersinfoEntityVo, Pageable pageable, String sort, String order) {
		CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
		CriteriaQuery<RUsersinfoEntity> criteriaQuery = criteriaBuilder.createQuery(RUsersinfoEntity.class);
		Root<RUsersinfoEntity> root = criteriaQuery.from(RUsersinfoEntity.class);
		criteriaQuery.select(root);
		Predicate where = null;
		where = genWhereCondition(rUsersinfoEntityVo, root, criteriaBuilder);
		if (where != null) {
			criteriaQuery.where(where);
		}
//排序

		TypedQuery<RUsersinfoEntity> tq = em.createQuery(criteriaQuery);
		if (pageable != null)
			tq.setFirstResult(pageable.getPageNumber() * pageable.getPageSize()).setMaxResults(pageable.getPageSize());
		return tq.getResultList();
	}

	@Override
	public long count(RUsersinfoEntityVo rUsersinfoEntityVo) {
		CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
		CriteriaQuery<Long> criteriaQuery = criteriaBuilder.createQuery(Long.class);
		Root<RUsersinfoEntity> root = criteriaQuery.from(RUsersinfoEntity.class);
		criteriaQuery.select(criteriaBuilder.count(root));
		Predicate where = null;
		where = genWhereCondition(rUsersinfoEntityVo, root, criteriaBuilder);
		if (where != null) {
			criteriaQuery.where(where);
		}
		long count = em.createQuery(criteriaQuery).getSingleResult();
		return count;
	}

	private Predicate genWhereCondition(RUsersinfoEntityVo rUsersinfoEntityVo, Root<RUsersinfoEntity> root, CriteriaBuilder
			criteriaBuilder) {
		Predicate where = null;

		java.lang.String truenameSearch = rUsersinfoEntityVo.getTruename();
		if (truenameSearch != null && !"".equals(truenameSearch)) {
			Path<java.lang.String> truenameSearchPath = root.get(RUsersinfoEntity_.truename);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.like(truenameSearchPath, "%" + truenameSearch + "%"));
			} else {
				where = criteriaBuilder.like(truenameSearchPath, "%" + truenameSearch + "%");
			}
		}
		java.lang.String sexSearch = rUsersinfoEntityVo.getSex();
		if (sexSearch != null && !"".equals(sexSearch)) {
			Path<java.lang.String> sexSearchPath = root.get(RUsersinfoEntity_.sex);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.like(sexSearchPath, "%" + sexSearch + "%"));
			} else {
				where = criteriaBuilder.like(sexSearchPath, "%" + sexSearch + "%");
			}
		}
		java.lang.String addressSearch = rUsersinfoEntityVo.getAddress();
		if (addressSearch != null && !"".equals(addressSearch)) {
			Path<java.lang.String> addressSearchPath = root.get(RUsersinfoEntity_.address);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.like(addressSearchPath, "%" + addressSearch + "%"));
			} else {
				where = criteriaBuilder.like(addressSearchPath, "%" + addressSearch + "%");
			}
		}
		java.lang.String imageSearch = rUsersinfoEntityVo.getImage();
		if (imageSearch != null && !"".equals(imageSearch)) {
			Path<java.lang.String> imageSearchPath = root.get(RUsersinfoEntity_.image);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.like(imageSearchPath, "%" + imageSearch + "%"));
			} else {
				where = criteriaBuilder.like(imageSearchPath, "%" + imageSearch + "%");
			}
		}
		java.lang.String remarkSearch = rUsersinfoEntityVo.getRemark();
		if (remarkSearch != null && !"".equals(remarkSearch)) {
			Path<java.lang.String> remarkSearchPath = root.get(RUsersinfoEntity_.remark);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.like(remarkSearchPath, "%" + remarkSearch + "%"));
			} else {
				where = criteriaBuilder.like(remarkSearchPath, "%" + remarkSearch + "%");
			}
		}
		return where;
	}

}
