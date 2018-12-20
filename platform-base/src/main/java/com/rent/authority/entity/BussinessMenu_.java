package com.rent.authority.entity;

import com.rent.baseinfo.entity.BaseEntity_;

import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

/**
 * 实体类副类
 * Created by sbd on 2016-11-23.
 */
@StaticMetamodel(BussinessMenu.class)
public class BussinessMenu_ extends BaseEntity_ {

    private static final long serialVersionUID = 1L;
    public static volatile SingularAttribute<BussinessMenu, String> menuName;
    public static volatile SingularAttribute<BussinessMenu, String> parentId;
    public static volatile SingularAttribute<BussinessMenu, Boolean> useFlag;
    public static volatile SingularAttribute<BussinessMenu, Integer> bussinessType;
    public static volatile SingularAttribute<BussinessMenu, Boolean> leaf;
    public static volatile SingularAttribute<BussinessMenu, Integer> dataSort;
    public static volatile SingularAttribute<BussinessMenu, Integer> dataLevels;
}
