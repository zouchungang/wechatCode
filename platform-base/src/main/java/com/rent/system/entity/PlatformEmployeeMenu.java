package com.rent.system.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.rent.baseinfo.entity.BaseEntity;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 平台员工权限信息表
 */
@Entity
@Table(name = "p_employee_menu", indexes = {@Index(columnList = "id")})
@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"})
@DynamicInsert
@DynamicUpdate
public class PlatformEmployeeMenu extends BaseEntity {
    private static final long serialVersionUID = 1L;
    private PlatformMenu platformMenu;// 菜单ID
    private PlatformEmployee platformEmployee;// 员工账号


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "menuId", nullable = false)
    public PlatformMenu getPlatformMenu() {
        return this.platformMenu;
    }

    public void setPlatformMenu(PlatformMenu platformMenu) {
        this.platformMenu = platformMenu;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "employeeId", nullable = false)
    public PlatformEmployee getPlatformEmployee() {
        return this.platformEmployee;
    }

    public void setPlatformEmployee(PlatformEmployee platformEmployee) {
        this.platformEmployee = platformEmployee;
    }

}