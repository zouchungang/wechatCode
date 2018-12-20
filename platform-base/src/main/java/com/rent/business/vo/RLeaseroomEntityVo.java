package com.rent.business.vo;


import java.sql.Timestamp;

/**
* --查询Vo类
**/
public class RLeaseroomEntityVo {

    private int id;//主键
    private int uid;
    private java.lang.String hid;
    private java.lang.String address;
    private java.lang.String aid;
    private java.lang.String title;
    private java.lang.String esthment;
    private java.lang.String img;
    private java.lang.String remark;
    private Timestamp time;
    private double acreage;
    private double pirce;
    private int chamber;
    private int hall;
    private int toilet;
    private int state;

    public double getAcreage() {
        return acreage;
    }

    public void setAcreage(double acreage) {
        this.acreage = acreage;
    }

    public double getPirce() {
        return pirce;
    }

    public void setPirce(double pirce) {
        this.pirce = pirce;
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

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getEsthment() {
        return esthment;
    }

    public void setEsthment(String esthment) {
        this.esthment = esthment;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}