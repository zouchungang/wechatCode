package com.rent.system.vo;

import com.rent.common.util.JsonUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Tree {

    private String id;
    private String text;
    private String parentid;
    private boolean checked;
    private String state = "closed";// closed|open
    private String url;
    private int isleaf;
    private String iconCls;
    private Map<String, Object> attrs;
    private List<Tree> children;

    public Tree() {
    }

    public Tree(String id, String txt, int isleaf) {
        this.id = id;
        this.text = txt;
        setIsleaf(isleaf);
    }

    public Tree(String id, String txt, String parentid) {
        this.id = id;
        this.text = txt;
        this.parentid = parentid;
    }

    public Tree(String id, String txt, String parentid, int isleaf) {
        this.id = id;
        this.text = txt;
        this.parentid = parentid;
        setIsleaf(isleaf);
    }

    // 只用于菜单模块
    public Tree(String id, String txt, String parentid, String url) {
        this.id = id;
        this.text = txt;
        this.parentid = parentid;
        this.url = url;
        this.state = "open";
        this.isleaf = 1;
    }

    /**
     * 获取属性
     *
     * @param key
     * @return
     */
    public String attr(String key) {
        if (null == attrs) {
            return null;
        }
        return String.valueOf(attrs.get(key));
    }

    /**
     * 新增属性
     *
     * @param key
     * @param value
     * @return
     */
    public Tree attr(String key, String value) {
        if (null == attrs) {
            attrs = new HashMap<String, Object>();
        }
        attrs.put(key, value);
        return this;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getIsleaf() {
        return isleaf;
    }

    public void setIsleaf(int isleaf) {
        this.isleaf = isleaf;
        if (1 == isleaf) {
            setState("open");
        }
    }

    public Map<String, Object> getAttrs() {
        return attrs;
    }

    public void setAttrs(Map<String, Object> attrs) {
        this.attrs = attrs;
    }

    public List<Tree> getChildren() {
        return children;
    }

    public void setChildren(List<Tree> children) {
        this.children = children;
    }

    public String getParentid() {
        return parentid;
    }

    public void setParentid(String parentid) {
        this.parentid = parentid;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    @Override
    public String toString() {
        return "[" + JsonUtils.toJacksonStr(this) + "]";
    }

}
