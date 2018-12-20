package com.rent.business.vo;


import com.rent.baseinfo.entity.Canton;
import com.rent.baseinfo.entity.Dict;
import com.rent.business.entity.RUsersEntity;

import java.sql.Timestamp;

/**
* --查询Vo类
**/
public class RBegrentEntityVo {

    private String id;//主键
    private int uid;
    private String hid;
    private String aid;
    private int chamber;
    private int hall;
    private int toilet;
    private String address;
    private String minprice;
    private String maxprice;
    private String minarceage;
    private String maxarceage;
    private Timestamp time;
    private String remark;
    private Integer state;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getHid() {
        return hid;
    }

    public void setHid(String hid) {
        this.hid = hid;
    }

    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }

    public int getChamber() {
        return chamber;
    }

    public void setChamber(int chamber) {
        this.chamber = chamber;
    }

    public int getHall() {
        return hall;
    }

    public void setHall(int hall) {
        this.hall = hall;
    }

    public int getToilet() {
        return toilet;
    }

    public void setToilet(int toilet) {
        this.toilet = toilet;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMinprice() {
        return minprice;
    }

    public void setMinprice(String minprice) {
        this.minprice = minprice;
    }

    public String getMaxprice() {
        return maxprice;
    }

    public void setMaxprice(String maxprice) {
        this.maxprice = maxprice;
    }

    public String getMinarceage() {
        return minarceage;
    }

    public void setMinarceage(String minarceage) {
        this.minarceage = minarceage;
    }

    public String getMaxarceage() {
        return maxarceage;
    }

    public void setMaxarceage(String maxarceage) {
        this.maxarceage = maxarceage;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getEsthment() {
        return esthment;
    }

    public void setEsthment(String esthment) {
        this.esthment = esthment;
    }

    public RUsersEntity getrUsersByUid() {
        return rUsersByUid;
    }

    public void setrUsersByUid(RUsersEntity rUsersByUid) {
        this.rUsersByUid = rUsersByUid;
    }

    public Dict getbDictByHid() {
        return bDictByHid;
    }

    public void setbDictByHid(Dict bDictByHid) {
        this.bDictByHid = bDictByHid;
    }

    public Canton getbCantonByAid() {
        return bCantonByAid;
    }

    public void setbCantonByAid(Canton bCantonByAid) {
        this.bCantonByAid = bCantonByAid;
    }

    private String esthment;
    private RUsersEntity rUsersByUid;
    private Dict bDictByHid;
    private Canton bCantonByAid;
}