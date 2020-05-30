package com.sunseagear.wind.modules.email.task;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sunseagear.wind.modules.email.entity.EmailSendLog;
import com.sunseagear.wind.modules.email.service.IEmailSendLogService;
import com.sunseagear.wind.modules.email.service.IEmailSendService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.email.task
 * @title:
 * @description: 邮件任务，主要检查发送失败的 * @date: 2018/9/17 16:52
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
@Component("emailTask")
public class EmailTask implements ApplicationListener<ContextRefreshedEvent> {
    public final Logger log = Logger.getLogger(this.getClass());
    @Autowired
    private IEmailSendLogService emailSendLogService;
    @Autowired
    private IEmailSendService emailSendService;
    private Boolean isRun = Boolean.FALSE;

    /**
     * 这里把发送中的邮件恢复发送
     */
    @Override
    public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {
        //找到发送中的邮件重新发送
        List<EmailSendLog> emailEmailSendLogList = emailSendLogService
                .selectList(new QueryWrapper<EmailSendLog>()
                        .eq("status", EmailSendLog.EMAIL_SEND_STATUS_IN));
        //恢复处理
        for (EmailSendLog emailEmailSendLog : emailEmailSendLogList) {
            emailSendService.send(emailEmailSendLog.getId(), emailEmailSendLog.getEmail(), emailEmailSendLog.getSendCode(),
                    JSON.parseObject(emailEmailSendLog.getSendData(), Map.class));
        }
    }

    /**
     * 检查回复并写入到日志中
     */
    public void run() {
        log.info(" 邮件重发日志运行开始......................................" + (new Date()));
        if (!isRun) {
            isRun = Boolean.TRUE;
            try {
                //查询出询问邮件
                //找到未发送成功的邮件
                List<EmailSendLog> emailEmailSendLogList = emailSendLogService
                        .selectList(new QueryWrapper<EmailSendLog>()
                                .eq("status", EmailSendLog.EMAIL_SEND_STATUS_FAIL).lt("tryNum", 3)
                        );
                //恢复处理
                for (EmailSendLog emailEmailSendLog : emailEmailSendLogList) {
                    sendByLog(emailEmailSendLog);
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                isRun = Boolean.FALSE;
            }
        }
    }

    public void sendByLog(EmailSendLog emailEmailSendLog) {
        try {
            //更新类型
            emailEmailSendLog.setStatus(EmailSendLog.EMAIL_SEND_STATUS_IN);
            //表示响应成功！
            if (emailEmailSendLog.getTryNum() == null) {
                emailEmailSendLog.setTryNum(0);
            }
            emailEmailSendLog.setTryNum(emailEmailSendLog.getTryNum() + 1);
            emailSendLogService.insertOrUpdate(emailEmailSendLog);
            emailSendService.send(emailEmailSendLog.getId(), emailEmailSendLog.getEmail(), emailEmailSendLog.getSendCode(),
                    JSON.parseObject(emailEmailSendLog.getSendData(), Map.class));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
