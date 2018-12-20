package com.rent.system.service;

import com.rent.common.util.DateUtils;
import com.rent.system.dao.PlatformNoticeDao;
import com.rent.system.entity.PlatformNotice;
import com.rent.system.vo.PlatformNoticeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PlatformNoticeService {
    @Autowired
    private PlatformNoticeDao platformNoticeDao;

    /**
     * @return
     */
    public List<PlatformNotice> findALL() {
        return platformNoticeDao.findAll();
    }

    /**
     * @param platformNotice
     */
    public void create(PlatformNotice platformNotice) {
        platformNoticeDao.save(platformNotice);
    }

    /**
     * @param platformNotice
     */
    public void update(PlatformNotice platformNotice) {
        platformNoticeDao.save(platformNotice);
    }

    /**
     * @param id
     * @return
     */
    public PlatformNotice findById(String id) {
        return platformNoticeDao.findOne(id);
    }

    /**
     * @param id
     */
    @Transactional
    public void deleteById(String id) {
        platformNoticeDao.deleteById(id);
    }

    /**
     * @param platformNoticeVo
     * @param pageable
     * @param sort
     * @param order
     * @return
     */
    public List<PlatformNotice> find(PlatformNoticeVo platformNoticeVo, Pageable pageable, String sort, String order) {
        return platformNoticeDao.find(platformNoticeVo, pageable, sort, order);
    }

    /**
     * @param platformNoticeVo
     * @return
     */
    public long count(PlatformNoticeVo platformNoticeVo) {
        return platformNoticeDao.count(platformNoticeVo);
    }

    /**
     * @return
     */
    public List<PlatformNotice> findActiveList() {
        return platformNoticeDao.findActiveList(DateUtils.getSystime());
    }

    /**
     * 获取没有过期的通知数量
     *
     * @return
     */
    public Integer getActiveCount() {
        return platformNoticeDao.getActiveCount(DateUtils.getSystime());
    }
}
