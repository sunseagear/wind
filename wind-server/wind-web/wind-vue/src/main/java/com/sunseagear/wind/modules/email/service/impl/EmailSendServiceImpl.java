package com.sunseagear.wind.modules.email.service.impl;

import com.sunseagear.common.email.disruptor.EmailHelper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sunseagear.common.sms.exception.SmsException;
import com.sunseagear.common.utils.mapper.JsonMapper;
import com.sunseagear.wind.modules.email.entity.EmailSendLog;
import com.sunseagear.wind.modules.email.entity.EmailTemplate;
import com.sunseagear.wind.modules.email.service.IEmailSendLogService;
import com.sunseagear.wind.modules.email.service.IEmailSendService;
import com.sunseagear.wind.modules.email.service.IEmailTemplateService;
import org.apache.commons.text.StringEscapeUtils;
import org.beetl.core.Configuration;
import org.beetl.core.GroupTemplate;
import org.beetl.core.Template;
import org.beetl.core.resource.StringTemplateResourceLoader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.email.service.impl
 * @title:
 * @description: 邮件发送 * @date: 2018/9/12 11:15
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
@Service("emailSendService")
public class EmailSendServiceImpl implements IEmailSendService {

    @Autowired
    private IEmailTemplateService emailTemplateService;
    @Autowired
    private IEmailSendLogService emailSendLogService;
    @Autowired
    private EmailHelper emailHelper; //自动注入的Bean

    @Value("${spring.mail.sender}")
    private String sender; //发送的人

    @Override
    public void send(String email, String code, Map<String, Object> datas) {
        String[] emails = {email};
        send(emails, code, datas);
    }

    @Override
    public void send(String[] emails, String code, Map<String, Object> datas) {
        EmailTemplate template = emailTemplateService.selectOne(new QueryWrapper<EmailTemplate>().eq("code", code));
        if (datas == null) {
            datas = new HashMap<>();
        }
        if (template == null) {
            return;
        }
        String content = parseContent(StringEscapeUtils.unescapeHtml4(template.getTemplateContent()), datas);
        String subject = parseContent(StringEscapeUtils.unescapeHtml4(template.getTemplateSubject()), datas);
        // List<EmailSendLog> emailSendLogList = new ArrayList<EmailSendLog>();
        for (String email : emails) {
            EmailSendLog emailSendLog = new EmailSendLog();
            emailSendLog.setEmail(email);
            emailSendLog.setSubject(subject);
            emailSendLog.setContent(content);
            emailSendLog.setMsg("发送成功");
            emailSendLog.setSendCode(code);
            emailSendLog.setResponseDate(new Date());
            emailSendLog.setSendData(JsonMapper.toJsonString(datas));
            emailSendLog.setStatus(EmailSendLog.EMAIL_SEND_STATUS_IN);
            emailSendLog.setTryNum(0);
            emailSendLog.setDelFlag("0");
            // emailSendLogList.add(emailSendLog);
            emailSendLogService.insert(emailSendLog);
            // 发送邮件
            sendEmail(emailSendLog.getId(), email, subject, content);
        }
        /*if (emailSendLogList.size()>0) {
            emailSendLogService.insertBatch(emailSendLogList);
        }*/
    }

    private void sendEmail(String eventId, String to, String subject, String text) {
        try {
            MimeMessage message = emailHelper.createMimeMessage(null);//创建一个MINE消息
            //true表示需要创建一个multipart message
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setFrom(sender);
            helper.setTo(to); //自己给自己发送邮件
            helper.setSubject(subject);
            helper.setText(text, true);
            emailHelper.sendAsync(eventId, message, null);
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    private String parseContent(String content, Map<String, Object> dataMap) {
        if (dataMap != null) {
            try {
                StringTemplateResourceLoader resourceLoader = new StringTemplateResourceLoader();
                Configuration cfg = Configuration.defaultConfiguration();
                GroupTemplate gt = new GroupTemplate(resourceLoader, cfg);
                Template t = gt.getTemplate(content);
                t.binding(dataMap);
                content = t.render();
            } catch (Exception e) {
                throw new SmsException("模板解析失败");
            }
        }
        return content;

    }

    @Override
    public void send(String eventId, String email, String code, Map<String, Object> datas) {
        String[] emails = {email};
        send(eventId, emails, code, datas);
    }

    @Override
    public void send(String eventId, String[] emails, String code, Map<String, Object> datas) {
        EmailTemplate template = emailTemplateService.selectOne(new QueryWrapper<EmailTemplate>().eq("code", code));
        if (datas == null) {
            datas = new HashMap<>();
        }
        if (template == null) {
            return;
        }
        String content = parseContent(StringEscapeUtils.unescapeHtml4(template.getTemplateContent()), datas);
        String subject = parseContent(StringEscapeUtils.unescapeHtml4(template.getTemplateSubject()), datas);
        for (String email : emails) {
            // 发送邮件
            sendEmail(eventId, email, subject, content);
        }
    }
}
