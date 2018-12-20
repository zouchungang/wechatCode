package com.rent.business.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Pageable;

import com.rent.business.entity.RLeaseroomEntity;
import com.rent.business.vo.RLeaseroomEntityVo;
import com.rent.business.entity.RLeaseroomEntity_;
import com.rent.business.dao.RLeaseroomEntityDaoCustom;

/**
 * --自定义查询接口实现类(JPA)
 **/
public class RLeaseroomEntityDaoImpl implements RLeaseroomEntityDaoCustom {
	private static Logger logger = LoggerFactory.getLogger(RLeaseroomEntityDaoImpl.class);
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<RLeaseroomEntity> find(RLeaseroomEntityVo rLeaseroomEntityVo, Pageable pageable, String sort, String order) {
		CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
		CriteriaQuery<RLeaseroomEntity> criteriaQuery = criteriaBuilder.createQuery(RLeaseroomEntity.class);
		Root<RLeaseroomEntity> root = criteriaQuery.from(RLeaseroomEntity.class);
		criteriaQuery.select(root);
		Predicate where = null;
		where = genWhereCondition(rLeaseroomEntityVo, root, criteriaBuilder);
		if (where != null) {
			criteriaQuery.where(where);
		}
//排序
		Path<java.sql.Timestamp> timesortPath = root.get(RLeaseroomEntity_.time);
		if (sort != null && "time".equals(sort) && "desc".equals(order)) {
			criteriaQuery.orderBy(criteriaBuilder.desc(timesortPath));
		}
		if (sort != null && "time".equals(sort) && "asc".equals(order)) {
			criteriaQuery.orderBy(criteriaBuilder.asc(timesortPath));
		}

		TypedQuery<RLeaseroomEntity> tq = em.createQuery(criteriaQuery);
		if (pageable != null)
			tq.setFirstResult(pageable.getPageNumber() * pageable.getPageSize()).setMaxResults(pageable.getPageSize());
		return tq.getResultList();
	}

	@Override
	public long count(RLeaseroomEntityVo rLeaseroomEntityVo) {
		CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
		CriteriaQuery<Long> criteriaQuery = criteriaBuilder.createQuery(Long.class);
		Root<RLeaseroomEntity> root = criteriaQuery.from(RLeaseroomEntity.class);
		criteriaQuery.select(criteriaBuilder.count(root));
		Predicate where = null;
		where = genWhereCondition(rLeaseroomEntityVo, root, criteriaBuilder);
		if (where != null) {
			criteriaQuery.where(where);
		}
		long count = em.createQuery(criteriaQuery).getSingleResult();
		return count;
	}

