package com.rent.baseinfo.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

/**
 * 区域信息
 */
@Entity
@Table(name = "b_canton", indexes = {@Index(columnList = "id")})
@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"})
@DynamicInsert
@DynamicUpdate
public class Canton extends BaseEntity {

    private static final long serialVersionUID = 1L;
    private String cantonCode;// 行政区域编码
    private String cantonName;// 名称
    private String parentId;// 父节点ID
    private Integer dataSort;// 排序
    private Boolean useFlag;// 状态 0表示禁用，1表示启用
    private String memo;// 备注
    private String shortCode;// 助记码
    private String coordinates;//坐标
    private List<Canton> children = new ArrayList<Canton>();
    private String state;

    @Length(max = 50, message = "助记码长度不可大于50")
    @Column(name = "shortCode", length = 50)
    public String getShortCode() {
        return shortCode;
    }

    public void setShortCode(String shortCode) {
        this.shortCode = shortCode;
    }

    @NotBlank(message = "坐标不可为空")
    @Length(max = 50, message = "坐标长度不可大于50")
    @Column(name = "coordinates", length = 50)
    public String getCoordinates() {
        return coordinates;
    }

    public void setCoordinates(String coordinates) {
        this.coordinates = coordinates;
    }

    @NotBlank(message = "行政区域编码不可为空")
    @Length(max = 50, message = "行政区域编码长度不可大于50")
    @Column(name = "cantonCode", length = 50)
    public String getCantonCode() {
        return this.cantonCode;
    }

    public void setCantonCode(String cantonCode) {
        this.cantonCode = cantonCode;
    }

    @Column(name = "parentId", length = 50)
    public String getParentId() {
        return this.parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    @NotNull(message = "排序不可为空")
    @Max(value =9999, message = "排序必须为1-9999之间的整数")
    @Min( value =1, message = "排序必须为1-9999之间的整数")
    @Column(name = "dataSort")
    public Integer getDataSort() {
        return this.dataSort;
    }

    public void setDataSort(Integer dataSort) {
        this.dataSort = dataSort;
    }

    @NotBlank(message = "名称不可为空")
    @Length(max = 400, message = "名称长度不可大于400")
    @Column(name = "cantonName", nullable = false, length = 400)
    public String getCantonName() {
        return this.cantonName;
    }

    public void setCantonName(String cantonName) {
        this.cantonName = cantonName;
    }

    @NotNull(message = "启用状态不可为空")
    @Column(name = "useFlag", nullable = false, precision = 22, scale = 0)
    public Boolean getUseFlag() {
        return this.useFlag;
    }

    public void setUseFlag(Boolean useFlag) {
        this.useFlag = useFlag;
    }

    @Length(max = 400, message = "备注长度不可大于400")
    @Column(name = "memo", length = 400)
    public String getMemo() {
        return this.memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    @Transient
    public List<Canton> getChildren() {
        return children;
    }

    public void setChildren(List<Canton> children) {
        this.children = children;
    }

    @Transient
    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}