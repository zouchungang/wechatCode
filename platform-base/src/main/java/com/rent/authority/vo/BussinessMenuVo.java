package com.rent.authority.vo;

/**
 * 菜单 副类
 * Created by Administrator on 2016-11-23.
 */
public class BussinessMenuVo {

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
    private Integer dataSort;//排序
    private String memo;// 备注
    private Integer bussinessType;//功能分类

    public Integer getDataLevels() {
        return dataLevels;
    }

    public void setDataLevels(Integer dataLevels) {
        this.dataLevels = dataLevels;
    }

    public Integer getDataSort() {
        return dataSort;
    }

    public void setDataSort(Integer dataSort) {
        this.dataSort = dataSort;
    }

    public Integer getBussinessType() {
        return bussinessType;
    }

    public void setBussinessType(Integer bussinessType) {
        this.bussinessType = bussinessType;
    }

    public String getGotoPageUrl() {
        return gotoPageUrl;
    }

    public void setGotoPageUrl(String gotoPageUrl) {
        this.gotoPageUrl = gotoPageUrl;
    }

    public String getIconCss() {
        return iconCss;
    }

    public void setIconCss(String iconCss) {
        this.iconCss = iconCss;
    }

    public String getImageSrc() {
        return imageSrc;
    }

    public void setImageSrc(String imageSrc) {
        this.imageSrc = imageSrc;
    }

    public Boolean getLeaf() {
        return leaf;
    }

    public void setLeaf(Boolean leaf) {
        this.leaf = leaf;
    }

    public Integer getLevelSequence() {
        return levelSequence;
    }

    public void setLevelSequence(Integer levelSequence) {
        this.levelSequence = levelSequence;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getMenuCode() {
        return menuCode;
    }

    public void setMenuCode(String menuCode) {
        this.menuCode = menuCode;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public Boolean getUseFlag() {
        return useFlag;
    }

    public void setUseFlag(Boolean useFlag) {
        this.useFlag = useFlag;
    }
}
