package com.rent.baseinfo.service;

import com.rent.baseinfo.dao.PayModeDao;
import com.rent.baseinfo.entity.PayMode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PayModeService{
    @Autowired
    private PayModeDao paymodeDao;

    /**
     *
     * @return
     */
    public List<PayMode> findALL() {
        return paymodeDao.findAll();
    }

    /**
     *
     * @param payMode
     */
    public void create(PayMode payMode) {
        paymodeDao.save(payMode);
    }

    /**
     *
     * @param payMode
     */
    public void update(PayMode payMode) {
        paymodeDao.save(payMode);
    }

    /**
     *
     * @param id
     * @return
     */
    public PayMode findById(String id) {
        return paymodeDao.findById(id);
    }

    /**
     *
     * @param id
     */
    public void deleteById(String id) {
        paymodeDao.delete(id);
    }

    /**
     *
     * @param payMode
     * @param pageable
     * @return
     */
    public List<PayMode> find(PayMode payMode, Pageable pageable) {
        return paymodeDao.find(payMode, pageable);
    }

    /**
     *
     * @param payMode
     * @return
     */
    public long count(PayMode payMode) {
        return paymodeDao.count(payMode);
    }

    /**
     *
     * @param paymodecode
     * @return
     */
    public PayMode findBycode(String paymodecode) {
        return paymodeDao.findBycode(paymodecode);
    }

}
