package com.rent.business.entity;

import com.rent.baseinfo.entity.BaseEntity_;

import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

/**
* --实体类校验
*
**/
@StaticMetamodel(RUsersinfoEntity.class)
public class RUsersinfoEntity_ extends BaseEntity_ {
	private static final long serialVersionUID = 1L;
	public static volatile SingularAttribute<RUsersinfoEntity, Integer> uid;
	public static volatile SingularAttribute<RUsersinfoEntity, java.lang.String> truename;
	public static volatile SingularAttribute<RUsersinfoEntity, java.lang.String> sex;
	public static volatile SingularAttribute<RUsersinfoEntity, java.lang.String> address;
	public static volatile SingularAttribute<RUsersinfoEntity, java.lang.String> image;
	public static volatile SingularAttribute<RUsersinfoEntity, java.lang.String> remark;
}
