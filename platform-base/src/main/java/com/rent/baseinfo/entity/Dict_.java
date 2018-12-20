package com.rent.baseinfo.entity;

import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

/**
 * 参数从表
 */
@StaticMetamodel(Dict.class)
public class Dict_ extends BaseEntity_ {

    private static final long serialVersionUID = 1L;
    public static volatile SingularAttribute<Dict, DictType> dictType;//分类类型外键
    public static volatile SingularAttribute<Dict, String> paramName;// 名称
    public static volatile SingularAttribute<Dict, String> paramValue;// 参数值
    public static volatile SingularAttribute<Dict, Integer> useFlag;// 启用状态
    public static volatile SingularAttribute<Dict, Integer> initFlag;// 启用状态
    public static volatile SingularAttribute<Dict, String> memo;// 备注

}