package com.sunseagear.common.email.disruptor;

import com.sunseagear.common.email.data.EmailResult;
import com.lmax.disruptor.WorkHandler;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @title: SmsHandler.java
 * @package com.sunseagear.common.disruptor.sms
 * @description: 内容消费者 * @date: 2017年6月7日 下午11:20:32
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public class EmailHandler implements WorkHandler<EmailEvent> {
    private EmailDao emailDao;

    public EmailHandler(EmailDao emailDao) {
        this.emailDao = emailDao;
    }

    @Override
    public void onEvent(EmailEvent event) throws Exception {
        EmailResult emailResult = EmailResult.success("发送成功");
        try {
            MailSenderFactory.build(event.getEmailData().getMailProperties()).send(event.getEmailData().getMimeMessage());
        } catch (Exception e) {
            e.printStackTrace();
            emailResult = EmailResult.fail("发送失败");
        }
        if (event.getHandlerCallBack() != null) {
            event.getHandlerCallBack().onResult(emailResult);
        }

        if (emailDao != null) {
            emailDao.doResult(event.getId(), event.getEmailData(), emailResult);
        }

        //休息1000毫秒
        Thread.sleep(6000);
    }

}
