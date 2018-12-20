package com.rent.report.company.service;

import java.util.List;
import java.util.Map;

public interface IReportService {
    /**
     * 统计操作日志中每个模块的请求数
     *
     * @return
     */
    public List<Object[]> modelCount();

    public List<Map> getMap();

    /**
     * 门票日销售
     *
     * @return
     */
    public Map<String, Object> loadDaySales(String supplierCode, String orderNo, String subTicketNo, String orderStatus, String orderDate, String orderDateEnd, String mobile, String idCard
            , int offset, int limit, String order);

    /**
     * 门票月销售
     *
     * @return
     */
    public Map<String, Object> loadMonthSales(String supplierCode, String orderNo, String subTicketNo, String orderStatus, String orderDate, String orderDateEnd, String mobile, String idCard
            , int offset, int limit, String order);

    /**
     * 门票年销售
     *
     * @return
     */
    public Map<String, Object> loadYearSales(String supplierCode, String orderNo, String subTicketNo, String orderStatus, String orderDate, String orderDateEnd, String mobile, String idCard
            , int offset, int limit, String order);
}
