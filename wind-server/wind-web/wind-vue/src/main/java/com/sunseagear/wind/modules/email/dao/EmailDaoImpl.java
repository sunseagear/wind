package com.sunseagear.wind.modules.email.dao;

import com.sunseagear.common.email.data.EmailResult;
import com.sunseagear.common.email.disruptor.EmailDao;
import com.sunseagear.common.email.disruptor.EmailData;
import com.sunseagear.wind.modules.email.entity.EmailSendLog;
import com.sunseagear.wind.modules.email.service.IEmailSendLogService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @title: EmailDaoIml.java
 * @package com.sunseagear.upms.sms.dao
 * @description: 短信信息返回 * @date: 2017年6月8日 上午11:20:04
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public class EmailDaoImpl implements EmailDao {

    @Autowired
    private IEmailSendLogService emailSendLogService;

    @Override
    public void doResult(String eventId, EmailData emailData, EmailResult smsResult) {
        try {
            EmailSendLog sendLog = emailSendLogService.selectById(eventId);
            sendLog.setMsg(smsResult.getMsg());
            if (smsResult.isSuccess()) {
                sendLog.setStatus(EmailSendLog.EMAIL_SEND_STATUS_SUCCESS);
            } else {
                sendLog.setStatus(EmailSendLog.EMAIL_SEND_STATUS_FAIL);
            }
            sendLog.setResponseDate(new Date());
            emailSendLogService.insertOrUpdate(sendLog);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
