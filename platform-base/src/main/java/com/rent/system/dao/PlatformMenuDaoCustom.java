package com.rent.system.dao;

import com.rent.system.entity.PlatformMenu;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 系统管理--动态条件查询
 *
 * @author lgl
 */
public interface PlatformMenuDaoCustom {
    /**
     * 动态条件查询
     *
     * @param menu
     * @param pageable
     * @return
     */
    public List<PlatformMenu> find(PlatformMenu menu, Pageable pageable, String sort, String order);

    /**
     * 动态条件合计总数
     *
     * @param menu
     * @return
     */
    public long count(PlatformMenu menu);


}
