package com.rent.system.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 岗位权限值对象
 */
public class EmployeeMenuVo implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private String menuid;
    private String menuname;
    private int dataLevels;
    private int levelSequence;
    private String parentid;
    private String url;
    private String iconCss;
    private List<EmployeeMenuVo> children = new ArrayList<EmployeeMenuVo>();

    public String getMenuid() {
        return menuid;
    }

    public void setMenuid(String menuid) {
        this.menuid = menuid;
    }

    public String getMenuname() {
        return menuname;
    }

    public void setMenuname(String menuname) {
        this.menuname = menuname;
    }

    public int getDataLevels() {
        return dataLevels;
    }

    public void setDataLevels(int dataLevels) {
        this.dataLevels = dataLevels;
    }

    public String getParentid() {
        return parentid;
    }

    public void setParentid(String parentid) {
        this.parentid = parentid;
    }

    public List<EmployeeMenuVo> getChildren() {
        return children;
    }

    public void setChildren(List<EmployeeMenuVo> children) {
        this.children = children;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getLevelSequence() {
        return levelSequence;
    }

    public void setLevelSequence(int levelSequence) {
        this.levelSequence = levelSequence;
    }

    public String getIconCss() {
        return iconCss;
    }

    public void setIconCss(String iconCss) {
        this.iconCss = iconCss;
    }
}