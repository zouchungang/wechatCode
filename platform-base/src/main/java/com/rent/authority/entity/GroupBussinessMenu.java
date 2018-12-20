package com.rent.authority.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.rent.baseinfo.entity.BaseEntity;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 权限分组对应基础信息菜单
 */
@Entity
@Table(name = "au_b_authority_menu", indexes = {@Index(columnList = "id")})
@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"})
@DynamicInsert
@DynamicUpdate
public class GroupBussinessMenu extends BaseEntity {
    private AuthorityGroup authorityGroup;
    private BussinessMenu bussinessMenu;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "authorityGroupId", nullable = false)
    public AuthorityGroup getAuthorityGroup() {
        return authorityGroup;
    }

    public void setAuthorityGroup(AuthorityGroup authorityGroup) {
        this.authorityGroup = authorityGroup;
    }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "baseMenuId", nullable = false)
    public BussinessMenu getBussinessMenu() {
        return bussinessMenu;
    }

    public void setBussinessMenu(BussinessMenu bussinessMenu) {
        this.bussinessMenu = bussinessMenu;
    }
}
