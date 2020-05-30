package com.sunseagear.wind.modules.email.service.impl;

import com.alibaba.fastjson.JSON;
import com.sunseagear.common.mvc.service.impl.CommonServiceImpl;
import com.sunseagear.wind.modules.email.entity.EmailSendLog;
import com.sunseagear.wind.modules.email.mapper.EmailSendLogMapper;
import com.sunseagear.wind.modules.email.service.IEmailSendLogService;
import com.sunseagear.wind.modules.email.service.IEmailSendService;
import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;
import java.util.Map;


/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.email.service.impl
 * @title: 邮件发送日志服务实现
 * @description: 邮件发送日志服务实现 * @date: 2018-09-12 10:58:46
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */
@Transactional
@Service("emailsendlogService")
public class EmailSendLogServiceImpl extends CommonServiceImpl<EmailSendLogMapper, EmailSendLog> implements IEmailSendLogService {


    @Autowired
    IEmailSendService emailSendService;

    @Override
    public boolean retrySend(List<? extends Serializable> idList) {
        for (Serializable id : idList) {
            EmailSendLog sendLog = selectById(id);
            Map<String, Object> datas = JSON.parseObject(StringEscapeUtils.unescapeHtml4(sendLog.getSendData()), Map.class);
            emailSendService.send(id.toString(), sendLog.getEmail().split(","), sendLog.getSendCode(), datas);
        }
        return true;
    }

}
