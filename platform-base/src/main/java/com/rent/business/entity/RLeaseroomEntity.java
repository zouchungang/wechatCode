package com.rent.business.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.rent.baseinfo.entity.BaseEntity;
import com.rent.baseinfo.entity.Canton;
import com.rent.baseinfo.entity.Dict;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

@Entity
@Table(name = "r_leaseroom", indexes = {@Index(columnList = "id")})
@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"})
@DynamicInsert
@DynamicUpdate
public class RLeaseroomEntity extends BaseEntity{
	private String address;
	private String time;
	private double acreage;
	private String title;
	private double pirce;
	private int chamber;
	private int hall;
	private int toilet;
	private String esthment;
	private String img;
	private String remark;
	private int state;
	private Collection<RChooseroomEntity> rChooseroomsById;
	private Collection<RImagetableEntity> rImagetablesById;
	private RUsersEntity rUsersByUid;
	private Dict bDictByHid;
	private Canton bCantonByAid;

	@Column(name = "address")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	
	@Column(name = "time")
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	
	@Column(name = "acreage")
	public double getAcreage() {
		return acreage;
	}

	public void setAcreage(double acreage) {
		this.acreage = acreage;
	}

	
	@Column(name = "title")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	
	@Column(name = "pirce")
	public double getPirce() {
		return pirce;
	}

	public void setPirce(double pirce) {
		this.pirce = pirce;
	}

	
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

	
	@Column(name = "esthment")
	public String getEsthment() {
		return esthment;
	}

	public void setEsthment(String esthment) {
		this.esthment = esthment;
	}

	
	@Column(name = "img")
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	
	@Column(name = "remark")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	
	@Column(name = "state")
	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	@OneToMany(mappedBy = "rLeaseroomByLid")
	public Collection<RChooseroomEntity> getrChooseroomsById() {
		return rChooseroomsById;
	}

	public void setrChooseroomsById(Collection<RChooseroomEntity> rChooseroomsById) {
		this.rChooseroomsById = rChooseroomsById;
	}

	@OneToMany(mappedBy = "rLeaseroomByHid")
	public Collection<RImagetableEntity> getrImagetablesById() {
		return rImagetablesById;
	}

	public void setrImagetablesById(Collection<RImagetableEntity> rImagetablesById) {
		this.rImagetablesById = rImagetablesById;
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
