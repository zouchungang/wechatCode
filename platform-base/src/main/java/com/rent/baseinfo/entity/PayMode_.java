package com.rent.baseinfo.entity;

import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@StaticMetamodel(PayMode.class)
public class PayMode_ extends BaseEntity_ {

    private static final long serialVersionUID = 1L;
    public static volatile SingularAttribute<PayMode, String> paymodeCode;// 支付方式编码
    public static volatile SingularAttribute<PayMode, String> paymodeName;// 名称
    public static volatile SingularAttribute<PayMode, Boolean> useFlag;// 状态
    public static volatile SingularAttribute<PayMode, Integer> dataSort;// 排序
    public static volatile SingularAttribute<PayMode, String> memo;// 备注

}