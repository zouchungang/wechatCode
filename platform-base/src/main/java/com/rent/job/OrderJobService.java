package com.rent.job;

import com.xxl.job.core.biz.model.ReturnT;
import com.xxl.job.core.handler.IJobHandler;
import com.xxl.job.core.handler.annotation.JobHander;
import com.xxl.job.core.log.XxlJobLogger;
import org.springframework.stereotype.Component;

@JobHander(value = "orderJobService")
@Component
public class OrderJobService extends IJobHandler {
    @Override
    public ReturnT<String> execute(String... strings) throws Exception {
        XxlJobLogger.log("执行成功");
        return ReturnT.SUCCESS;
    }
}
