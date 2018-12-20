package com.uticket.develop.vo;

public class TableEntity {

	private String fieldName;//字段名称
	private String fieldNameU;//jsp页面显示的名称
	private String type;//字段类型
	private String annoType;//字段注解类型
	private String formType;//jsp页面form字段类型
	private String showList;//是否显示在列表中
	private String showSearch;//jsp页面是否需要添加到搜索条件
	private String sortWhether;//是否排序
	private String fieldNameF;//字段第一个字母大写，查询条件的时候使用
    private String hiddenWhether;//字段是否为隐藏字段
    private String mustWrite;//是否必填
    private String validateType;//数据格式验证

    public String getHiddenWhether() {
        return hiddenWhether;
    }

    public void setHiddenWhether(String hiddenWhether) {
        this.hiddenWhether = hiddenWhether;
    }

    public String getFieldNameF() {
		return fieldNameF;
	}

	public void setFieldNameF(String fieldNameF) {
		this.fieldNameF = fieldNameF;
	}

	public String getSortWhether() {
		return sortWhether;
	}

	public void setSortWhether(String sortWhether) {
		this.sortWhether = sortWhether;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getFieldNameU() {
		return fieldNameU;
	}

	public void setFieldNameU(String fieldNameU) {
		this.fieldNameU = fieldNameU;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAnnoType() {
		return annoType;
	}

	public void setAnnoType(String annoType) {
		this.annoType = annoType;
	}

	public String getFormType() {
		return formType;
	}

	public void setFormType(String formType) {
		this.formType = formType;
	}

	public String getShowList() {
		return showList;
	}

	public void setShowList(String showList) {
		this.showList = showList;
	}

	public String getShowSearch() {
		return showSearch;
	}

	public void setShowSearch(String showSearch) {
		this.showSearch = showSearch;
	}

	public String getMustWrite() {
		return mustWrite;
	}

	public void setMustWrite(String mustWrite) {
		this.mustWrite = mustWrite;
	}

	public String getValidateType() {
		return validateType;
	}

	public void setValidateType(String validateType) {
		this.validateType = validateType;
	}
}
