package com.rent.authority.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.rent.baseinfo.entity.BaseEntity;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

/**
 * 定义系统功能菜单
 * <p>
 * 业务类型，1.基础信息。2.分销商，3，电商，4，窗口售票
 */
@Entity
@Table(name = "au_b_menu", indexes = {@Index(columnList = "id")})
@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"})
@DynamicInsert
@DynamicUpdate
public class BussinessMenu extends BaseEntity {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private String parentId;// 父节点ID
    private Integer dataLevels;// 层
    private Integer levelSequence=1;// 层序号
    private Boolean leaf=false;// 是否叶子节点
    private String menuCode="";// 菜单编码
    private String menuName;// 菜单名称
    private String imageSrc="";// 图标地址
    private String iconCss="";// 图标样式
    private String gotoPageUrl="";// 导航URL
    private Boolean useFlag=true;// 启用状态
    private Integer dataSort=1;//排序
    private Integer bussinessType;//业务类型，1.基础信息。2.分销商，3，电商，4，窗口售票
    private String memo="";// 备注

    @Column(name = "dataSort")
    public Integer getDataSort() {
        return dataSort;
    }

    public void setDataSort(Integer dataSort) {
        this.dataSort = dataSort;
    }

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

    @Column(name = "bussinessType")
    public Integer getBussinessType() {
        return bussinessType;
    }

    public void setBussinessType(Integer bussinessType) {
        this.bussinessType = bussinessType;
    }
}