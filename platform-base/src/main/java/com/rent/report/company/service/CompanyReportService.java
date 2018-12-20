package com.rent.report.company.service;

import com.rent.common.CommonDao;
import com.rent.common.util.HxExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class CompanyReportService {
    @Autowired
    private CommonDao commonDao;

    /**
     * 日销售查询报表转excel ,带参数
     *
     * @throws Exception
     */
    public String dayTicketToExcel(String supplierCode, String orderNo, String subTicketNo, String orderStatus, String orderDate, String orderDateEnd, String mobile, String idCard) throws Exception {
        String sql = "select s.ticketName,s.ticketNum,s.ticketPrice,s.subOrderNo,i.orderDate,i.contactName,i.contactMobile,i.contactIdCard,i.orderStatus,i.orderNo " +
                " FROM c_o_info AS i INNER JOIN (SELECT DISTINCT(orderId),ticketName,subOrderNo,ticketNum,ticketPrice FROM c_o_split) s ON s.orderId = i.id";
        StringBuffer where = new StringBuffer();
        Map<String, Object> map = new HashMap<String, Object>();
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
            where = where.append(" and s.subOrderNo =:sunOrderNo");
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
        List l = commonDao.queryListEntity(sql + where, map, null);
        for (int i = 0; i < l.size(); i++) {
            Map changeMap = (Map) l.get(i);
            if (changeMap.get("orderStatus").equals(2)) {
                changeMap.put("orderStatus", "已付款");
            } else if (changeMap.get("orderStatus").equals(3)) {
                changeMap.put("orderStatus", "已出票");
            } else if (changeMap.get("orderStatus").equals(4)) {
                changeMap.put("orderStatus", "交易完成");
            } else if (changeMap.get("orderStatus").equals(6)) {
                changeMap.put("orderStatus", "已结算");
            }
        }
        if (l.size() == 0) {
            Map<String, Object> msgMap = new HashMap<String, Object>();
            msgMap.put("msg", "暂无信息");
            l.add(msgMap);
        }
        return HxExcelUtil.export(UUID.randomUUID().toString(), l);
    }

    /**
     * 月销售查询报表转excel ,带参数
     *
     * @throws Exception
     */
    public String monthTicketToExcel(String supplierCode, String orderNo, String subTicketNo, String orderStatus, String orderDate, String orderDateEnd, String mobile, String idCard) throws Exception {
        String sql = "select s.ticketName,s.ticketNum,s.ticketPrice,s.subOrderNo,i.orderDate,i.contactName,i.contactMobile,i.contactIdCard,i.orderStatus,i.orderNo " +
                " FROM c_o_info AS i INNER JOIN (SELECT DISTINCT(orderId),ticketName,subOrderNo,ticketNum,ticketPrice FROM c_o_split) s ON s.orderId = i.id";
        StringBuffer where = new StringBuffer();
        Map<String, Object> map = new HashMap<String, Object>();
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
            where = where.append(" and s.subOrderNo =:sunOrderNo");
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
        List l = commonDao.queryListEntity(sql + where, map, null);
        for (int i = 0; i < l.size(); i++) {
            Map changeMap = (Map) l.get(i);
            if (changeMap.get("orderStatus").equals(2)) {
                changeMap.put("orderStatus", "已付款");
            } else if (changeMap.get("orderStatus").equals(3)) {
                changeMap.put("orderStatus", "已出票");
            } else if (changeMap.get("orderStatus").equals(4)) {
                changeMap.put("orderStatus", "交易完成");
            } else if (changeMap.get("orderStatus").equals(6)) {
                changeMap.put("orderStatus", "已结算");
            }
        }
        if (l.size() == 0) {
            Map<String, Object> msgMap = new HashMap<String, Object>();
            msgMap.put("msg", "暂无信息");
            l.add(msgMap);
        }
        return HxExcelUtil.export(UUID.randomUUID().toString(), l);
    }

    /**
     * 年销售查询报表转excel ,带参数
     *
     * @throws Exception
     */
    public String yearTicketToExcel(String supplierCode, String orderNo, String subTicketNo, String orderStatus, String orderDate, String orderDateEnd, String mobile, String idCard) throws Exception {
        String sql = "select s.ticketName,s.ticketNum,s.ticketPrice,s.subOrderNo,i.orderDate,i.contactName,i.contactMobile,i.contactIdCard,i.orderStatus,i.orderNo " +
                " FROM c_o_info AS i INNER JOIN (SELECT DISTINCT(orderId),ticketName,subOrderNo,ticketNum,ticketPrice FROM c_o_split) s ON s.orderId = i.id";
        StringBuffer where = new StringBuffer();
        Map<String, Object> map = new HashMap<String, Object>();
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
            where = where.append(" and s.subOrderNo =:sunOrderNo");
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
        List l = commonDao.queryListEntity(sql + where, map, null);
        for (int i = 0; i < l.size(); i++) {
            Map changeMap = (Map) l.get(i);
            if (changeMap.get("orderStatus").equals(2)) {
                changeMap.put("orderStatus", "已付款");
            } else if (changeMap.get("orderStatus").equals(3)) {
                changeMap.put("orderStatus", "已出票");
            } else if (changeMap.get("orderStatus").equals(4)) {
                changeMap.put("orderStatus", "交易完成");
            } else if (changeMap.get("orderStatus").equals(6)) {
                changeMap.put("orderStatus", "已结算");
            }
        }
        if (l.size() == 0) {
            Map<String, Object> msgMap = new HashMap<String, Object>();
            msgMap.put("msg", "暂无信息");
            l.add(msgMap);
        }
        return HxExcelUtil.export(UUID.randomUUID().toString(), l);
    }
}
