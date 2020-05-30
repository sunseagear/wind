package com.sunseagear.wind.modules.email.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sunseagear.wind.modules.email.entity.EmailSendLog;
import org.apache.ibatis.annotations.Mapper;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.email.mapper
 * @title: 邮件发送日志数据库控制层接口
 * @description: 邮件发送日志数据库控制层接口 * @date: 2018-09-12 10:58:46
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */
@Mapper
public interface EmailSendLogMapper extends BaseMapper<EmailSendLog> {

}
