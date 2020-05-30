package com.sunseagear.wind.security.shiro.filter.authc;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @title: UsernamePasswordToken.java
 * @package com.sunseagear.wind.modules.sys.security.shiro.web.filter.authc
 * @description: 令牌类 * @date:   2017年6月26日 下午5:56:18
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public class Oauth2Token implements org.apache.shiro.authc.AuthenticationToken {

    // 密钥
    private String token;

    public Oauth2Token(String token) {
        this.token = token;
    }

    @Override
    public Object getPrincipal() {
        return token;
    }

    @Override
    public Object getCredentials() {
        return Boolean.TRUE;
    }

}
