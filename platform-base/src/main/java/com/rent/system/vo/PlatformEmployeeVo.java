package com.rent.system.vo;

import com.rent.system.entity.PlatformDept;

import java.io.Serializable;

/**
 * 平台员工信息表
 */
public class PlatformEmployeeVo implements Serializable {

    private String employeeCode;//员工账号
    private PlatformDept platformDept;//部门ID
    private String employeeName;//员工姓名
    private Integer dataSort;//排序
    private Boolean adminManager;//是否超级管理员
    private String cardId;//身份证号
    private String mobile;//手机号码
    private Boolean useFlag;//启用状态


    public String getEmployeeCode() {
        return this.employeeCode;
    }

    public void setEmployeeCode(String employeeCode) {
        this.employeeCode = employeeCode;
    }

    public PlatformDept getPlatformDept() {
        return this.platformDept;
    }

    public void setPlatformDept(PlatformDept platformDept) {
        this.platformDept = platformDept;
    }

    public String getEmployeeName() {
        return this.employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getCardId() {
        return this.cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public String getMobile() {
        return this.mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Integer getDataSort() {
        return dataSort;
    }

    public void setDataSort(Integer dataSort) {
        this.dataSort = dataSort;
    }

    public Boolean getAdminManager() {
        return adminManager;
    }


    public void setAdminManager(Boolean adminManager) {
        this.adminManager = adminManager;
    }

    public Boolean getUseFlag() {
        return useFlag;
    }

    public void setUseFlag(Boolean useFlag) {
        this.useFlag = useFlag;
    }

}