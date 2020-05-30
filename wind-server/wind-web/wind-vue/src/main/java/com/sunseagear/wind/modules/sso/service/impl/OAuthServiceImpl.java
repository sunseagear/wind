package com.sunseagear.wind.modules.sso.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.common.utils.entity.Principal;
import com.sunseagear.wind.config.autoconfigure.ShiroConfigProperties;
import com.sunseagear.wind.modules.sso.service.IOAuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.sso.server.service.impl
 * @title:
 * @description: 单点登录 * @date: 2018/3/29 9:30
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
@Service("oAuthService")
public class OAuthServiceImpl implements IOAuthService {


    //@Autowired
    //private AppFeign appFeign;

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private ShiroConfigProperties shiroConfigProperties;

    private final String ACCESS_TOKEN_KEY = "ACCESS_TOKEN_KEY";
    private final String AUTH_CODE_PRE = "AUTH_CODE_PRE_";
    private final String ACCESS_TOKEN_PRE = "ACCESS_TOKEN_PRE_";
    private final String REFRESH_TOKEN_PRE = "REFRESH_TOKEN_PRE";

    @Override
    public void addAuthCode(String authCode, Principal principal) {
        redisTemplate.opsForValue().set(AUTH_CODE_PRE + authCode, principal, shiroConfigProperties.getCodeExpiresIn(), TimeUnit.SECONDS);
    }

    @Override
    public void addAccessToken(String accessToken, Principal principal) {
        redisTemplate.opsForValue().set(ACCESS_TOKEN_PRE + accessToken, principal, getExpireIn(), TimeUnit.SECONDS);
        redisTemplate.opsForSet().add(ACCESS_TOKEN_KEY, accessToken);
        redisTemplate.expire(ACCESS_TOKEN_KEY, getExpireIn(), TimeUnit.SECONDS);//设置过期时间

    }

    @Override
    public void addRefreshToken(String refreshToken, Principal principal) {
        redisTemplate.opsForValue().set(REFRESH_TOKEN_PRE + refreshToken, principal, shiroConfigProperties.getRefreshTokenExpiresIn(), TimeUnit.SECONDS);
    }

    @Override
    public Principal getPrincipalByAuthCode(String authCode) {
        return (Principal) redisTemplate.opsForValue().get(AUTH_CODE_PRE + authCode);
    }

    @Override
    public Principal getPrincipalByAccessToken(String accessToken) {
        return (Principal) redisTemplate.opsForValue().get(ACCESS_TOKEN_PRE + accessToken);
    }

    @Override
    public Principal getPrincipalByRefreshToken(String refreshToken) {
        return (Principal) redisTemplate.opsForValue().get(REFRESH_TOKEN_PRE + refreshToken);
    }

    @Override
    public boolean checkAuthCode(String authCode) {
        try {
            return redisTemplate.opsForValue().get(AUTH_CODE_PRE + authCode) != null;
        } catch (Exception e) {
            return Boolean.FALSE;
        }
    }

    @Override
    public boolean checkAccessToken(String accessToken) {
        try {
            return redisTemplate.opsForValue().get(ACCESS_TOKEN_PRE + accessToken) != null;
        } catch (Exception e) {
            return Boolean.FALSE;
        }
    }

    @Override
    public boolean checkRefreshToken(String refreshToken) {
        try {
            return redisTemplate.opsForValue().get(REFRESH_TOKEN_PRE + refreshToken) != null;
        } catch (Exception e) {
            return Boolean.FALSE;
        }
    }

    @Override
    public void revokeToken(String accessToken) {
        redisTemplate.delete(ACCESS_TOKEN_PRE + accessToken);
        redisTemplate.opsForSet().add(ACCESS_TOKEN_KEY, accessToken);
    }

    @Override
    public boolean checkClientId(String clientId) {
        //return   appFeign.checkClientId(clientId);
        return Boolean.TRUE;
    }

    @Override
    public boolean checkClientSecret(String clientSecret) {
        //return appFeign.checkClientSecret(clientSecret);
        return Boolean.TRUE;
    }

    @Override
    public Integer getExpireIn() {
        return shiroConfigProperties.getAccesTokenExpiresIn();
    }

    @Override
    public List<Principal> activePrincipal() {
        List<Principal> principalList = new ArrayList<>();
        Set<String> accessTokenList = redisTemplate.opsForSet().members(ACCESS_TOKEN_KEY);
        for (String accessToken : accessTokenList) {
            Principal principal = getPrincipalByAccessToken(accessToken);
            if (principal != null) {
                principalList.add(principal);
            }
        }
        return principalList;
    }

    @Override
    public Page<Principal> activePrincipal(Page page, HttpServletRequest request) {
        List<Principal> activePrincipalList = activePrincipal();
        int currentRow = (int) ((page.getCurrent() - 1) * page.getSize());
        List<Principal> dataList = new ArrayList<>();
        String username = request.getParameter("username");
        String loginIp = request.getParameter("loginIp");


        for (int i = currentRow; i < currentRow + page.getSize() && i < activePrincipalList.size(); i++) {
            if (!StringUtils.isEmpty(username)) {
                if (!activePrincipalList.get(i).getUsername().contains(username)){
                    continue;
                }
            }
            if (!StringUtils.isEmpty(loginIp)) {
                if (!activePrincipalList.get(i).getLoginIp().equals(loginIp)){
                    continue;
                }
            }
            dataList.add(activePrincipalList.get(i));
        }
        page.setRecords(dataList);
        page.setTotal(activePrincipalList.size());
        return page;
    }
}
