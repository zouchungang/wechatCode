package com.rent.baseinfo.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

/**
 * 参数主信息
 */
@Entity
@Table(name = "b_dict_type", indexes = {@Index(columnList = "id")})
@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"})
@DynamicInsert
@DynamicUpdate
public class DictType extends BaseEntity {

    private static final long serialVersionUID = 1L;
    private String typeCode;// 代码
    private String typeName;// 名称
    private Integer dataSort;// 排序
    private Boolean useFlag;// 启用状态
    private String memo;// 备注

    @Column(name = "typeCode", nullable = false, length = 50)
    public String getTypeCode() {
        return this.typeCode;
    }

    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode;
    }

    @Column(name = "typeName", nullable = false, length = 400)
    public String getTypeName() {
        return this.typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }


    @Column(name = "dataSort", nullable = false, precision = 22, scale = 0)
    public Integer getDataSort() {
        return this.dataSort;
    }

    public void setDataSort(Integer dataSort) {
        this.dataSort = dataSort;
    }

    @Column(name = "useFlag", nullable = false, precision = 22, scale = 0)
    public Boolean getUseFlag() {
        return this.useFlag;
    }

    public void setUseFlag(Boolean useFlag) {
        this.useFlag = useFlag;
    }


    @Column(name = "memo", length = 1024)
    public String getMemo() {
        return this.memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }


}