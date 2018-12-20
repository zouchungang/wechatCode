package com.rent.business.entity;

import com.rent.baseinfo.entity.BaseEntity_;

import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

/**
* --实体类校验
*
**/
@StaticMetamodel(RImagetableEntity.class)
public class RImagetableEntity_ extends BaseEntity_ {
	private static final long serialVersionUID = 1L;
	public static volatile SingularAttribute<RImagetableEntity, Integer> id;
	public static volatile SingularAttribute<RImagetableEntity, java.lang.String> image;
	public static volatile SingularAttribute<RImagetableEntity, Integer> hid;
}
