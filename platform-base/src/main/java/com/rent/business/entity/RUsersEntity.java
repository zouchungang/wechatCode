package com.rent.business.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.rent.baseinfo.entity.BaseEntity;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "r_users", indexes = {@Index(columnList = "id")})
@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"})
@DynamicInsert
@DynamicUpdate
public class RUsersEntity  extends BaseEntity{
	private String uname;
	private String upwd;
	private String phone;
	private String email;
	private String truename;
	private String sex;
	private String address;
	private String image;
	private String remark;
	private Collection<RBegrentEntity> rBegrentsByUid;
	private Collection<RLeaseroomEntity> rLeaseroomsByUid;

	
	@Column(name = "uname")
	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	
	@Column(name = "upwd")
	public String getUpwd() {
		return upwd;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}

	
	@Column(name = "phone")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	
	@Column(name = "email")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
	@Column(name = "truename")
	public String getTruename() {
		return truename;
	}

	public void setTruename(String truename) {
		this.truename = truename;
	}

	
	@Column(name = "sex")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	
	@Column(name = "address")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	
	@Column(name = "image")
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	
	@Column(name = "remark")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@OneToMany(mappedBy = "rUsersByUid")
	public Collection<RBegrentEntity> getrBegrentsByUid() {
		return rBegrentsByUid;
	}

	public void setrBegrentsByUid(Collection<RBegrentEntity> rBegrentsByUid) {
		this.rBegrentsByUid = rBegrentsByUid;
	}

	@OneToMany(mappedBy = "rUsersByUid")
	public Collection<RLeaseroomEntity> getrLeaseroomsByUid() {
		return rLeaseroomsByUid;
	}

	public void setrLeaseroomsByUid(Collection<RLeaseroomEntity> rLeaseroomsByUid) {
		this.rLeaseroomsByUid = rLeaseroomsByUid;
	}
}
