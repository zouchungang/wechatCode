package com.rent.report.company.service.impl;

import com.rent.common.CommonDao;
import com.rent.report.company.dao.ReportDao;
import com.rent.report.company.service.IReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ReportServiceImpl implements IReportService {
    @Autowired
    private ReportDao reportDao;
    @Autowired
    private CommonDao commonDao;

    @Override
    public List<Object[]> modelCount() {
        // TODO Auto-generated method stub
        return reportDao.modelCount();
    }

    @Override
    public List<Map> getMap() {
        Map map = new HashMap();
        StringBuffer sql = new StringBuffer(
                "SELECT t.menuName as name,COUNT(t.id) c FROM p_system_log t GROUP BY t.menuName ORDER BY c");
        return commonDao.queryListEntity(sql.toString(), map, null);
    }

    /**
     * 门票日销售
     */
    @Override
    public Map<String, Object> loadDaySales(String supplierCode, String orderNo, String subTicketNo, String orderStatus, String orderDate, String orderDateEnd, String mobile, String idCard
            , int offset, int limit, String order) {
        //定义返回结果
        Map<String, Object> resmap = new HashMap<String, Object>();
        //定义sql参数
        Map<String, Object> map = new HashMap<String, Object>();
        String sql = "select s.ticketName,s.ticketNum,s.ticketPrice,s.subOrderNo,i.orderDate,i.contactName,i.contactMobile,i.contactIdCard,i.orderStatus,i.orderNo " +
                " FROM c_o_info AS i INNER JOIN (SELECT DISTINCT(orderId),ticketName,subOrderNo,ticketNum,ticketPrice FROM c_o_split) s ON s.orderId = i.id";
        StringBuffer where = new StringBuffer();
        //拼接供应商编码
        if (supplierCode != null && supplierCode.length() > 0) {
            //添加where条件
            where = where.append(" and i.companyCodes =:supplierCode and i.orderStatus in (2,3,4,6)");
            //把参数值放入map中
            map.put("supplierCode", supplierCode);
        }
        //拼接订单号
        if (orderNo != null && orderNo.length() > 0) {
            where = where.append(" and i.orderNo=:orderNo");
            map.put("orderNo", orderNo);
        }
        //拼接子订单号
        if (subTicketNo != null && subTicketNo.length() > 0) {
            where = where.append(" and s.subOrderNo =:subTicketNo");
            map.put("subTicketNo", subTicketNo);
        }
        //拼接订单状态
        if (orderStatus != null && orderStatus.length() > 0) {
            where = where.append(" and i.orderStatus=:orderStatus");
            map.put("orderStatus", orderStatus);
        }
        //拼接手机号码
        if (mobile != null && mobile.length() > 0) {
            where = where.append(" and i.contactMobile=:mobile");
            map.put("mobile", mobile);
        }
        //拼接身份证号
        if (idCard != null && idCard.length() > 0) {
            where = where.append(" and i.contactIdCard=:idCard");
            map.put("idCard", idCard);
        }
        //拼接订单时间
        if (orderDate != null && orderDate.length() > 0 && orderDateEnd != null && orderDateEnd.length() > 0) {
            where = where.append(" and i.orderDate >=:orderDate and DATE_FORMAT(i.orderDate,'%Y-%m-%d') <=:orderDateEnd");
            map.put("orderDate", orderDate);
            map.put("orderDateEnd", orderDateEnd);
        } else if (orderDateEnd != null && orderDateEnd.length() > 0) {
            where = where.append(" and DATE_FORMAT(i.orderDate,'%Y-%m-%d') =:orderDateEnd");
            map.put("orderDateEnd", orderDateEnd);
        } else if (orderDate != null && orderDate.length() > 0) {
            where = where.append(" and DATE_FORMAT(i.orderDate,'%Y-%m-%d') =:orderDate");
            map.put("orderDate", orderDate);
        }
        //排序
        if (order != null && order.length() > 0 && order.equals("desc")) {
            where = where.append(" ORDER BY i.orderNo,i.orderDate  desc");
        } else {
            where = where.append(" ORDER BY i.orderNo,i.orderDate  asc");
        }
        List list = commonDao.queryListEntity(sql + where, map, null);
        //分页
        int num = 0;
        List result = new ArrayList<>();
        for (int i = offset; i < list.size(); i++) {//进行数据分页 offset从第几条开始取数据，页面选择第几页
            num++;
            if (num > limit) {//limit当前页显示条数，大于当前条数就返回数据
                break;
            }
            result.add(list.get(i));
        }
        resmap.put("total", list.size());
        resmap.put("rows", result);
        return resmap;
    }

    /**
     * 门票月销售
     */
    @Override
    public Map<String, Object> loadMonthSales(String supplierCode, String orderNo, String subTicketNo, String orderStatus, String orderDate, String orderDateEnd, String mobile, String idCard
            , int offset, int limit, String order) {
        //定义返回结果
        Map<String, Object> resmap = new HashMap<String, Object>();
        //定义sql参数
        Map<String, Object> map = new HashMap<String, Object>();
        String sql = "select s.ticketName,s.ticketNum,s.ticketPrice,s.subOrderNo,i.orderDate,i.contactName,i.contactMobile,i.contactIdCard,i.orderStatus,i.orderNo " +
                " FROM c_o_info AS i INNER JOIN (SELECT DISTINCT(orderId),ticketName,subOrderNo,ticketNum,ticketPrice FROM c_o_split) s ON s.orderId = i.id";
        StringBuffer where = new StringBuffer();
        //拼接供应商编码
        if (supplierCode != null && supplierCode.length() > 0) {
            //添加where条件
            where = where.append(" and i.companyCodes =:supplierCode and i.orderStatus in (2,3,4,6)");
            //把参数值放入map中
            map.put("supplierCode", supplierCode);
        }
        //拼接订单号
        if (orderNo != null && orderNo.length() > 0) {
            where = where.append(" and i.orderNo=:orderNo");
            map.put("orderNo", orderNo);
        }
        //拼接子订单号
        if (subTicketNo != null && subTicketNo.length() > 0) {
            where = where.append(" and s.subOrderNo =:subTicketNo");
            map.put("subTicketNo", subTicketNo);
        }
        //拼接订单状态
        if (orderStatus != null && orderStatus.length() > 0) {
            where = where.append(" and i.orderStatus=:orderStatus");
            map.put("orderStatus", orderStatus);
        }
        //拼接手机号码
        if (mobile != null && mobile.length() > 0) {
            where = where.append(" and i.contactMobile=:mobile");
            map.put("mobile", mobile);
        }
        //拼接身份证号
        if (idCard != null && idCard.length() > 0) {
            where = where.append(" and i.contactIdCard=:idCard");
            map.put("idCard", idCard);
        }
        //拼接订单时间
        if (orderDate != null && orderDate.length() > 0 && orderDateEnd != null && orderDateEnd.length() > 0) {
            where = where.append(" and i.orderDate >=:orderDate and DATE_FORMAT(i.orderDate,'%Y-%m') <=:orderDateEnd");
            map.put("orderDate", orderDate);
            map.put("orderDateEnd", orderDateEnd);
        } else if (orderDateEnd != null && orderDateEnd.length() > 0) {
            where = where.append(" and DATE_FORMAT(i.orderDate,'%Y-%m') =:orderDateEnd");
            map.put("orderDateEnd", orderDateEnd);
        } else if (orderDate != null && orderDate.length() > 0) {
            where = where.append(" and DATE_FORMAT(i.orderDate,'%Y-%m') =:orderDate");
            map.put("orderDate", orderDate);
        }
        //排序
        if (order != null && order.length() > 0 && order.equals("desc")) {
            where = where.append(" ORDER BY i.orderNo,i.orderDate  desc");
        } else {
            where = where.append(" ORDER BY i.orderNo,i.orderDate  asc");
        }
        List list = commonDao.queryListEntity(sql + where, map, null);
        //分页
        int num = 0;
        List result = new ArrayList<>();
        for (int i = offset; i < list.size(); i++) {//进行数据分页 offset从第几条开始取数据，页面选择第几页
            num++;
            if (num > limit) {//limit当前页显示条数，大于当前条数就返回数据
                break;
            }
            result.add(list.get(i));
        }
        resmap.put("total", list.size());
        resmap.put("rows", result);
        return resmap;
    }

    /**
     * 门票年销售
     */
    @Override
    public Map<String, Object> loadYearSales(String supplierCode, String orderNo, String subTicketNo, String orderStatus, String orderDate, String orderDateEnd, String mobile, String idCard
            , int offset, int limit, String order) {
        //定义返回结果
        Map<String, Object> resmap = new HashMap<String, Object>();
        //定义sql参数
        Map<String, Object> map = new HashMap<String, Object>();
        String sql = "select s.ticketName,s.ticketNum,s.ticketPrice,s.subOrderNo,i.orderDate,i.contactName,i.contactMobile,i.contactIdCard,i.orderStatus,i.orderNo " +
                " FROM c_o_info AS i INNER JOIN (SELECT DISTINCT(orderId),ticketName,subOrderNo,ticketNum,ticketPrice FROM c_o_split) s ON s.orderId = i.id";
        StringBuffer where = new StringBuffer();
        //拼接供应商编码
        if (supplierCode != null && supplierCode.length() > 0) {
            //添加where条件
            where = where.append(" and i.companyCodes =:supplierCode and i.orderStatus in (2,3,4,6)");
            //把参数值放入map中
            map.put("supplierCode", supplierCode);
        }
        //拼接订单号
        if (orderNo != null && orderNo.length() > 0) {
            where = where.append(" and i.orderNo=:orderNo");
            map.put("orderNo", orderNo);
        }
        //拼接子订单号
        if (subTicketNo != null && subTicketNo.length() > 0) {
            where = where.append(" and s.subOrderNo =:subTicketNo");
            map.put("subTicketNo", subTicketNo);
        }
        //拼接订单状态
        if (orderStatus != null && orderStatus.length() > 0) {
            where = where.append(" and i.orderStatus=:orderStatus");
            map.put("orderStatus", orderStatus);
        }
        //拼接手机号码
        if (mobile != null && mobile.length() > 0) {
            where = where.append(" and i.contactMobile=:mobile");
            map.put("mobile", mobile);
        }
        //拼接身份证号
        if (idCard != null && idCard.length() > 0) {
            where = where.append(" and i.contactIdCard=:idCard");
            map.put("idCard", idCard);
        }
        //拼接订单时间
        if (orderDate != null && orderDate.length() > 0 && orderDateEnd != null && orderDateEnd.length() > 0) {
            where = where.append(" and i.orderDate >=:orderDate and DATE_FORMAT(i.orderDate,'%Y') <=:orderDateEnd");
            map.put("orderDate", orderDate);
            map.put("orderDateEnd", orderDateEnd);
        } else if (orderDateEnd != null && orderDateEnd.length() > 0) {
            where = where.append(" and DATE_FORMAT(i.orderDate,'%Y') =:orderDateEnd");
            map.put("orderDateEnd", orderDateEnd);
        } else if (orderDate != null && orderDate.length() > 0) {
            where = where.append(" and DATE_FORMAT(i.orderDate,'%Y') =:orderDate");
            map.put("orderDate", orderDate);
        }
        //排序
        if (order != null && order.length() > 0 && order.equals("desc")) {
            where = where.append(" ORDER BY i.orderNo,i.orderDate  desc");
        } else {
            where = where.append(" ORDER BY i.orderNo,i.orderDate  asc");
        }
        List list = commonDao.queryListEntity(sql + where, map, null);
        //分页
        int num = 0;
        List result = new ArrayList<>();
        for (int i = offset; i < list.size(); i++) {//进行数据分页 offset从第几条开始取数据，页面选择第几页
            num++;
            if (num > limit) {//limit当前页显示条数，大于当前条数就返回数据
                break;
            }
            result.add(list.get(i));
        }
        resmap.put("total", list.size());
        resmap.put("rows", result);
        return resmap;
    }
}
