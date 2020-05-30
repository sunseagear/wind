package com.sunseagear.wind;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind
 * @title:
 * @description: 启动入口 * @date: 2018/8/14 10:25
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public class VueWebBootServletInitializer extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(VueWebBootApplication.class);
    }
}
