package com.sunseagear.wind.modules.email.service.impl;

import com.sunseagear.common.mvc.service.impl.CommonServiceImpl;
import com.sunseagear.wind.modules.email.entity.EmailTemplate;
import com.sunseagear.wind.modules.email.mapper.EmailTemplateMapper;
import com.sunseagear.wind.modules.email.service.IEmailTemplateService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.email.service.impl
 * @title: 邮件模板服务实现
 * @description: 邮件模板服务实现 * @date: 2018-09-12 10:59:18
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */
@Transactional
@Service("emailTemplateService")
public class EmailTemplateServiceImpl extends CommonServiceImpl<EmailTemplateMapper, EmailTemplate> implements IEmailTemplateService {

}
