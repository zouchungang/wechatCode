package com.rent.business.vo;

import java.sql.Timestamp;

/**
* --查询Vo类
**/
public class RChooseroomEntityVo {

    private int id;//主键
    private int lid;
    private int uid;
    private Timestamp time;

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public int getLid() {
        return this.lid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }

    public int getUid() {
        return this.uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }


}