package com.rent.system.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.rent.baseinfo.entity.BaseEntity;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 平台员工信息表
 */
@Entity
@Table(name = "p_employee", indexes = {@Index(columnList = "id")})
@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"})
@DynamicInsert
@DynamicUpdate
public class PlatformEmployee extends BaseEntity {

    private static final long serialVersionUID = 1L;
    private String employeeCode;//员工账号
    private PlatformDept platformDept;//部门ID
    private String employeeName;//员工姓名
    private String pwd;//登录密码
    private String managepwd;//管理密码
    private Integer dataSort;//排序
    private Boolean adminManager;//是否超级管理员
    private String sex;//性别
    private String cardId;//身份证号
    private String mobile;//手机号码
    private String photo;//照片
    private Boolean useFlag;//启用状态
    private String memo;//备注


    @Column(name = "employeeCode", nullable = false, length = 50)
    public String getEmployeeCode() {
        return this.employeeCode;
    }

    public void setEmployeeCode(String employeeCode) {
        this.employeeCode = employeeCode;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "platformDeptId")
    public PlatformDept getPlatformDept() {
        return this.platformDept;
    }

    public void setPlatformDept(PlatformDept platformDept) {
        this.platformDept = platformDept;
    }

    @Column(name = "employeeName", nullable = false, length = 400)
    public String getEmployeeName() {
        return this.employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    @Column(name = "pwd", nullable = false, length = 50)
    public String getPwd() {
        return this.pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    @Column(name = "managepwd", length = 50)
    public String getManagepwd() {
        return this.managepwd;
    }

    public void setManagepwd(String managepwd) {
        this.managepwd = managepwd;
    }

    @Column(name = "sex", nullable = false, length = 8)
    public String getSex() {
        return this.sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @Column(name = "cardId", length = 40)
    public String getCardId() {
        return this.cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    @Column(name = "mobile", length = 40)
    public String getMobile() {
        return this.mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    @Column(name = "photo", length = 400)
    public String getPhoto() {
        return this.photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    @Column(name = "memo", length = 1024)
    public String getMemo() {
        return this.memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    @Column(name = "dataSort")
    public Integer getDataSort() {
        return dataSort;
    }

    public void setDataSort(Integer dataSort) {
        this.dataSort = dataSort;
    }

    @Column(name = "adminManager",updatable = false)
    public Boolean getAdminManager() {
        return adminManager;
    }


    public void setAdminManager(Boolean adminManager) {
        this.adminManager = adminManager;
    }

    @Column(name = "useFlag")
    public Boolean getUseFlag() {
        return useFlag;
    }

    public void setUseFlag(Boolean useFlag) {
        this.useFlag = useFlag;
    }

}