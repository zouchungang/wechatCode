package com.rent.business.dao.impl;

import com.rent.business.dao.RImagetableEntityDaoCustom;
import com.rent.business.entity.RImagetableEntity;
import com.rent.business.entity.RImagetableEntity_;
import com.rent.business.vo.RImagetableEntityVo;
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
public class RImagetableEntityDaoImpl implements RImagetableEntityDaoCustom {
	private static Logger logger = LoggerFactory.getLogger(RImagetableEntityDaoImpl.class);
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<RImagetableEntity> find(RImagetableEntityVo rImagetableEntityVo, Pageable pageable, String sort, String order) {
		CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
		CriteriaQuery<RImagetableEntity> criteriaQuery = criteriaBuilder.createQuery(RImagetableEntity.class);
		Root<RImagetableEntity> root = criteriaQuery.from(RImagetableEntity.class);
		criteriaQuery.select(root);
		Predicate where = null;
		where = genWhereCondition(rImagetableEntityVo, root, criteriaBuilder);
		if (where != null) {
			criteriaQuery.where(where);
		}
//排序

		TypedQuery<RImagetableEntity> tq = em.createQuery(criteriaQuery);
		if (pageable != null)
			tq.setFirstResult(pageable.getPageNumber() * pageable.getPageSize()).setMaxResults(pageable.getPageSize());
		return tq.getResultList();
	}

	@Override
	public long count(RImagetableEntityVo rImagetableEntityVo) {
		CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
		CriteriaQuery<Long> criteriaQuery = criteriaBuilder.createQuery(Long.class);
		Root<RImagetableEntity> root = criteriaQuery.from(RImagetableEntity.class);
		criteriaQuery.select(criteriaBuilder.count(root));
		Predicate where = null;
		where = genWhereCondition(rImagetableEntityVo, root, criteriaBuilder);
		if (where != null) {
			criteriaQuery.where(where);
		}
		long count = em.createQuery(criteriaQuery).getSingleResult();
		return count;
	}

	private Predicate genWhereCondition(RImagetableEntityVo rImagetableEntityVo, Root<RImagetableEntity> root, CriteriaBuilder
			criteriaBuilder) {
		Predicate where = null;
		int idSearch = rImagetableEntityVo.getId();
		if (idSearch != -1) {
			Path<Integer> idSearchPath = root.get(RImagetableEntity_.id);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.equal(idSearchPath,  idSearch ));
			} else {
				where = criteriaBuilder.equal(idSearchPath,  idSearch );
			}
		}
		java.lang.String imageSearch = rImagetableEntityVo.getImage();
		if (imageSearch != null && !"".equals(imageSearch)) {
			Path<java.lang.String> imageSearchPath = root.get(RImagetableEntity_.image);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.like(imageSearchPath, "%" + imageSearch + "%"));
			} else {
				where = criteriaBuilder.like(imageSearchPath, "%" + imageSearch + "%");
			}
		}
		int hidSearch = rImagetableEntityVo.getHid();
		if (hidSearch != -1 ) {
			Path<Integer> hidSearchPath = root.get(RImagetableEntity_.hid);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.equal(hidSearchPath,  hidSearch ));
			} else {
				where = criteriaBuilder.equal(hidSearchPath,  hidSearch );
			}
		}
		return where;
	}

}
