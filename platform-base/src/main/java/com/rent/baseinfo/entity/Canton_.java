package com.rent.baseinfo.entity;

import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@StaticMetamodel(Canton.class)
public class Canton_ extends BaseEntity_ {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    public static volatile SingularAttribute<Canton, String> cantonCode;// 行政区域编码
    public static volatile SingularAttribute<Canton, String> parentId;// 父节点ID
    public static volatile SingularAttribute<Canton, Integer> dataSort;// 排序
    public static volatile SingularAttribute<Canton, String> cantonName;// 名称
    public static volatile SingularAttribute<Canton, Boolean> useFlag;// 状态
    public static volatile SingularAttribute<Canton, String> memo;// 备注
}