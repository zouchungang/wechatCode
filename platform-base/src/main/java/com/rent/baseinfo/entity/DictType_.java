package com.rent.baseinfo.entity;

import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import java.io.Serializable;

/**
 * 参数主信息
 */
@StaticMetamodel(DictType.class)
public class DictType_ extends BaseEntity_ implements Serializable{

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    public static volatile SingularAttribute<DictType, String> typeCode;
    public static volatile SingularAttribute<DictType, String> typeName;
    public static volatile SingularAttribute<DictType, Integer> dataSort;
    public static volatile SingularAttribute<DictType, Boolean> useFlag;
    public static volatile SingularAttribute<DictType, String> memo;

}