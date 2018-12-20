package com.rent.system.entity;

import com.rent.baseinfo.entity.BaseEntity_;

import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@StaticMetamodel(PlatformMenu.class)
public class PlatformMenu_ extends BaseEntity_ {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    public static volatile SingularAttribute<PlatformMenu, String> parentId;// 父节点ID
    public static volatile SingularAttribute<PlatformMenu, Integer> dataLevels;// 层
    public static volatile SingularAttribute<PlatformMenu, Integer> levelSequence;// 层序号
    public static volatile SingularAttribute<PlatformMenu, Boolean> leaf;// 是否叶子节点
    public static volatile SingularAttribute<PlatformMenu, String> menuCode;// 菜单编码
    public static volatile SingularAttribute<PlatformMenu, String> menuName;// 菜单名称
    public static volatile SingularAttribute<PlatformMenu, String> imageSrc;// 图标地址
    public static volatile SingularAttribute<PlatformMenu, String> iconCss;// 图标样式
    public static volatile SingularAttribute<PlatformMenu, String> gotoPageUrl;// 导航URL
    public static volatile SingularAttribute<PlatformMenu, Boolean> useFlag;// 启用状态
    public static volatile SingularAttribute<PlatformMenu, String> memo;// 备注
    public static volatile SingularAttribute<PlatformMenu, Integer> functionType;// 是否叶子节点

}