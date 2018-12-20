package com.rent.common.shiro;

import com.rent.common.util.StrUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.ValidatingSession;
import org.apache.shiro.session.mgt.eis.AbstractSessionDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.Serializable;
import java.util.*;
import java.util.concurrent.TimeUnit;

/**
 * 此类主要是为了集群的时候session管理，redis管理集群session
 * <p>
 *
 * @Author lgl
 * @Date 2017/03/01/
 * @Description session redis实现
 */
public class RedisSessionDao extends AbstractSessionDAO {

    private transient static Logger log = LoggerFactory.getLogger(RedisSessionDao.class);
    private String sessionIdPrefix;//定义session在redis中的前缀名称
    private String sessionIdPrefix_keys;//定义session在redis中的KEY名称
    private long timeout;//默认超时时间，单位为毫秒。初始化为604800000毫秒（7天）
    @Autowired
    private transient RedisTemplate<Serializable, Session> redisTemplate;

    public RedisSessionDao() {
        sessionIdPrefix = "shiro-session-";
        sessionIdPrefix_keys = "shiro-session-*";
        timeout = 604800000;
    }

    @Override
    protected Serializable doCreate(Session session) {
        Serializable sessionId = sessionIdPrefix + UUID.randomUUID().toString();
        assignSessionId(session, sessionId);
        redisTemplate.opsForValue().set(sessionId, session, timeout, TimeUnit.MILLISECONDS);
        log.debug("create shiro session ,sessionId is :{}", sessionId.toString());
        return sessionId;
    }

    @Override
    protected Session doReadSession(Serializable sessionId) {
        log.debug("read shiro session ,sessionId is :{}", sessionId.toString());
        return redisTemplate.opsForValue().get(sessionId);
    }

    @Override
    public void update(Session session) throws UnknownSessionException {
        log.debug("update shiro session ,sessionId is :{}", session.getId().toString());
        if (session instanceof ValidatingSession && !((ValidatingSession) session).isValid()) {
            return; //如果会话过期/停止 没必要再更新了
        }
//        RequestAttributes ra = RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String uri = request.getServletPath();
        // 如果是静态文件，则不更新SESSION
        if (StrUtils.isStaticFile(uri)) {
            return;
        }
        redisTemplate.opsForValue().set(session.getId(), session, timeout, TimeUnit.MILLISECONDS);
    }

    @Override
    public void delete(Session session) {
        log.debug("delete shiro session ,sessionId is :{}", session.getId().toString());
        redisTemplate.opsForValue().getOperations().delete(session.getId());
    }

    @Override
    public Collection<Session> getActiveSessions() {
        Set<Serializable> keys = redisTemplate.keys(sessionIdPrefix_keys);
        if (keys.size() == 0) {
            return Collections.emptySet();
        }
        List<Session> sessions = redisTemplate.opsForValue().multiGet(keys);
        return Collections.unmodifiableCollection(sessions);
    }

    public String getSessionIdPrefix() {
        return sessionIdPrefix;
    }

    public void setSessionIdPrefix(String sessionIdPrefix) {
        this.sessionIdPrefix = sessionIdPrefix;
    }

    public String getSessionIdPrefix_keys() {
        return sessionIdPrefix_keys;
    }

    public void setSessionIdPrefix_keys(String sessionIdPrefix_keys) {
        this.sessionIdPrefix_keys = sessionIdPrefix_keys;
    }

    public long getTimeout() {
        return timeout;
    }

    public void setTimeout(long timeout) {
        this.timeout = timeout;
    }
}