	private Predicate genWhereCondition(RLeaseroomEntityVo rLeaseroomEntityVo, Root<RLeaseroomEntity> root, CriteriaBuilder
			criteriaBuilder) {
		Predicate where = null;
		int idSearch = rLeaseroomEntityVo.getId();
		if (idSearch != -1) {
			Path<Integer> idSearchPath = root.get(RLeaseroomEntity_.id);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.equal(idSearchPath, "%" + idSearch + "%"));
			} else {
				where = criteriaBuilder.equal(idSearchPath, "%" + idSearch + "%");
			}
		}
		int uidSearch = rLeaseroomEntityVo.getUid();
		if (uidSearch != -1) {
			Path<Integer> uidSearchPath = root.get(RLeaseroomEntity_.uid);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.equal(uidSearchPath, "%" + uidSearch + "%"));
			} else {
				where = criteriaBuilder.equal(uidSearchPath, "%" + uidSearch + "%");
			}
		}
		java.lang.String hidSearch = rLeaseroomEntityVo.getHid();
		if (hidSearch != null && !"".equals(hidSearch)) {
			Path<java.lang.String> hidSearchPath = root.get(RLeaseroomEntity_.hid);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.like(hidSearchPath, "%" + hidSearch + "%"));
			} else {
				where = criteriaBuilder.like(hidSearchPath, "%" + hidSearch + "%");
			}
		}
		java.lang.String addressSearch = rLeaseroomEntityVo.getAddress();
		if (addressSearch != null && !"".equals(addressSearch)) {
			Path<java.lang.String> addressSearchPath = root.get(RLeaseroomEntity_.address);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.like(addressSearchPath, "%" + addressSearch + "%"));
			} else {
				where = criteriaBuilder.like(addressSearchPath, "%" + addressSearch + "%");
			}
		}
		java.lang.String aidSearch = rLeaseroomEntityVo.getAid();
		if (aidSearch != null && !"".equals(aidSearch)) {
			Path<java.lang.String> aidSearchPath = root.get(RLeaseroomEntity_.aid);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.like(aidSearchPath, "%" + aidSearch + "%"));
			} else {
				where = criteriaBuilder.like(aidSearchPath, "%" + aidSearch + "%");
			}
		}
		java.sql.Timestamp timeSearch = rLeaseroomEntityVo.getTime();
		if (timeSearch != null && !"".equals(timeSearch)) {
			Path<java.sql.Timestamp> timeSearchPath = root.get(RLeaseroomEntity_.time);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.equal(timeSearchPath, "%" + timeSearch + "%"));
			} else {
				where = criteriaBuilder.equal(timeSearchPath, "%" + timeSearch + "%");
			}
		}
		double acreageSearch = rLeaseroomEntityVo.getAcreage();
		if (acreageSearch !=-1) {
			Path<Double> acreageSearchPath = root.get(RLeaseroomEntity_.acreage);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.equal(acreageSearchPath,  acreageSearch ));
			} else {
				where = criteriaBuilder.equal(acreageSearchPath,  acreageSearch );
			}
		}
		java.lang.String titleSearch = rLeaseroomEntityVo.getTitle();
		if (titleSearch != null && !"".equals(titleSearch)) {
			Path<java.lang.String> titleSearchPath = root.get(RLeaseroomEntity_.title);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.like(titleSearchPath, "%" + titleSearch + "%"));
			} else {
				where = criteriaBuilder.like(titleSearchPath, "%" + titleSearch + "%");
			}
		}
		double pirceSearch = rLeaseroomEntityVo.getPirce();
		if (pirceSearch != -1) {
			Path<Double> pirceSearchPath = root.get(RLeaseroomEntity_.pirce);
			if (where != null) {
				where = criteriaBuilder.equal(where, criteriaBuilder.equal(pirceSearchPath,  pirceSearch ));
			} else {
				where = criteriaBuilder.equal(pirceSearchPath, pirceSearch );
			}
		}
		int chamberSearch = rLeaseroomEntityVo.getChamber();
		if (chamberSearch !=-1) {
			Path<Integer> chamberSearchPath = root.get(RLeaseroomEntity_.chamber);
			if (where != null) {
				where = criteriaBuilder.equal(where, criteriaBuilder.equal(chamberSearchPath,  chamberSearch ));
			} else {
				where = criteriaBuilder.equal(chamberSearchPath,  chamberSearch );
			}
		}
		int hallSearch = rLeaseroomEntityVo.getHall();
		if (hallSearch !=-1) {
			Path<Integer> hallSearchPath = root.get(RLeaseroomEntity_.hall);
			if (where != null) {
				where = criteriaBuilder.equal(where, criteriaBuilder.equal(hallSearchPath,  hallSearch ));
			} else {
				where = criteriaBuilder.equal(hallSearchPath,  hallSearch );
			}
		}
		int toiletSearch = rLeaseroomEntityVo.getToilet();
		if (toiletSearch !=-1) {
			Path<Integer> toiletSearchPath = root.get(RLeaseroomEntity_.toilet);
			if (where != null) {
				where = criteriaBuilder.equal(where, criteriaBuilder.equal(toiletSearchPath, toiletSearch));
			} else {
				where = criteriaBuilder.equal(toiletSearchPath, toiletSearch );
			}
		}
		java.lang.String esthmentSearch = rLeaseroomEntityVo.getEsthment();
		if (esthmentSearch != null && !"".equals(esthmentSearch)) {
			Path<java.lang.String> esthmentSearchPath = root.get(RLeaseroomEntity_.esthment);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.like(esthmentSearchPath, "%" + esthmentSearch + "%"));
			} else {
				where = criteriaBuilder.like(esthmentSearchPath, "%" + esthmentSearch + "%");
			}
		}
		java.lang.String imgSearch = rLeaseroomEntityVo.getImg();
		if (imgSearch != null && !"".equals(imgSearch)) {
			Path<java.lang.String> imgSearchPath = root.get(RLeaseroomEntity_.img);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.like(imgSearchPath, "%" + imgSearch + "%"));
			} else {
				where = criteriaBuilder.like(imgSearchPath, "%" + imgSearch + "%");
			}
		}
		java.lang.String remarkSearch = rLeaseroomEntityVo.getRemark();
		if (remarkSearch != null && !"".equals(remarkSearch)) {
			Path<java.lang.String> remarkSearchPath = root.get(RLeaseroomEntity_.remark);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.like(remarkSearchPath, "%" + remarkSearch + "%"));
			} else {
				where = criteriaBuilder.like(remarkSearchPath, "%" + remarkSearch + "%");
			}
		}
		int stateSearch = rLeaseroomEntityVo.getState();
		if (stateSearch !=-1) {
			Path<Integer> stateSearchPath = root.get(RLeaseroomEntity_.state);
			if (where != null) {
				where = criteriaBuilder.and(where, criteriaBuilder.equal(stateSearchPath, remarkSearch));
			} else {
				where = criteriaBuilder.equal(stateSearchPath,remarkSearch);
			}
		}
		return where;
	}

}
