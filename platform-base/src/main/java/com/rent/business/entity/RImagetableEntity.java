package com.rent.business.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.rent.baseinfo.entity.BaseEntity;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Entity
@Table(name = "r_imagetable", indexes = {@Index(columnList = "id")})
@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"})
@DynamicInsert
@DynamicUpdate
public class RImagetableEntity extends BaseEntity{
	private String image;
	private RLeaseroomEntity rLeaseroomByHid;

	
	@Column(name = "image")
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@ManyToOne
	@JoinColumn(name = "hid", referencedColumnName = "id", nullable = false)
	public RLeaseroomEntity getrLeaseroomByHid() {
		return rLeaseroomByHid;
	}

	public void setrLeaseroomByHid(RLeaseroomEntity rLeaseroomByHid) {
		this.rLeaseroomByHid = rLeaseroomByHid;
	}
}
