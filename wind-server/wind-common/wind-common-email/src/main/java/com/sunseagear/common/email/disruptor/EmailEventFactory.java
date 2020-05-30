package com.sunseagear.common.email.disruptor;

import com.lmax.disruptor.EventFactory;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @title: LongEventFactory.java
 * @package com.sunseagear.common.disruptor.sms
 * @description: 定义事件工厂 * @date: 2017年6月7日 下午11:18:32
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public class EmailEventFactory implements EventFactory<EmailEvent> {
    public EmailEvent newInstance() {
        return new EmailEvent();
    }
}
