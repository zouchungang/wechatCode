package com.rent.report.platform.action;

import com.rent.common.util.FileUtils;
import com.rent.report.platform.service.PlatformReportService;
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
@RequestMapping("platform/report")
public class PlatformReportAction {
    @Autowired
    private PlatformReportService platformReportService;

    @RequestMapping(value = "exportExcel")
    public ResponseEntity<byte[]> exportExcel(HttpServletRequest request) throws Exception {
        //File file = new File(platformReportService.exportExcel());
        byte[] body = FileUtils.downloadFile(platformReportService.exportExcel());
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attchement;filename=" + UUID.randomUUID().toString() + ".xlsx");
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        HttpStatus statusCode = HttpStatus.OK;
        ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(body, headers, statusCode);
        return entity;
    }
}
