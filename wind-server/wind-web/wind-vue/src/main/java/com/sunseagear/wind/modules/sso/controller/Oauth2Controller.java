package com.sunseagear.wind.modules.sso.controller;

import com.sunseagear.common.utils.IpUtils;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.common.utils.entity.Principal;
import com.sunseagear.wind.common.response.ResponseError;
import com.sunseagear.wind.config.autoconfigure.ShiroConfigProperties;
import com.sunseagear.wind.modules.sso.service.IOAuthService;
import com.sunseagear.wind.security.shiro.filter.authc.UsernamePasswordToken;
import com.sunseagear.wind.utils.JWTHelper;
import com.sunseagear.wind.utils.LoginLogUtils;
import com.sunseagear.wind.utils.ResponseUtils;
import com.sunseagear.wind.utils.UserUtils;
import org.apache.oltu.oauth2.as.issuer.MD5Generator;
import org.apache.oltu.oauth2.as.issuer.OAuthIssuer;
import org.apache.oltu.oauth2.as.issuer.OAuthIssuerImpl;
import org.apache.oltu.oauth2.as.request.OAuthAuthzRequest;
import org.apache.oltu.oauth2.as.request.OAuthTokenRequest;
import org.apache.oltu.oauth2.as.response.OAuthASResponse;
import org.apache.oltu.oauth2.common.OAuth;
import org.apache.oltu.oauth2.common.exception.OAuthProblemException;
import org.apache.oltu.oauth2.common.exception.OAuthSystemException;
import org.apache.oltu.oauth2.common.message.OAuthResponse;
import org.apache.oltu.oauth2.common.message.types.GrantType;
import org.apache.oltu.oauth2.common.message.types.ResponseType;
import org.apache.oltu.oauth2.common.utils.OAuthUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.api.web.controller
 * @title:
 * @description: Oauth2.0认证开发 * @date: 2018/1/8 15:56
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
@Controller
@RequestMapping("/sso/oauth2")
public class Oauth2Controller {

    @Autowired
    private IOAuthService oAuthService;

