package com.rent.system.entity;

import com.rent.baseinfo.entity.BaseEntity_;

import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@StaticMetamodel(PlatformNotice.class)
public class PlatformNotice_ extends BaseEntity_ {
    private static final long serialVersionUID = 1L;
    public static volatile SingularAttribute<PlatformNotice, Integer> noticeLevel;// 公告等级
    public static volatile SingularAttribute<PlatformNotice, Integer> noticeSourceType;// 公告来源
    public static volatile SingularAttribute<PlatformNotice, String> noticeName;// 公告标题
    public static volatile SingularAttribute<PlatformNotice, String> noticeDate;// 发布日期
    public static volatile SingularAttribute<PlatformNotice, String> availabilityDate;// 失效日期
    public static volatile SingularAttribute<PlatformNotice, String> noticeContent;// 公告内容
    public static volatile SingularAttribute<PlatformNotice, String> ownerName;// 发布人

}