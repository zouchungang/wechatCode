package com.rent.report.company.dao;

import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
public class ReportDao {
    @PersistenceContext
    private EntityManager em;

    /**
     * 统计操作日志中每个模块的请求数
     *
     * @return
     */
    public List<Object[]> modelCount() {
        // TODO Auto-generated method stub
        StringBuffer sql = new StringBuffer(
                "select t.operationname, count(t.operationlogid) from PBMOPERATIONLOG t group by t.operationname");
        Query query = em.createNativeQuery(sql.toString());
        List<Object[]> list = query.getResultList();
        return list;
    }
}
