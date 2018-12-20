package com.rent.report.platform.service;

import com.rent.common.CommonDao;
import com.rent.common.util.HxExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Service
public class PlatformReportService {
    @Autowired
    private CommonDao commonDao;

    public String exportExcel() throws Exception {
        String sql = "SELECT t.cantonCode AS cantonCode,t.cantonName as cantonName,t.shortCode AS shortCode,t.coordinates AS coordinates FROM b_canton t";
        List l = commonDao.queryListEntity(sql, new HashMap<>(), null);
        return HxExcelUtil.export(UUID.randomUUID().toString(), l);
    }
}
