package com.sunseagear.common.mvc.exception;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.common.mvc.exception
 * @title:
 * @description: 验证错误 * @date: 2018/10/5 11:12
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public class ValidationException extends RuntimeException {


    public ValidationException() {
        super();
    }


    public ValidationException(String message) {
        super(message);
    }
}
