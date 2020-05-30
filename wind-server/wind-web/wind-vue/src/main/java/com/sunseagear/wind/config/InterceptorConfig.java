package com.sunseagear.wind.config;

import com.sunseagear.common.interceptor.EncodingInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.config
 * @title:
 * @description: 拦截器 * @date: 2018/3/3 15:06
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

    /**
     * 编码拦截器
     *
     * @return
     */
    @Bean
    public HandlerInterceptor encodingInterceptor() {
        EncodingInterceptor encodingInterceptor = new EncodingInterceptor();
        return encodingInterceptor;
    }


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //编码拦截器
        registry.addInterceptor(encodingInterceptor()).addPathPatterns("/**").excludePathPatterns("/upload/**", "/static/**");
    }
}
