package com.sunseagear.common.sms.client;

import com.sunseagear.common.sms.constant.Constants;

/**
 * 文件上传Factory
 */
public final class SmsClientFactory {
    private static ISmsClient ossClient;

    public static ISmsClient build(String clientType) {
        if (Constants.CLIENTA_ALIYUN.equals(clientType)) {
            return new AliyunSmsClient();
        }
        return null;
    }

}
