package com.sunseagear.common.sms.exception;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.common.oss.config
 * @title:
 * @description: 短信发送异常 * @date: 2018/9/11 9:39
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public class SmsException extends RuntimeException {

    public SmsException() {
        super();
    }


    public SmsException(String message) {
        super(message);
    }

    public SmsException(String message, Throwable cause) {
        super(message, cause);
    }


    public SmsException(Throwable cause) {
        super(cause);
    }


    protected SmsException(String message, Throwable cause,
                           boolean enableSuppression,
                           boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
