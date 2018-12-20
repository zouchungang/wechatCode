package com.rent.system.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.rent.baseinfo.entity.BaseEntity;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

/**
 * 平台部门信息表
 *
 * @author lgl
 */
@Entity
@Table(name = "p_dept", indexes = {@Index(columnList = "id")})
@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"})
@DynamicInsert
@DynamicUpdate
public class PlatformDept extends BaseEntity {
    private static final long serialVersionUID = 1L;
    private PlatformInfo platformInfo;//所属企业
    private String deptCode;//部门编码
    private String deptName;//部门名称
    private Boolean useFlag;//启用状态
    private Integer dataSort;//排序
    private String memo;//备注

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "platformInfoId", nullable = false)
    public PlatformInfo getPlatformInfo() {
        return platformInfo;
    }

    public void setPlatformInfo(PlatformInfo platformInfo) {
        this.platformInfo = platformInfo;
    }

    @Length(min = 1, max = 50, message = "部门编码最大长度为50")
    @Column(name = "deptCode", length = 50)
    public String getDeptCode() {
        return deptCode;
    }

    public void setDeptCode(String deptCode) {
        this.deptCode = deptCode;
    }

    @Length(min = 1, max = 50, message = "部门名称最大长度为50")
    @Column(name = "deptName", length = 50)
    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName.trim();
    }

    @Column(name = "useFlag")
    public Boolean getUseFlag() {
        return useFlag;
    }

    public void setUseFlag(Boolean useFlag) {
        this.useFlag = useFlag;
    }

    @NotNull(message = "排序字段为必填项")
    @Column(name = "dataSort")
    public Integer getDataSort() {
        return dataSort;
    }

    public void setDataSort(Integer dataSort) {
        this.dataSort = dataSort;
    }

    @Column(name = "memo", length = 500)
    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    private List<PlatformDept> children = new ArrayList<PlatformDept>();

    @Transient
    public List<PlatformDept> getChildren() {
        return children;
    }

    public void setChildren(List<PlatformDept> children) {
        this.children = children;
    }

}