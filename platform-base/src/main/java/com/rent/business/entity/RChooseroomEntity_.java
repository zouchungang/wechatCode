package com.rent.business.entity;

import com.rent.baseinfo.entity.BaseEntity_;

import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

/**
* --实体类校验
*
**/
@StaticMetamodel(RChooseroomEntity.class)
public class RChooseroomEntity_ extends BaseEntity_ {
	private static final long serialVersionUID = 1L;
	public static volatile SingularAttribute<RChooseroomEntity, Integer> id;
	public static volatile SingularAttribute<RChooseroomEntity, Integer> lid;
	public static volatile SingularAttribute<RChooseroomEntity, Integer> uid;
	public static volatile SingularAttribute<RChooseroomEntity, java.sql.Timestamp> time;
}
