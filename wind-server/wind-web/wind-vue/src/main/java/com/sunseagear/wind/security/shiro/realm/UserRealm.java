package com.sunseagear.wind.security.shiro.realm;

import com.sunseagear.common.datarule.handler.DataRuleHandler;
import com.sunseagear.common.utils.entity.Principal;
import com.sunseagear.wind.modules.sys.entity.User;
import com.sunseagear.wind.modules.sys.service.IUserService;
import com.sunseagear.wind.security.shiro.filter.authc.UsernamePasswordToken;
import com.sunseagear.wind.utils.UserUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * http://blog.csdn.net/babys/article/details/50151407
 */
public class UserRealm extends AuthorizingRealm {

    @Autowired
    private IUserService userService;

    @Autowired
    private DataRuleHandler dataRuleHandler;

    /**
     * 不返回授权信息
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        authorizationInfo.setRoles(UserUtils.getRoleStringList());
        authorizationInfo.setStringPermissions(UserUtils.getPermissionsList());
        return authorizationInfo;
    }

    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof UsernamePasswordToken;
    }

    /**
     * 认证的回调方法
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        UsernamePasswordToken authcToken = (UsernamePasswordToken) token;
        String username = authcToken.getUsername();
        User user = userService.findByUsername(username);
        if (user == null) {
            user = userService.findByEmail(username);
            if (user == null) {
                user = userService.findByPhone(username);
            }
        }
        if (user == null) {
            throw new UnknownAccountException();// 没找到帐号
        }

        if (User.STATUS_LOCKED.equals(user.getStatus())) {
            throw new LockedAccountException(); // 帐号锁定
        }
        // 交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配，如果觉得人家的不好可以自定义实现
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                new Principal(user.getId(), user.getUsername(), user.getRealname(), user.getTenantId(), user.getRoleIds()), // 用户名
                user.getPassword(), // 密码
                ByteSource.Util.bytes(user.getCredentialsSalt()), // salt=username+salt
                getName() // realm name
        );

        //将用户信息缓存到数据权限模块
        dataRuleHandler.refreshUser(user.getId());

        return authenticationInfo;
    }

    @Override
    public void clearCachedAuthorizationInfo(PrincipalCollection principals) {
        super.clearCachedAuthorizationInfo(principals);
    }

    @Override
    public void clearCachedAuthenticationInfo(PrincipalCollection principals) {
        super.clearCachedAuthenticationInfo(principals);
    }

    @Override
    public void clearCache(PrincipalCollection principals) {
        super.clearCache(principals);
    }

    public void clearAllCachedAuthorizationInfo() {
        getAuthorizationCache().clear();
    }

    public void clearAllCachedAuthenticationInfo() {
        getAuthenticationCache().clear();
    }

    public void clearAllCache() {
        clearAllCachedAuthenticationInfo();
        clearAllCachedAuthorizationInfo();
    }

}
