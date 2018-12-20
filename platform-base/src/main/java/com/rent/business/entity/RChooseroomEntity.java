package com.rent.business.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.rent.baseinfo.entity.BaseEntity;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "r_chooseroom", indexes = {@Index(columnList = "id")})
@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"})
@DynamicInsert
@DynamicUpdate
public class RChooseroomEntity extends BaseEntity {
	private int lid;
	private String time;
	private RLeaseroomEntity rLeaseroomByLid;
	private RUsersEntity rUsersEntityByUid;

	@Column(name = "lid")
	public int getLid() {
		return lid;
	}

	public void setLid(int lid) {
		this.lid = lid;
	}

	@Column(name = "time")
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "aid", nullable = false)
	public RLeaseroomEntity getrLeaseroomByLid() {
		return rLeaseroomByLid;
	}

	public void setrLeaseroomByLid(RLeaseroomEntity rLeaseroomByLid) {
		this.rLeaseroomByLid = rLeaseroomByLid;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "uid", nullable = false)
	public RUsersEntity getRUsersEntityByUid() {
		return rUsersEntityByUid;
	}

	public void setRUsersEntityByUid(RUsersEntity rUsersEntityByUid) {
		this.rUsersEntityByUid = rUsersEntityByUid;
	}
}
