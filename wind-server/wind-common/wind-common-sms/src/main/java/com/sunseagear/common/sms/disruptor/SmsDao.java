package com.sunseagear.common.sms.disruptor;

import com.sunseagear.common.sms.data.SmsResult;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @title: SmsDao.java
 * @package com.sunseagear.sms.common.disruptor.sms
 * @description: 短信dao * @date: 2017年6月8日 上午8:42:47
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public interface SmsDao {
    /**
     * @title: doResult
     * @description:响应
     * @return: void
     */
    void doResult(String eventId, SmsData smsData, SmsResult smsResult);
}
