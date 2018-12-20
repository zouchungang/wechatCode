package com.rent.baseinfo.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

/**
 * 支付方式
 */
@Entity
@Table(name = "b_pay_mode", indexes = {@Index(columnList = "id")})
@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"})
@DynamicInsert
@DynamicUpdate
public class PayMode extends BaseEntity {

    private static final long serialVersionUID = 1L;
    private String paymodeCode;// 支付方式编码
    private String paymodeName;// 名称
    private Integer dataSort;// 排序
    private Boolean useFlag;// 状态 0表示禁用，1表示启用
    private String memo;// 备注

    @Column(name = "paymodeCode", length = 50)
    public String getPaymodeCode() {
        return paymodeCode;
    }

    public void setPaymodeCode(String paymodeCode) {
        this.paymodeCode = paymodeCode;
    }

    @Column(name = "paymodeName")
    public String getPaymodeName() {
        return paymodeName;
    }

    public void setPaymodeName(String paymodeName) {
        this.paymodeName = paymodeName;
    }


    @Column(name = "dataSort")
    public Integer getDataSort() {
        return dataSort;
    }

    public void setDataSort(Integer dataSort) {
        this.dataSort = dataSort;
    }


    @Column(name = "useFlag")
    public Boolean getUseFlag() {
        return useFlag;
    }

    public void setUseFlag(Boolean useFlag) {
        this.useFlag = useFlag;
    }


    @Column(name = "memo")
    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

}
