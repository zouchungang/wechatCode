package com.rent.report.company.action;

import com.rent.common.BaseController;
import com.rent.common.CommonDao;
import com.rent.report.company.service.IReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("company/report")
public class ReportAction extends BaseController {
    @Autowired
    private IReportService reportService;
    @Autowired
    private CommonDao commonDao;

    @RequestMapping("index")
    public String index() {
        // List<Object[]> list = reportService.modelCount();
//        List<Map> listMap = reportService.getMap();
        return "report/company/index";
    }

    @RequestMapping("/dayindex")
    public String dayindex() {
        return "report/company/daycountsales";
    }

    @RequestMapping("/loadDaySales")
    @ResponseBody
    public Map<String, Object> loadDaySales(HttpServletRequest request, String orderNo, String subTicketNo, String orderStatus, String orderDate, String orderDateEnd, String mobile, String idCard
            , int offset, int limit, String order) {
        String supplierCode = (String) sessionManager.getSessionValue(request, "companycode");
        return reportService.loadDaySales(supplierCode, orderNo, subTicketNo, orderStatus, orderDate, orderDateEnd, mobile, idCard, offset, limit, order);
    }


    @RequestMapping("/monthindex")
    public String monthindex() {
        return "report/company/monthcountsales";
    }

    @RequestMapping("/loadMonthSales")
    @ResponseBody
    public Map<String, Object> loadMonthSales(HttpServletRequest request, String orderNo, String subTicketNo, String orderStatus, String orderDate, String orderDateEnd, String mobile, String idCard
            , int offset, int limit, String order) {
        String supplierCode = (String) sessionManager.getSessionValue(request, "companycode");
        return reportService.loadMonthSales(supplierCode, orderNo, subTicketNo, orderStatus, orderDate, orderDateEnd, mobile, idCard, offset, limit, order);
    }

    @RequestMapping("/yearindex")
    public String yearindex() {
        return "report/company/yearcountsales";
    }

    @RequestMapping("/loadYearSales")
    @ResponseBody
    public Map<String, Object> loadYearSales(HttpServletRequest request, String orderNo, String subTicketNo, String orderStatus, String orderDate, String orderDateEnd, String mobile, String idCard
            , int offset, int limit, String order) {
        String supplierCode = (String) sessionManager.getSessionValue(request, "companycode");
        return reportService.loadYearSales(supplierCode, orderNo, subTicketNo, orderStatus, orderDate, orderDateEnd, mobile, idCard, offset, limit, order);
    }

}
