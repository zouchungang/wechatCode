package com.rent.business.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.rent.baseinfo.entity.BaseEntity;
import com.rent.baseinfo.entity.Canton;
import com.rent.baseinfo.entity.Dict;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "r_begrent", indexes = {@Index(columnList = "id")})
@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"})
@DynamicInsert
@DynamicUpdate
public class RBegrentEntity extends BaseEntity {
	private int chamber;
	private int hall;
	private int toilet;
	private String address;
	private String minprice;
	private String maxprice;
	private String minarceage;
	private String maxarceage;
	private String time;
	private String remark;
	private Integer state;
	private String esthment;
	private RUsersEntity rUsersByUid;
	private Dict bDictByHid;
	private Canton bCantonByAid;

	@Column(name = "chamber")
	public int getChamber() {
		return chamber;
	}

	public void setChamber(int chamber) {
		this.chamber = chamber;
	}

	@Column(name = "hall")
	public int getHall() {
		return hall;
	}

	public void setHall(int hall) {
		this.hall = hall;
	}

	@Column(name = "toilet")
	public int getToilet() {
		return toilet;
	}

	public void setToilet(int toilet) {
		this.toilet = toilet;
	}

	@Column(name = "address")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "minprice")
	public String getMinprice() {
		return minprice;
	}

	public void setMinprice(String minprice) {
		this.minprice = minprice;
	}

	@Column(name = "maxprice")
	public String getMaxprice() {
		return maxprice;
	}

	public void setMaxprice(String maxprice) {
		this.maxprice = maxprice;
	}

	@Column(name = "minarceage")
	public String getMinarceage() {
		return minarceage;
	}

	public void setMinarceage(String minarceage) {
		this.minarceage = minarceage;
	}

	@Column(name = "maxarceage")
	public String getMaxarceage() {
		return maxarceage;
	}

	public void setMaxarceage(String maxarceage) {
		this.maxarceage = maxarceage;
	}

	@Column(name = "time")
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@Column(name = "remark")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Column(name = "state")
	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	@Column(name = "esthment")
	public String getEsthment() {
		return esthment;
	}

	public void setEsthment(String esthment) {
		this.esthment = esthment;
	}


	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "uid", nullable = false)
	public RUsersEntity getrUsersByUid() {
		return rUsersByUid;
	}

	public void setrUsersByUid(RUsersEntity rUsersByUid) {
		this.rUsersByUid = rUsersByUid;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "hid", nullable = false)
	public Dict getbDictByHid() {
		return bDictByHid;
	}

	public void setbDictByHid(Dict bDictByHid) {
		this.bDictByHid = bDictByHid;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "aid", nullable = false)
	public Canton getbCantonByAid() {
		return bCantonByAid;
	}

	public void setbCantonByAid(Canton bCantonByAid) {
		this.bCantonByAid = bCantonByAid;
	}
}
