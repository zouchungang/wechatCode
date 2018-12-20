package com.rent.authority.entity;

import com.rent.baseinfo.entity.BaseEntity_;

import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@StaticMetamodel(AuthorityGroup.class)
public class AuthorityGroup_ extends BaseEntity_ {
    private static final long serialVersionUID = 1L;
    public static volatile SingularAttribute<AuthorityGroup, String> groupName;// 企业分组名称
    public static volatile SingularAttribute<AuthorityGroup, Integer> dataSort;// 排序
    public static volatile SingularAttribute<AuthorityGroup, Boolean> useFlag;// 启用状态

}