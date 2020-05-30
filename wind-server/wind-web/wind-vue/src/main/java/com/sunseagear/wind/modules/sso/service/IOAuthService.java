package com.sunseagear.wind.modules.sso.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sunseagear.common.utils.entity.Principal;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.sso.server.service
 * @title:
 * @description: 认证接口 * @date: 2018/3/29 9:30
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public interface IOAuthService {
    void addAuthCode(String authCode, Principal principal);// 添加 auth code

    void addAccessToken(String accessToken, Principal principal); // 添加 access token

    void addRefreshToken(String accessToken, Principal principal); // 添加 refresh token

    boolean checkAuthCode(String authCode); // 验证auth code是否有效

    boolean checkAccessToken(String accessToken); // 验证access token是否有效

    boolean checkRefreshToken(String refreshToken); // 验证refresh code是否有效

    void revokeToken(String accessToken); // 验证access token是否有效

    Principal getPrincipalByAuthCode(String authCode);// 根据auth code获取用户认证信息

    Principal getPrincipalByAccessToken(String accessToken);// 根据access token获取用户认证信息

    Principal getPrincipalByRefreshToken(String refreshToken);// 根据refresh Token获取用户认证信息

    Integer getExpireIn();//auth code / access token 过期时间

    boolean checkClientId(String clientId);// 检查客户端id是否存在

    boolean checkClientSecret(String clientSecret);// 坚持客户端安全KEY是否存在

    List<Principal> activePrincipal();// 获取在线用户

    Page<Principal> activePrincipal(Page page, HttpServletRequest request);
}
