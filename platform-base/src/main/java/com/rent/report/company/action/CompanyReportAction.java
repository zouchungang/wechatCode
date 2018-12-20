package com.rent.report.company.action;

import com.rent.common.SessionManager;
import com.rent.common.util.FileUtils;
import com.rent.report.company.service.CompanyReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.UUID;

@Controller
@RequestMapping("company/report")
public class CompanyReportAction {
    @Autowired
    private CompanyReportService companyReportService;
    @Autowired
    private SessionManager sessionManager;

    /**
     * 日销售查询报表转excel ,带参数
     *
     * @throws Exception
     */
    @RequestMapping(value = "dayTicketToExcel")
    public ResponseEntity<byte[]> dayTicketToExcel(HttpServletRequest request, String orderNo, String subTicketNo, String orderStatus, String orderDate, String orderDateEnd, String mobile, String idCard) throws Exception {
        //File file = new File(platformReportService.exportExcel());
        String supplierCode = (String) sessionManager.getSessionValue(request, "companycode");
        byte[] body = FileUtils.downloadFile(companyReportService.dayTicketToExcel(supplierCode, orderNo, subTicketNo, orderStatus, orderDate, orderDateEnd, mobile, idCard));
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attchement;filename=" + UUID.randomUUID().toString() + ".xlsx");
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        HttpStatus statusCode = HttpStatus.OK;
        ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(body, headers, statusCode);
        return entity;
    }

    /**
     * 月销售查询报表转excel ,带参数
     *
     * @throws Exception
     */
    @RequestMapping(value = "monthTicketToExcel")
    public ResponseEntity<byte[]> monthTicketToExcel(HttpServletRequest request, String orderNo, String subTicketNo, String orderStatus, String orderDate, String orderDateEnd, String mobile, String idCard) throws Exception {
        //File file = new File(platformReportService.exportExcel());
        String supplierCode = (String) sessionManager.getSessionValue(request, "companycode");
        byte[] body = FileUtils.downloadFile(companyReportService.monthTicketToExcel(supplierCode, orderNo, subTicketNo, orderStatus, orderDate, orderDateEnd, mobile, idCard));
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attchement;filename=" + UUID.randomUUID().toString() + ".xlsx");
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        HttpStatus statusCode = HttpStatus.OK;
        ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(body, headers, statusCode);
        return entity;
    }

    /**
     * 年销售查询报表转excel ,带参数
     *
     * @throws Exception
     */
    @RequestMapping(value = "yearTicketToExcel")
    public ResponseEntity<byte[]> yearTicketToExcel(HttpServletRequest request, String orderNo, String subTicketNo, String orderStatus, String orderDate, String orderDateEnd, String mobile, String idCard) throws Exception {
        //File file = new File(platformReportService.exportExcel());
        String supplierCode = (String) sessionManager.getSessionValue(request, "companycode");
        byte[] body = FileUtils.downloadFile(companyReportService.yearTicketToExcel(supplierCode, orderNo, subTicketNo, orderStatus, orderDate, orderDateEnd, mobile, idCard));
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attchement;filename=" + UUID.randomUUID().toString() + ".xlsx");
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        HttpStatus statusCode = HttpStatus.OK;
        ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(body, headers, statusCode);
        return entity;
    }
}
