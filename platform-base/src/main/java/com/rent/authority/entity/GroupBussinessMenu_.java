package com.rent.authority.entity;

import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

/**
 * 实体类副类
 * Created by sbd on 2016-11-23.
 */
@StaticMetamodel(GroupBussinessMenu.class)
public class GroupBussinessMenu_ {
    public static volatile SingularAttribute<GroupBussinessMenu, BussinessMenu> baseMenu;
    public static volatile SingularAttribute<GroupBussinessMenu, AuthorityGroup> authorityGroup;
}
