package com.rent.baseinfo.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 参数从表
 */
@Entity
@Table(name = "b_dict", indexes = {@Index(columnList = "id")})
@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"})
@DynamicInsert
@DynamicUpdate
public class Dict extends BaseEntity {

    private static final long serialVersionUID = 1L;
    private DictType dictType;// 分类类型外键
    private String paramName;// 名称
    private String paramValue;// 参数值
    private Boolean useFlag;// 启用状态
    private Boolean initFlag = false;// 是否为初始化数据（为初始化数据不可修改）
    private String memo;// 备注


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "dictTypeId", nullable = false)
    public DictType getDictType() {
        return this.dictType;
    }

    public void setDictType(DictType dictType) {
        this.dictType = dictType;
    }

    @Column(name = "paramName", nullable = false, length = 400)
    public String getParamName() {
        return this.paramName;
    }

    public void setParamName(String paramName) {
        this.paramName = paramName;
    }

    @Column(name = "paramValue", nullable = false, length = 2)
    public String getParamValue() {
        return this.paramValue;
    }

    public void setParamValue(String paramValue) {
        this.paramValue = paramValue;
    }

    @Column(name = "useFlag", nullable = false)
    public Boolean getUseFlag() {
        return this.useFlag;
    }

    public void setUseFlag(Boolean useFlag) {
        this.useFlag = useFlag;
    }

    @Column(name = "initFlag", nullable = false)
    public Boolean getInitFlag() {
        return initFlag;
    }

    public void setInitFlag(Boolean initFlag) {
        this.initFlag = initFlag;
    }

    @Column(name = "memo", length = 1024)
    public String getMemo() {
        return this.memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }


}