package com.sunseagear.wind.modules.sms.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sunseagear.wind.modules.sms.entity.SmsTemplate;
import com.sunseagear.wind.modules.sms.entity.SmsTemplate;
import org.apache.ibatis.annotations.Mapper;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.sms.mapper
 * @title: 短信模板数据库控制层接口
 * @description: 短信模板数据库控制层接口 * @date: 2018-09-14 09:47:35
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */
@Mapper
public interface SmsTemplateMapper extends BaseMapper<SmsTemplate> {

}
