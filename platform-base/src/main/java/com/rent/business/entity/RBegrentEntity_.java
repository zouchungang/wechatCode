package com.rent.business.entity;

import com.rent.baseinfo.entity.BaseEntity_;

import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

/**
* --实体类校验
*
**/
@StaticMetamodel(RBegrentEntity.class)
public class RBegrentEntity_ extends BaseEntity_ {
	private static final long serialVersionUID = 1L;
	public static volatile SingularAttribute<RBegrentEntity, Integer> id;
	public static volatile SingularAttribute<RBegrentEntity, Integer> uid;
	public static volatile SingularAttribute<RBegrentEntity, java.lang.String> hid;
	public static volatile SingularAttribute<RBegrentEntity, java.lang.String> aid;
	public static volatile SingularAttribute<RBegrentEntity, Integer> chamber;
	public static volatile SingularAttribute<RBegrentEntity, Integer> hall;
	public static volatile SingularAttribute<RBegrentEntity, Integer> toilet;
	public static volatile SingularAttribute<RBegrentEntity, java.lang.String> address;
	public static volatile SingularAttribute<RBegrentEntity, java.lang.String> minprice;
	public static volatile SingularAttribute<RBegrentEntity, java.lang.String> maxprice;
	public static volatile SingularAttribute<RBegrentEntity, java.lang.String> minarceage;
	public static volatile SingularAttribute<RBegrentEntity, java.lang.String> maxarceage;
	public static volatile SingularAttribute<RBegrentEntity, java.sql.Timestamp> time;
	public static volatile SingularAttribute<RBegrentEntity, java.lang.String> remark;
	public static volatile SingularAttribute<RBegrentEntity, java.lang.Integer> state;
	public static volatile SingularAttribute<RBegrentEntity, java.lang.String> esthment;
}
