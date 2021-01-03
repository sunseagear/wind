package com.sunseagear.wind.modules.monitor.task;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sunseagear.wind.modules.monitor.entity.LoginLog;
import com.sunseagear.wind.modules.monitor.entity.OperationLog;
import com.sunseagear.wind.modules.monitor.service.ILoginLogService;
import com.sunseagear.wind.modules.monitor.service.IOperationLogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import java.util.Calendar;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.email.task
 * @title:
 * @description: 邮件任务，主要检查发送失败的 * @date: 2018/9/17 16:52
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
@Component("logTask")
public class LogTask implements ApplicationListener<ContextRefreshedEvent> {
    public final Logger log = LoggerFactory.getLogger(getClass());
    @Autowired
    private IOperationLogService operationLogService;
    @Autowired
    private ILoginLogService loginLogService;

    /**
     * 这里把发送中的邮件恢复发送
     */
    @Override
    public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {
    }

    public void run() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MONTH, -1);
        operationLogService.delete(new QueryWrapper<OperationLog>().lt("create_date", calendar.getTime()));
        loginLogService.delete(new QueryWrapper<LoginLog>().lt("login_time", calendar.getTime()));

    }
}
