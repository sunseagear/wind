package com.sunseagear.wind.aspectj.annotation;

import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.aspectj.enums.LogType;

import java.lang.annotation.*;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.aspectj
 * @title:
 * @description: 自定义操作日志记录注解 * @date: 2018/8/7 11:31
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log {
    /**
     * 标题或模块
     */
    String title() default "";

    /**
     * 功能
     */
    LogType logType() default LogType.OTHER;

    /**
     * 请求参数
     */
    boolean requestParam() default true;

}
