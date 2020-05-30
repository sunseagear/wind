package com.sunseagear.common.sms.disruptor;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @title: LongEvent.java
 * @package com.sunseagear.sms.common.disruptor.sms
 * @description: 内容传递 * @date: 2017年6月7日 下午11:17:40
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public class SmsEvent {
    private SmsData smsData;
    private String id;
    private SmsHandlerCallBack handlerCallBack;

    public SmsData getSmsData() {
        return smsData;
    }

    public void setSmsData(SmsData smsData) {
        this.smsData = smsData;
    }

    public SmsHandlerCallBack getHandlerCallBack() {
        return handlerCallBack;
    }

    public void setHandlerCallBack(SmsHandlerCallBack handlerCallBack) {
        this.handlerCallBack = handlerCallBack;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

}
