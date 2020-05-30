package com.sunseagear.wind.utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTCreator;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.interfaces.DecodedJWT;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Map;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.common.utils
 * @title:
 * @description: JWT加密，校验工具 * @date: 2018/3/16 9:59
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public class JWTHelper {

    /**
     * 获得token中的信息无需secret解密也能获得
     *
     * @return token中包含的用户名
     */
    public static String getUserid(String token) {
        try {
            DecodedJWT jwt = JWT.decode(token);
            return jwt.getClaim("uid").asString();
        } catch (JWTDecodeException e) {
            return null;
        }
    }

    /**
     * 获得token中的信息无需secret解密也能获得
     *
     * @param token
     * @param key
     * @return
     */
    public static String getClaims(String token, String key) {
        try {
            DecodedJWT jwt = JWT.decode(token);
            return jwt.getClaim(key).asString();
        } catch (JWTDecodeException e) {
            return null;
        }
    }

    /**
     * 生成签名
     *
     * @param claims     用户名
     * @param secret     生成token的密钥
     * @param expireTime 过期时间
     * @return 加密的token
     */
    public static String sign(Map<String, String> claims, String secret, Long expireTime) {
        try {
            Date date = new Date(System.currentTimeMillis() + expireTime * 1000);
            Algorithm algorithm = Algorithm.HMAC256(secret);
            // 附带uid信息
            JWTCreator.Builder builder = JWT.create();
            for (Map.Entry<String, String> entry : claims.entrySet()) {
                builder.withClaim(entry.getKey(), entry.getValue());
            }
            builder.withExpiresAt(date);
            return builder.sign(algorithm);
        } catch (UnsupportedEncodingException e) {
            return null;
        }
    }

    /**
     * 校验token是否正确
     *
     * @param token  密钥
     * @param secret 生成token的密钥
     * @return 是否正确
     */
    public static boolean verify(String token, String secret) throws UnsupportedEncodingException {
        Algorithm algorithm = Algorithm.HMAC256(secret);
        JWTVerifier verifier = JWT.require(algorithm)
                .build();
        verifier.verify(token);
        return true;
    }
}
