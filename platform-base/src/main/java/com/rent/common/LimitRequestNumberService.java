package com.rent.common;

import com.rent.common.util.HxIpUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.concurrent.TimeUnit;

@Component
public class LimitRequestNumberService {
    private static final Logger logger = LoggerFactory.getLogger(LimitRequestNumberService.class);
    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    /**
     * @param request
     * @param time    限制时间段，毫秒
     * @param number  限制次数
     * @return 如果超过了限制就返回true
     */
    public Boolean limitRequest(HttpServletRequest request, long time, Integer number) {
        Boolean b = false;
        String ip = HxIpUtil.getIpAddr(request);
        String url = request.getRequestURL().toString();
        String key = "req_limit_".concat(url).concat(ip);
        long count = redisTemplate.opsForValue().increment(key, 1);
        if (count == 1) {
            redisTemplate.expire(key, time, TimeUnit.MILLISECONDS);
        }
        if (count > number) {
            logger.info("用户IP[" + ip + "]访问地址[" + url + "]超过了限定的次数[" + number + "]");
            b = true;
        }
        return b;
    }
}
