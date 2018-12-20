package com.rent.baseinfo.entity;

import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import java.io.Serializable;

/**
 * Created by liu_gl on 2016/8/30.
 */
@StaticMetamodel(BaseEntity.class)
public class BaseEntity_ implements Serializable {
    private static final long serialVersionUID = 1L;
    public static volatile SingularAttribute<BaseEntity, String> id;
    public static volatile SingularAttribute<BaseEntity, Integer> intExtOne;
    public static volatile SingularAttribute<BaseEntity, Integer> intExtTwo;
    public static volatile SingularAttribute<BaseEntity, String> charExtOne;
    public static volatile SingularAttribute<BaseEntity, String> charExtTwo;
    public static volatile SingularAttribute<BaseEntity, String> dataCreateTime;
    public static volatile SingularAttribute<BaseEntity, String> dataUpdateTime;
}
