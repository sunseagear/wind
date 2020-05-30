package com.sunseagear.wind.common.response;

import org.apache.oltu.oauth2.as.response.OAuthASResponse;
import org.apache.oltu.oauth2.common.exception.OAuthProblemException;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.api.web.oauth
 * @title:
 * @description: Cache工具类 * @date: 2018/1/8 14:57
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public class OAuthCloudResponse extends OAuthASResponse {
    protected OAuthCloudResponse(String uri, int responseStatus) {
        super(uri, responseStatus);
    }

    public static OAuthCloudResponse.OAuthCloudErrorResponseBuilder errorCloudResponse(int code) {
        return new OAuthCloudResponse.OAuthCloudErrorResponseBuilder(code);
    }

    public static class OAuthCloudErrorResponseBuilder extends OAuthResponseBuilder {
        public OAuthCloudErrorResponseBuilder(int responseCode) {
            super(responseCode);
        }

        public OAuthCloudResponse.OAuthCloudErrorResponseBuilder error(OAuthProblemException ex) {
            this.parameters.put("code", ex.getError());
            this.parameters.put("msg", ex.getDescription());
            this.parameters.put("error_uri", ex.getUri());
            this.parameters.put("state", ex.getState());
            return this;
        }

        public OAuthCloudResponse.OAuthCloudErrorResponseBuilder setErrcode(int errcode) {
            this.parameters.put("code", errcode);
            return this;
        }

        public OAuthCloudResponse.OAuthCloudErrorResponseBuilder setErrmsg(String errmsg) {
            this.parameters.put("msg", errmsg);
            return this;
        }

        public OAuthCloudResponse.OAuthCloudErrorResponseBuilder setErrorUri(String state) {
            this.parameters.put("error_uri", state);
            return this;
        }

        public OAuthCloudResponse.OAuthCloudErrorResponseBuilder setState(String state) {
            this.parameters.put("state", state);
            return this;
        }

        public OAuthCloudResponse.OAuthCloudErrorResponseBuilder setRealm(String realm) {
            this.parameters.put("realm", realm);
            return this;
        }

        public OAuthCloudResponse.OAuthCloudErrorResponseBuilder location(String location) {
            this.location = location;
            return this;
        }
    }
}
