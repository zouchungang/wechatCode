package com.rent.system.service;

import com.rent.system.dao.PlatformSystemLogDao;
import com.rent.system.entity.PlatformSystemLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

@Service
public class PlatformSystemLogService {
    @Autowired
    private PlatformSystemLogDao platformSystemLogDao;

    @Transactional(readOnly = true)
    public List<PlatformSystemLog> findALL() {
        // TODO Auto-generated method stub
        return platformSystemLogDao.findAll();
    }

    public void create(PlatformSystemLog platformSystemLog) {
        // TODO Auto-generated method stub
        platformSystemLogDao.save(platformSystemLog);
    }

    public void update(PlatformSystemLog platformSystemLog) {
        // TODO Auto-generated method stub
        platformSystemLogDao.save(platformSystemLog);
    }

    @Transactional(readOnly = true)
    public PlatformSystemLog findById(String id) {
        // TODO Auto-generated method stub
        return platformSystemLogDao.findOne(id);
    }

    @Transactional
    public void deleteById(String id) {
        // TODO Auto-generated method stub
        platformSystemLogDao.deleteById(id);
    }

    public List<PlatformSystemLog> findAllPagerDesc(PageRequest pagerequest) {
        // TODO Auto-generated method stub
        return platformSystemLogDao.findAllPagerDesc(pagerequest);
    }
    public List<PlatformSystemLog> findAllPagerAsc(PageRequest pagerequest) {
        // TODO Auto-generated method stub
        return platformSystemLogDao.findAllPagerAsc(pagerequest);
    }

    @Transactional(readOnly = true)
    public Long count() {
        // TODO Auto-generated method stub
        return platformSystemLogDao.count();
    }

    @Transactional
    public void deleteAll() {
        platformSystemLogDao.deleteAllInBatch();
    }


    /**
     * 根据参数删除某时间段之前的数据
     * @param type 1：半年之前 2：三个月之前 3：一个月之前 4：全部
     */
    @Transactional
    public void deleteBeforeTime(Integer type){
        if(type==0){
            platformSystemLogDao.deleteAllInBatch();
        }else{
            platformSystemLogDao.deleteBeforeTime(getByBeforeMonth(type));
        }
    }

    /**
     * 返回当前时间n个月之前的时间点
     *
     * @param beforeMonth
     * @return   yyyy-MM-dd HH:mm:ss
     */
    private String getByBeforeMonth(int beforeMonth ){
        Calendar cal1 = Calendar.getInstance();
        cal1.add(Calendar.MONTH, -beforeMonth);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String monthBefore = sdf.format(cal1.getTime());
        return monthBefore;
    }

}
