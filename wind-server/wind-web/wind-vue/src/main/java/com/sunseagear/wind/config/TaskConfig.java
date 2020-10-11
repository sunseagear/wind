package com.sunseagear.wind.config;

import com.sunseagear.common.disruptor.TaskHelper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.config
 * @title:
 * @description: 公用任务配置 * @date: 2018/3/1 16:06
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
@Configuration
public class TaskConfig {

    @Bean
    public TaskHelper taskHelper() {
        TaskHelper taskHelper = new TaskHelper();
        taskHelper.setHandlerCount(1);
        taskHelper.setBufferSize(1024);
        return taskHelper;
    }

}
