package com.rent.business.entity;

import com.rent.baseinfo.entity.BaseEntity_;

import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

/**
* --实体类校验
*
**/
@StaticMetamodel(RLeaseroomEntity.class)
public class RLeaseroomEntity_ extends BaseEntity_ {
	private static final long serialVersionUID = 1L;
	public static volatile SingularAttribute<RLeaseroomEntity, Integer> id;
	public static volatile SingularAttribute<RLeaseroomEntity, Integer> uid;
	public static volatile SingularAttribute<RLeaseroomEntity, java.lang.String> hid;
	public static volatile SingularAttribute<RLeaseroomEntity, java.lang.String> address;
	public static volatile SingularAttribute<RLeaseroomEntity, java.lang.String> aid;
	public static volatile SingularAttribute<RLeaseroomEntity, java.sql.Timestamp> time;
	public static volatile SingularAttribute<RLeaseroomEntity, Double> acreage;
	public static volatile SingularAttribute<RLeaseroomEntity, java.lang.String> title;
	public static volatile SingularAttribute<RLeaseroomEntity, Double> pirce;
	public static volatile SingularAttribute<RLeaseroomEntity, Integer> chamber;
	public static volatile SingularAttribute<RLeaseroomEntity, Integer> hall;
	public static volatile SingularAttribute<RLeaseroomEntity, Integer> toilet;
	public static volatile SingularAttribute<RLeaseroomEntity, java.lang.String> esthment;
	public static volatile SingularAttribute<RLeaseroomEntity, java.lang.String> img;
	public static volatile SingularAttribute<RLeaseroomEntity, java.lang.String> remark;
	public static volatile SingularAttribute<RLeaseroomEntity, Integer> state;
}
