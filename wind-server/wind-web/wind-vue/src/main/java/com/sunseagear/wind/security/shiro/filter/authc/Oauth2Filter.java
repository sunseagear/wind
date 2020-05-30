package com.sunseagear.wind.security.shiro.filter.authc;

import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.exceptions.SignatureVerificationException;
import com.auth0.jwt.exceptions.TokenExpiredException;
import com.sunseagear.common.http.Response;
import com.sunseagear.common.utils.MessageUtils;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.common.response.ResponseError;
import com.sunseagear.wind.utils.JWTHelper;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package cn.gzst.gov.cloud.gateway.security.shiro.filter
 * @title:
 * @description: 无状态访问拦截器 * @date: 2018/3/16 11:41
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public class Oauth2Filter extends AccessControlFilter {

    protected Logger logger = LoggerFactory.getLogger(getClass());

    private static final String DEFAULT_ACCESS_TOKEN_PARAM = "access_token";

    private String tokenParam = DEFAULT_ACCESS_TOKEN_PARAM;
    private String jwtTokenSecret;

    public void setJwtTokenSecret(String jwtTokenSecret) {
        this.jwtTokenSecret = jwtTokenSecret;
    }

    public void setTokenParam(String tokenParam) {
        this.tokenParam = tokenParam;
    }

    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        if (null != getSubject(request, response)
                && getSubject(request, response).isAuthenticated()) {
            return true;
        }
        return false;
    }

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        // 登录失败返回false
        String responseResult = null;
        try {
            AuthenticationToken token = createToken(request, response);
            if (token != null) {
                Subject subject = getSubject(request, response);
                subject.login(token);
                return Boolean.TRUE;
            } else {
                responseResult = Response.error(ResponseError.TOKEN_IS_NULL, MessageUtils.getMessage("error." + ResponseError.TOKEN_IS_NULL));
            }
        } catch (AuthenticationException e) {
            logger.error(e.getMessage(), e);
            responseResult = Response.error(ResponseError.AUTHENTICATION_FAIL, e.getMessage());
        } catch (UnsupportedEncodingException e) {
            responseResult = Response.error(ResponseError.INVALID_ACCESS_TOKEN, e.getMessage());
        } catch (SignatureVerificationException e) {
            responseResult = Response.error(ResponseError.INVALID_ACCESS_TOKEN, e.getMessage());
        } catch (TokenExpiredException e) {
            responseResult = Response.error(ResponseError.EXPIRED_ACCESS_TOKEN, e.getMessage());
        } catch (JWTDecodeException e) {
            responseResult = Response.error(ResponseError.INVALID_ACCESS_TOKEN, e.getMessage());
        } catch (Exception e) {
            responseResult = Response.error(ResponseError.UNKNOWN_ERROR, e.getMessage());
        }
        StringUtils.printJson((HttpServletResponse) response, responseResult);
        return Boolean.FALSE;
    }

    protected AuthenticationToken createToken(ServletRequest request, ServletResponse response) throws UnsupportedEncodingException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        String token = httpServletRequest.getHeader(tokenParam);
        if (StringUtils.isEmpty(token)) {
            token = httpServletRequest.getParameter(tokenParam);
        }
        if (!StringUtils.isEmpty(token)
                && JWTHelper.verify(token, jwtTokenSecret)) {
            return new Oauth2Token(token);
        }
        return null;
    }

}
