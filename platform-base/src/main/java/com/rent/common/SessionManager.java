package com.rent.common;

import org.springframework.stereotype.Component;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;

/**
 * 此类主要是设置和获取session
 *
 * @author lgl
 */
@Component
public class SessionManager {

    /**
     * 设置session值
     *
     * @param request
     * @return
     */
    public void setSessionValue(HttpServletRequest request, String sessionKey,
                                Object sessionValue) {
        WebUtils.setSessionAttribute(request, sessionKey, null);// 先移除key为sessionKey的session值
        WebUtils.setSessionAttribute(request, sessionKey, sessionValue);
    }

    /**
     * 移除session值
     *
     * @param request
     */
    public void removeSessionValue(HttpServletRequest request, String sessionKey) {
        WebUtils.setSessionAttribute(request, sessionKey, null);
    }

    /**
     * 获取session值
     *
     * @param request
     * @return
     */

    public Object getSessionValue(HttpServletRequest request, String sessionKey) {
        return WebUtils.getSessionAttribute(request, sessionKey);
    }

}
