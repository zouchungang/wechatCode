package com.rent.system.entity;

import com.rent.baseinfo.entity.BaseEntity_;

import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

/**
 * 员工信息表
 */
@StaticMetamodel(PlatformEmployee.class)
public class PlatformEmployee_ extends BaseEntity_ {
    private static final long serialVersionUID = 1L;
    public static volatile SingularAttribute<PlatformEmployee, String> employeeCode;// 员工账号
    public static volatile SingularAttribute<PlatformEmployee, PlatformDept> platformDept;// 部门ID
    public static volatile SingularAttribute<PlatformEmployee, String> employeeName;// 员工姓名
    public static volatile SingularAttribute<PlatformEmployee, String> pwd;// 登录密码
    public static volatile SingularAttribute<PlatformEmployee, Integer> dataSort;// 排序
    public static volatile SingularAttribute<PlatformEmployee, Boolean> adminManager;// 是否超级管理员
    public static volatile SingularAttribute<PlatformEmployee, String> mobile;// 手机号码
    public static volatile SingularAttribute<PlatformEmployee, String> photo;// 照片
    public static volatile SingularAttribute<PlatformEmployee, Boolean> useFlag;// 启用状态

}