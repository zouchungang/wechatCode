package com.rent.system.dao;

import com.rent.system.entity.PlatformNotice;
import com.rent.system.vo.PlatformNoticeVo;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 公告管理DAO--动态查询
 *
 * @author lgl
 */
public interface PlatformNoticeDaoCustom {
    /**
     * 根据传入的条件，动态拼接查询
     *
     * @param platformNoticeVo
     * @return
     */
    public List<PlatformNotice> find(PlatformNoticeVo platformNoticeVo, Pageable pageable, String sort, String order);

    /**
     * 根据传入的条件，获取记录数
     *
     * @param platformNoticeVo
     * @return
     */
    public long count(PlatformNoticeVo platformNoticeVo);
}
