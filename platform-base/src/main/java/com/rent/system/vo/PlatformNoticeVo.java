package com.rent.system.vo;

public class PlatformNoticeVo {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private String noticeName;// 公告标题
    private String noticeDate;// 发布日期
    private String ownerName;// 发布人

    public String getNoticeName() {
        return noticeName;
    }

    public void setNoticeName(String noticeName) {
        this.noticeName = noticeName;
    }


    public String getNoticeDate() {
        return noticeDate;
    }

    public void setNoticeDate(String noticeDate) {
        this.noticeDate = noticeDate;
    }


    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

}