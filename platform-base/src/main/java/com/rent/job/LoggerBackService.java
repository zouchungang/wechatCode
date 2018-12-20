package com.rent.job;

import com.xxl.job.core.biz.model.ReturnT;
import com.xxl.job.core.handler.IJobHandler;
import com.xxl.job.core.handler.annotation.JobHander;
import com.xxl.job.core.log.XxlJobLogger;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@JobHander(value = "loggerBackService")
@Component
public class LoggerBackService extends IJobHandler {
    @Override
    public ReturnT<String> execute(String... strings) throws Exception {
        XxlJobLogger.log("执行成功");
        return ReturnT.SUCCESS;

    }
}
