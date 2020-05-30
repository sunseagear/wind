package com.sunseagear.wind.config;

import com.sunseagear.common.sms.client.AliyunSmsClient;
import com.sunseagear.common.sms.client.ISmsClient;
import com.sunseagear.common.sms.config.SmsConfigProperties;
import com.sunseagear.common.sms.disruptor.SmsDao;
import com.sunseagear.common.sms.disruptor.SmsHelper;
import com.sunseagear.wind.modules.sms.dao.SmsDaoImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.config
 * @title:
 * @description: 短信发送配置 * @date: 2018/3/1 16:06
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
@Configuration
@EnableConfigurationProperties({SmsConfigProperties.class})
public class SmsConfig {
    @Autowired
    private SmsConfigProperties smsConfigProperties;

    @Bean
    public SmsDao smsDao() {
        SmsDao smsDao = new SmsDaoImpl();
        return smsDao;
    }

    @Bean
    public ISmsClient smsClient() {
        ISmsClient smsClient = new AliyunSmsClient();
        smsClient.init(smsConfigProperties);
        return smsClient;
    }

    @Bean
    public SmsHelper smsHelper(ISmsClient smsClient, SmsDao smsDao) {
        SmsHelper smsHelper = new SmsHelper();
        smsHelper.setHandlerCount(1);
        smsHelper.setBufferSize(1024);
        smsHelper.setSmsClient(smsClient);
        smsHelper.setSmsDao(smsDao);
        return smsHelper;
    }

}
