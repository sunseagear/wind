package com.sunseagear.common.sms.disruptor;

import com.sunseagear.common.sms.data.SmsResult;

import java.io.Serializable;

public interface SmsHandlerCallBack extends Serializable {
    void onResult(SmsResult smsResult);
}
