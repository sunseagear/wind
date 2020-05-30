package com.sunseagear.wind.modules.sms.dao;

import com.sunseagear.common.sms.data.SmsResult;
import com.sunseagear.common.sms.disruptor.SmsDao;
import com.sunseagear.common.sms.disruptor.SmsData;
import com.sunseagear.wind.modules.sms.entity.SmsSendLog;
import com.sunseagear.wind.modules.sms.service.ISmsSendLogService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @title: SmsDaoIml.java
 * @package com.sunseagear.upms.sms.dao
 * @description: 短信信息返回 * @date: 2017年6月8日 上午11:20:04
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public class SmsDaoImpl implements SmsDao {

    @Autowired
    private ISmsSendLogService smsSendLogService;

    @Override
    public void doResult(String eventId, SmsData smsData, SmsResult smsResult) {
        try {
            SmsSendLog sendLog = smsSendLogService.selectById(eventId);
            sendLog.setMsg(smsResult.getMsg());
            if (smsResult.isSuccess()) {
                sendLog.setStatus(SmsSendLog.SMS_SEND_STATUS_SUCCESS);
            } else {
                sendLog.setStatus(SmsSendLog.SMS_SEND_STATUS_FAIL);
            }
            sendLog.setSmsid(smsResult.getSmsid());
            sendLog.setResponseDate(new Date());
            smsSendLogService.insertOrUpdate(sendLog);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
