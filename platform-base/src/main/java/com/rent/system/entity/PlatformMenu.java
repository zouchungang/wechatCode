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
 * 功能菜单信息
 * <p/>
 * Menuflag=0 功能菜单管理 逻辑设计要点
 * <p/>
 * 菜单代码在功能开发完成后就定下来，做为功能库长久保留，用户是不能修改编号,必须通过一个初始化程序进行对此表进行修改,  设计两个页面，一个是系统用户，
 * 可以做所有工作(按system用户自动分配，其它用户无此权限)，一个页面只能修改，且只能改名称与排序及上级菜单，不能修改编号及url地址. 
 * 针对没有权限的功能菜单标为已删除状态  增加时，父级菜单可以选择  修改时，父级菜单不能是本身或其子节点，否则会出现死循环 
 * 禁用时，同时直接禁用其所有子节点  删除时，同时直接删除其所有子节点，物理删除，同时删除所有与之有外键关系的权限表中的记录。  层序号不能大于1000
 */
@Entity
@Table(name = "p_menu", indexes = {@Index(columnList = "id")})
@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"})
@DynamicInsert
@DynamicUpdate
public class PlatformMenu extends BaseEntity {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private String parentId;// 父节点ID
    private Integer dataLevels;// 层
    private Integer levelSequence;// 层序号
    private Boolean leaf;// 是否叶子节点
    private String menuCode;// 菜单编码
    private String menuName;// 菜单名称
    private String imageSrc;// 图标地址
    private String iconCss;// 图标样式
    private String gotoPageUrl;// 导航URL
    private Boolean useFlag;// 启用状态
    private String memo;// 备注
    private Integer functionType;//功能分类


    @Column(name = "parentId")
    public String getParentId() {
        return this.parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    @Column(name = "dataLevels")
    public Integer getDataLevels() {
        return this.dataLevels;
    }

    public void setDataLevels(Integer dataLevels) {
        this.dataLevels = dataLevels;
    }

    @Column(name = "levelSequence")
    public Integer getLevelSequence() {
        return this.levelSequence;
    }

    public void setLevelSequence(Integer levelSequence) {
        this.levelSequence = levelSequence;
    }

    @Column(name = "leaf")
    public Boolean getLeaf() {
        return this.leaf;
    }

    public void setLeaf(Boolean leaf) {
        this.leaf = leaf;
    }

    @Column(name = "menuCode", length = 100)
    public String getMenuCode() {
        return this.menuCode;
    }

    public void setMenuCode(String menuCode) {
        this.menuCode = menuCode;
    }

    @Column(name = "menuName", nullable = false, length = 400)
    public String getMenuName() {
        return this.menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    @Column(name = "imageSrc", length = 400)
    public String getImageSrc() {
        return this.imageSrc;
    }

    public void setImageSrc(String imageSrc) {
        this.imageSrc = imageSrc;
    }

    @Column(name = "gotoPageUrl", length = 400)
    public String getGotoPageUrl() {
        return this.gotoPageUrl;
    }

    public void setGotoPageUrl(String gotoPageUrl) {
        this.gotoPageUrl = gotoPageUrl;
    }

    @Column(name = "useFlag")
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

    @Column(name = "iconCss", length = 400)
    public String getIconCss() {
        return iconCss;
    }

    public void setIconCss(String iconCss) {
        this.iconCss = iconCss;
    }

    @Column(name = "functionType")
    public Integer getFunctionType() {
        return functionType;
    }

    public void setFunctionType(Integer functionType) {
        this.functionType = functionType;
    }
}