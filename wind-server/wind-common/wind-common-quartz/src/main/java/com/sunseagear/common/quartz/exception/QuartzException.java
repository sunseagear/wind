package com.sunseagear.common.quartz.exception;

/**
 * 定时异常
 * Created by 王存见 on 2017/8/11.
 */
public class QuartzException extends RuntimeException {

    public QuartzException() {
        super();
    }


    public QuartzException(String message) {
        super(message);
    }

    public QuartzException(String message, Throwable cause) {
        super(message, cause);
    }


    public QuartzException(Throwable cause) {
        super(cause);
    }


    protected QuartzException(String message, Throwable cause,
                              boolean enableSuppression,
                              boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
