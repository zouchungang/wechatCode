/**
 * @Title ShiroAuthRealm.java
 * @date 2013-11-2 下午3:52:21
 * @Copyright: 2013
 */
package com.rent.common.shiro;

import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * shiro的验证授权
 *
 * @author wenbei
 * @version 1.0
 */
public class ShiroAuthRealm extends AuthorizingRealm {
    private static Logger logger = LoggerFactory.getLogger(ShiroAuthRealm.class);

    /**
     * 认证回调函数,登录时调用.
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        logger.debug("登录认证" + getName());
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(token.getUsername(), new String(token.getPassword()), getName());
        return info;
    }

    /**
     * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        logger.debug("开始授权查询");
        //String userId = (String) principals.getPrimaryPrincipal();
        //Map<String, Collection<String>> map = userService.selectRolesPowers(userId);
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        //info.addRoles(map.get("roleIds"));
        //info.addStringPermissions(map.get("powers"));
        return info;

    }


}
