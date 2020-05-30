package com.sunseagear.common.sms.config;

import com.sunseagear.common.utils.PropertiesUtil;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.common.oss.config
 * @title:
 * @description: 阿里云配置 * @date: 2018/4/26 9:39
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public class AliyunConfigProperties {
    public static final String DEFAULT_CONFIG_FILE = "aliyun.sms.properties";

    //阿里云api的密钥access key id
    String accessKeyId = "";
    //阿里云api的密钥access key secret
    String accessKeySecret = "";

    public static SmsConfigProperties buildConfigProperties() {
        return buildConfigProperties(DEFAULT_CONFIG_FILE);
    }

    public static SmsConfigProperties buildConfigProperties(String propertiesName) {
        PropertiesUtil p = new PropertiesUtil(propertiesName);
        SmsConfigProperties smsConfigProperties = new SmsConfigProperties();
        smsConfigProperties.setOpen(p.getBoolean("sms.open"));
        smsConfigProperties.setSignName(p.getString("sms.sign-name"));
        AliyunConfigProperties aliyunConfig = new AliyunConfigProperties();
        aliyunConfig.setAccessKeyId(p.getString("sms.aliyun.access-key-id"));
        aliyunConfig.setAccessKeySecret(p.getString("sms.aliyun.access-key-secret"));
        smsConfigProperties.setAliyun(aliyunConfig);
        return smsConfigProperties;
    }

    public String getAccessKeyId() {
        return accessKeyId;
    }

    public void setAccessKeyId(String accessKeyId) {
        this.accessKeyId = accessKeyId;
    }

    public String getAccessKeySecret() {
        return accessKeySecret;
    }

    public void setAccessKeySecret(String accessKeySecret) {
        this.accessKeySecret = accessKeySecret;
    }

}
