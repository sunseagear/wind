package com.sunseagear.wind.config;

import com.sunseagear.common.email.disruptor.EmailDao;
import com.sunseagear.common.email.disruptor.EmailHelper;
import com.sunseagear.wind.modules.email.dao.EmailDaoImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.config
 * @title:
 * @description: 邮件发送配置 * @date: 2018/3/1 16:06
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
@Configuration
public class EmailConfig {

    @Bean
    public EmailDao emailDao() {
        EmailDao emailDao = new EmailDaoImpl();
        return emailDao;
    }

    @Bean
    public EmailHelper emailHelper(EmailDao emailDao) {
        EmailHelper emailHelper = new EmailHelper();
        emailHelper.setHandlerCount(1);
        emailHelper.setBufferSize(1024);
        emailHelper.setEmailDao(emailDao);
        return emailHelper;
    }

}
