package com.rent.baseinfo.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 岗位权限值对象
 */
public class GroupMenuVo implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private String menuid;
    private String menuname;
    private int dataLevels;
    private String parentid;
    private int sel;
    private int isadd;
    private int isupdate;
    private int isdisable;
    private int isdelete;
    private int iscustomized;
    private List<GroupMenuVo> children = new ArrayList<GroupMenuVo>();

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

    public int getSel() {
        return sel;
    }

    public void setSel(int sel) {
        this.sel = sel;
    }

    public int getIsadd() {
        return isadd;
    }

    public void setIsadd(int isadd) {
        this.isadd = isadd;
    }

    public int getIsupdate() {
        return isupdate;
    }

    public void setIsupdate(int isupdate) {
        this.isupdate = isupdate;
    }

    public int getIsdisable() {
        return isdisable;
    }

    public void setIsdisable(int isdisable) {
        this.isdisable = isdisable;
    }

    public int getIsdelete() {
        return isdelete;
    }

    public void setIsdelete(int isdelete) {
        this.isdelete = isdelete;
    }

    public int getIscustomized() {
        return iscustomized;
    }

    public void setIscustomized(int iscustomized) {
        this.iscustomized = iscustomized;
    }

    public List<GroupMenuVo> getChildren() {
        return children;
    }

    public void setChildren(List<GroupMenuVo> children) {
        this.children = children;
    }

}