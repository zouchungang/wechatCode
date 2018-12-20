package com.rent.common.shiro;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;

import java.io.Serializable;
import java.util.*;
import java.util.concurrent.TimeUnit;

/**
 * 此类主要是为了集群的时候session管理，redis管理集群session
 * <p>
 * 继承EnterpriseCacheSessionDAO，具有缓存功能，结合redis使用目前还不确定是否有session同步问题，以前继承了AbstractSessionDAO经常出现连接超时问题。
 *
 * @Author lgl
 * @Date 2017/03/01/
 * @Description session redis实现
 */
public class RedisCacheSessionDao extends EnterpriseCacheSessionDAO {

    private transient static Logger log = LoggerFactory.getLogger(RedisCacheSessionDao.class);
    private String sessionIdPrefix;//定义session在redis中的前缀名称
    private String sessionIdPrefix_keys;//定义session在redis中的KEY名称
    private long timeout;//默认超时时间，单位为毫秒。初始化为604800000毫秒（7天）
    @Autowired
    private transient RedisTemplate<Serializable, Session> redisTemplate;

    public RedisCacheSessionDao() {
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
