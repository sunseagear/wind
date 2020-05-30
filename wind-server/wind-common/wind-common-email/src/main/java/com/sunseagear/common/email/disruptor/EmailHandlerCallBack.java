package com.sunseagear.common.email.disruptor;


import com.sunseagear.common.email.data.EmailResult;

public interface EmailHandlerCallBack {
    void onResult(EmailResult emailResult);
}
