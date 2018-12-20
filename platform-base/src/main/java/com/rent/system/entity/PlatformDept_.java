package com.rent.system.entity;

import com.rent.baseinfo.entity.BaseEntity_;

import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@StaticMetamodel(PlatformDept.class)
public class PlatformDept_ extends BaseEntity_ {

    private static final long serialVersionUID = 1L;
    public static volatile SingularAttribute<PlatformDept, PlatformInfo> platformInfo;// 所属企业
    public static volatile SingularAttribute<PlatformDept, String> parentId;// 父节点ID
    public static volatile SingularAttribute<PlatformDept, String> deptCode;//
    public static volatile SingularAttribute<PlatformDept, String> deptName;// 部门名称
    public static volatile SingularAttribute<PlatformDept, Boolean> useFlag;// 启用状态
    public static volatile SingularAttribute<PlatformDept, Integer> dataSort;
    public static volatile SingularAttribute<PlatformDept, String> memo;// 备注

}