    @Autowired
    private ShiroConfigProperties shiroConfigProperties;

    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * 请求授权
     *
     * @param model
     * @param request
     * @return
     * @throws URISyntaxException
     * @throws OAuthSystemException
     */
    @RequestMapping("/authorize")
    public Object authorize(HttpServletRequest request) throws URISyntaxException, OAuthSystemException {
        try {
            //构建OAuth 授权请求
            OAuthAuthzRequest oauthRequest = new OAuthAuthzRequest(request);

            //检查传入的客户端id是否正确
            if (!oAuthService.checkClientId(oauthRequest.getClientId())) {
                return ResponseUtils.getErrResponse(HttpServletResponse.SC_BAD_REQUEST, ResponseError.INVALID_CLIENT);
            }
            Subject subject = SecurityUtils.getSubject();
            //如果用户没有登录，跳转到登陆页面
            if (!subject.isAuthenticated()) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                if (request.getMethod().equalsIgnoreCase("get") || !login(subject, username, password, "", request)) {//登录失败时跳转到登陆页面
                    // 强制登陆跳转,这里可能需要优化
                    String url = "redirect:" + shiroConfigProperties.getLoginUrl() + "?client_id=" + oauthRequest.getClientId() + "&response_type=" + oauthRequest.getResponseType() + "&redirect_uri=" + oauthRequest.getRedirectURI();
                    return new ModelAndView(url);
                }
            }

            // 判断是否已登录，如果已登录，则回跳
            Principal principal = UserUtils.getPrincipal(); // 如果已经登录，则跳转到管理首页
            //生成授权码
            String authorizationCode = null;
            //responseType目前仅支持CODE，另外还有TOKEN
            String responseType = oauthRequest.getParam(OAuth.OAUTH_RESPONSE_TYPE);
            if (responseType.equals(ResponseType.CODE
                    .toString())) {
                OAuthIssuerImpl oauthIssuerImpl = new OAuthIssuerImpl(new MD5Generator());
                authorizationCode = oauthIssuerImpl.authorizationCode();
                oAuthService.addAuthCode(authorizationCode, principal);
            }

            //进行OAuth响应构建
            OAuthASResponse.OAuthAuthorizationResponseBuilder builder =
                    OAuthASResponse.authorizationResponse(request, HttpServletResponse.SC_FOUND);
            //设置授权码
            builder.setCode(authorizationCode);
            String loginSource = request.getParameter("login_source");
            if (!StringUtils.isEmpty(loginSource) && loginSource.equals("client")) {
                //得到到客户端重定向地址
                String redirectURI = oauthRequest.getParam(OAuth.OAUTH_REDIRECT_URI);
                //构建响应
                final OAuthResponse response = builder.location(redirectURI).buildJSONMessage();
                return new ResponseEntity(response.getBody(), HttpStatus.valueOf(HttpServletResponse.SC_OK));
            } else {
                //得到到客户端重定向地址
                String redirectURI = oauthRequest.getParam(OAuth.OAUTH_REDIRECT_URI);
                //构建响应
                final OAuthResponse response = builder.location(redirectURI).buildQueryMessage();

                //根据OAuthResponse返回ResponseEntity响应
                HttpHeaders headers = new HttpHeaders();
                headers.setLocation(new URI(response.getLocationUri()));
                return new ResponseEntity(headers, HttpStatus.valueOf(response.getResponseStatus()));
            }
        } catch (OAuthProblemException e) {
            //出错处理
            String redirectUri = e.getRedirectUri();
            String loginSource = request.getParameter("login_source");
            if (!StringUtils.isEmpty(loginSource) && loginSource.equals("client")) {
                if (OAuthUtils.isEmpty(redirectUri)) {
                    //告诉客户端没有传入redirectUri直接报错
                    return ResponseUtils.getErrResponse(HttpStatus.NOT_FOUND.value(), ResponseError.NOT_FOUND_REDIRECT_URI);
                }

                //返回错误消息（如?error=）
                final OAuthResponse response =
                        OAuthASResponse.errorResponse(HttpServletResponse.SC_FOUND)
                                .error(e).location(redirectUri).buildJSONMessage();
                return new ResponseEntity(response.getBody(), HttpStatus.valueOf(response.getResponseStatus()));
            } else {
                //返回错误消息（如?error=）
                final OAuthResponse response =
                        OAuthASResponse.errorResponse(HttpServletResponse.SC_FOUND)
                                .error(e).location(redirectUri).buildQueryMessage();
                HttpHeaders headers = new HttpHeaders();
                headers.setLocation(new URI(response.getLocationUri()));
                return new ResponseEntity(headers, HttpStatus.valueOf(response.getResponseStatus()));
            }
        }
    }

    /**
     * 登陆方法
     *
     * @param subject
     * @param request
     * @return
     */
    private boolean login(Subject subject, String username, String password, String captcha, HttpServletRequest request) {
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            return false;
        }
        boolean rememberMe = true;
        String host = IpUtils.getIpAddr((HttpServletRequest) request);
        UsernamePasswordToken token = new UsernamePasswordToken(username, password.toCharArray(), rememberMe, host, captcha);
        try {
            subject.login(token);
            LoginLogUtils.recordSuccessLoginLog(UserUtils.getUser().getUsername(), "登陆成功");
            return true;
        } catch (AuthenticationException e) {
            request.setAttribute("error", "用户名或密码错误");
            LoginLogUtils.recordFailLoginLog(username, "用户名或密码错误");
            return false;
        } catch (Exception e) {
            request.setAttribute("error", "登录失败:" + e.getClass().getName());
            LoginLogUtils.recordFailLoginLog(username, "登录失败:" + e.getClass().getName());
            return false;
        }
    }


    @RequestMapping("/access_token")
    @ResponseBody
    public HttpEntity accessToken(HttpServletRequest request)
            throws URISyntaxException, OAuthSystemException {

        try {
            //构建OAuth请求
            OAuthTokenRequest oauthRequest = new OAuthTokenRequest(request);

            //检查提交的客户端id是否正确
            if (!oAuthService.checkClientId(oauthRequest.getClientId())) {
                return ResponseUtils.getErrResponse(HttpServletResponse.SC_BAD_REQUEST, ResponseError.INVALID_CLIENT);
            }

            // 检查客户端安全KEY是否正确
            if (!oAuthService.checkClientSecret(oauthRequest.getClientSecret())) {
                return ResponseUtils.getErrResponse(HttpServletResponse.SC_UNAUTHORIZED, ResponseError.INVALID_CLIENT_SECRET);
            }

            String authCode = "";
            // 检查验证类型，此处只检查AUTHORIZATION_CODE类型，其他的还有PASSWORD或REFRESH_TOKEN
            if (oauthRequest.getParam(OAuth.OAUTH_GRANT_TYPE).equals(GrantType.AUTHORIZATION_CODE.toString())) {
                authCode = oauthRequest.getParam(OAuth.OAUTH_CODE);
                if (!oAuthService.checkAuthCode(authCode)) {
                    return ResponseUtils.getErrResponse(HttpServletResponse.SC_UNAUTHORIZED, ResponseError.INVALID_AUTH_CODE);
                }
            } else if (oauthRequest.getParam(OAuth.OAUTH_GRANT_TYPE).equals(GrantType.PASSWORD.toString())) { //密码模式
                //判断客户端有访问的权限
                Subject subject = SecurityUtils.getSubject();
                String username = oauthRequest.getUsername();
                String password = oauthRequest.getPassword();
                //如果用户没有登录，跳转到登陆页面
                if (!subject.isAuthenticated() && !login(subject, username, password, "", request)) {
                    String error = (String) request.getAttribute("error");
                    return ResponseUtils.getErrResponse(HttpServletResponse.SC_UNAUTHORIZED, ResponseError.MSG_LOGIN_FAILE, error);
                } else {
                    Principal principal = UserUtils.getPrincipal(); // 如果已经登录，则跳转到管理首页
                    OAuthIssuerImpl oauthIssuerImpl = new OAuthIssuerImpl(new MD5Generator());
                    authCode = oauthIssuerImpl.authorizationCode();
                    oAuthService.addAuthCode(authCode, principal);
                }
            }

            //生成Access Token
            Principal principal = oAuthService.getPrincipalByAuthCode(authCode);
            Map<String, String> dataMap = new HashMap<String, String>();
            dataMap.put("id", principal.getId());
            dataMap.put("username", principal.getUsername());
            dataMap.put("realname", principal.getRealname());
            dataMap.put("tenantId", principal.getTenantId());
            dataMap.put("roleId", principal.getRoleId());
            final String accessToken = JWTHelper.sign(dataMap, shiroConfigProperties.getJwtTokenSecret(), Long.parseLong(oAuthService.getExpireIn() + ""));
            oAuthService.addAccessToken(accessToken, oAuthService.getPrincipalByAuthCode(authCode));

            //生成Refresh Token
            OAuthIssuer oauthIssuerImpl = new OAuthIssuerImpl(new MD5Generator());
            final String refreshToken = oauthIssuerImpl.refreshToken();
            oAuthService.addRefreshToken(refreshToken, oAuthService.getPrincipalByAuthCode(authCode));

            //生成OAuth响应
            OAuthResponse response = OAuthASResponse
                    .tokenResponse(HttpServletResponse.SC_OK)
                    .setAccessToken(accessToken)
                    .setRefreshToken(refreshToken)
                    // .setParam("openid",UserUtils.getPrincipal().getId())
                    .setExpiresIn(String.valueOf(oAuthService.getExpireIn()))
                    .buildJSONMessage();

            //根据OAuthResponse生成ResponseEntity
            return new ResponseEntity(response.getBody(), HttpStatus.valueOf(response.getResponseStatus()));
        } catch (OAuthProblemException e) {
            //构建错误响应
            return ResponseUtils.getErrResponse(HttpServletResponse.SC_BAD_REQUEST, ResponseError.INVALID_AUTH_CODE, e.getDescription());
        }
    }


    @RequestMapping("/refresh_token")
    @ResponseBody
    public HttpEntity refreshToken(HttpServletRequest request)
            throws URISyntaxException, OAuthSystemException {

        try {
            //构建OAuth请求
            OAuthTokenRequest oauthRequest = new OAuthTokenRequest(request);

            //检查提交的客户端id是否正确
            if (!oAuthService.checkClientId(oauthRequest.getClientId())) {
                return ResponseUtils.getErrResponse(HttpServletResponse.SC_BAD_REQUEST, ResponseError.INVALID_CLIENT);
            }

            String refreshToken = oauthRequest.getParam(OAuth.OAUTH_REFRESH_TOKEN);
            // 检查验证类型，此处只检查AUTHORIZATION_CODE类型，其他的还有PASSWORD或REFRESH_TOKEN
            if (oauthRequest.getParam(OAuth.OAUTH_GRANT_TYPE).equals(GrantType.REFRESH_TOKEN.toString())) {
                if (!oAuthService.checkRefreshToken(refreshToken)) {
                    return ResponseUtils.getErrResponse(HttpServletResponse.SC_UNAUTHORIZED, ResponseError.INVALID_REFRESH_TOKEN);
                }
            }

            //生成Access Token
            Principal principal = oAuthService.getPrincipalByRefreshToken(refreshToken);
            Map<String, String> dataMap = new HashMap<String, String>();
            dataMap.put("id", principal.getId());
            dataMap.put("username", principal.getUsername());
            dataMap.put("realname", principal.getRealname());
            dataMap.put("tenantId", principal.getTenantId());
            dataMap.put("roleId", principal.getRoleId());
            final String accessToken = JWTHelper.sign(dataMap, shiroConfigProperties.getJwtTokenSecret(), Long.parseLong(oAuthService.getExpireIn() + ""));
            oAuthService.addAccessToken(accessToken, oAuthService.getPrincipalByRefreshToken(refreshToken));

            //生成OAuth响应
            OAuthResponse response = OAuthASResponse
                    .tokenResponse(HttpServletResponse.SC_OK)
                    .setAccessToken(accessToken)
                    .setRefreshToken(refreshToken)
                    .setExpiresIn(String.valueOf(oAuthService.getExpireIn()))
                    .buildJSONMessage();

            //根据OAuthResponse生成ResponseEntity
            return new ResponseEntity(response.getBody(), HttpStatus.valueOf(response.getResponseStatus()));
        } catch (OAuthProblemException e) {
            //构建错误响应
            return ResponseUtils.getErrResponse(HttpServletResponse.SC_BAD_REQUEST, ResponseError.INVALID_REFRESH_TOKEN, e.getDescription());
        }
    }

    /**
     * 检查TOKEN
     *
     * @param request
     * @return
     * @throws URISyntaxException
     * @throws OAuthSystemException
     */
    @RequestMapping("/check_token")
    @ResponseBody
    public HttpEntity checkToken(HttpServletRequest request)
            throws URISyntaxException, OAuthSystemException {
        //try {
        //构建OAuth资源请求
        //OAuthAccessResourceRequest oauthRequest = new OAuthAccessResourceRequest(request, ParameterStyle.QUERY);

        //获取Access Token
        String accessToken = request.getHeader("access_token");
        //验证Access Token
        if (!oAuthService.checkAccessToken(accessToken)) {
            // 如果不存在/过期了，返回未验证错误，需重新验证
            return ResponseUtils.getErrResponse(HttpServletResponse.SC_BAD_REQUEST, ResponseError.INVALID_ACCESS_TOKEN);
        }
        return ResponseUtils.getErrResponse(HttpServletResponse.SC_OK, ResponseError.OK);
       /* } catch (OAuthProblemException e) {
            //构建错误响应
            return ResponseUtils.getErrResponse(HttpServletResponse.SC_BAD_REQUEST, ResponseError.INVALID_ACCESS_TOKEN,e.getDescription());
        }*/
    }

    /**
     * 回收TOKEN
     *
     * @param request
     * @return
     * @throws URISyntaxException
     * @throws OAuthSystemException
     */
    @RequestMapping("/revoke_token")
    @ResponseBody
    public HttpEntity revokeToken(HttpServletRequest request) throws OAuthSystemException {
        String accessToken = request.getHeader("access_token");
        LoginLogUtils.recordLogoutLoginLog(UserUtils.getUser().getUsername(), "退出成功");
        oAuthService.revokeToken(accessToken);
        return ResponseUtils.getErrResponse(HttpServletResponse.SC_OK, ResponseError.OK);
    }
}
