package com.sunseagear.wind.modules.sms.service.impl;

import com.sunseagear.common.mvc.service.impl.CommonServiceImpl;
import com.sunseagear.wind.modules.sms.entity.SmsTemplate;
import com.sunseagear.wind.modules.sms.mapper.SmsTemplateMapper;
import com.sunseagear.wind.modules.sms.service.ISmsTemplateService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.sms.service.impl
 * @title: 短信模板服务实现
 * @description: 短信模板服务实现 * @date: 2018-09-14 09:47:35
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */
@Transactional
@Service("smsTemplateService")
public class SmsTemplateServiceImpl extends CommonServiceImpl<SmsTemplateMapper, SmsTemplate> implements ISmsTemplateService {

}
