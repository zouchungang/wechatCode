package com.rent.business.entity;

import com.rent.baseinfo.entity.BaseEntity_;

import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

/**
* --实体类校验
*
**/
@StaticMetamodel(RUsersEntity.class)
public class RUsersEntity_ extends BaseEntity_ {
	private static final long serialVersionUID = 1L;
	public static volatile SingularAttribute<RUsersEntity, Integer> uid;
	public static volatile SingularAttribute<RUsersEntity, java.lang.String> uname;
	public static volatile SingularAttribute<RUsersEntity, java.lang.String> upwd;
	public static volatile SingularAttribute<RUsersEntity, java.lang.String> phone;
	public static volatile SingularAttribute<RUsersEntity, java.lang.String> email;
	public static volatile SingularAttribute<RUsersEntity, java.lang.String> truename;
	public static volatile SingularAttribute<RUsersEntity, java.lang.String> sex;
	public static volatile SingularAttribute<RUsersEntity, java.lang.String> address;
	public static volatile SingularAttribute<RUsersEntity, java.lang.String> image;
	public static volatile SingularAttribute<RUsersEntity, java.lang.String> remark;
}
