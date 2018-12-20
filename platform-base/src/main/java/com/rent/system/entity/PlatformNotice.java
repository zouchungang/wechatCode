package com.rent.system.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.rent.baseinfo.entity.BaseEntity;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

/**
 * 平台公告信息
 */
@Entity
@Table(name = "p_notice", indexes = {@Index(columnList = "id")})
@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"})
@DynamicInsert
@DynamicUpdate
public class PlatformNotice extends BaseEntity {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private String noticeName;// 公告标题
    private String noticeContent;// 公告内容
    private Integer noticeLevel;// 公告等级
    private Integer noticeSourceType;// 公告来源
    private String noticeDate;// 发布日期
    private String availabilityDate;// 失效日期
    private String ownerName;// 发布人

    @Column(name = "noticeName")
    public String getNoticeName() {
        return noticeName;
    }

    public void setNoticeName(String noticeName) {
        this.noticeName = noticeName;
    }

    @Column(name = "noticeContent")
    public String getNoticeContent() {
        return noticeContent;
    }

    public void setNoticeContent(String noticeContent) {
        this.noticeContent = noticeContent;
    }

    @Column(name = "noticeLevel")
    public Integer getNoticeLevel() {
        return noticeLevel;
    }

    public void setNoticeLevel(Integer noticeLevel) {
        this.noticeLevel = noticeLevel;
    }

    @Column(name = "noticeSourceType")
    public Integer getNoticeSourceType() {
        return noticeSourceType;
    }

    public void setNoticeSourceType(Integer noticeSourceType) {
        this.noticeSourceType = noticeSourceType;
    }

    @Column(name = "noticeDate")
    public String getNoticeDate() {
        return noticeDate;
    }

    public void setNoticeDate(String noticeDate) {
        this.noticeDate = noticeDate;
    }

    @Column(name = "availabilityDate")
    public String getAvailabilityDate() {
        return availabilityDate;
    }

    public void setAvailabilityDate(String availabilityDate) {
        this.availabilityDate = availabilityDate;
    }

    @Column(name = "ownerName")
    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

}