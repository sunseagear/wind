package com.sunseagear.common.email.disruptor;

import com.sunseagear.common.email.data.EmailResult;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @title: SmsDao.java
 * @package com.sunseagear.common.disruptor.sms
 * @description: 短信dao * @date: 2017年6月8日 上午8:42:47
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public interface EmailDao {

    /**
     * @title: doResult
     * @description:响应
     * @return: void
     */
    public void doResult(String eventId, EmailData emailData, EmailResult emailResult);
}
