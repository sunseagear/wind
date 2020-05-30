package com.sunseagear.wind.modules.sms.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sunseagear.wind.modules.sms.entity.SmsSendLog;
import com.sunseagear.wind.modules.sms.entity.SmsSendLog;
import org.apache.ibatis.annotations.Mapper;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.sms.mapper
 * @title: 发送日志数据库控制层接口
 * @description: 发送日志数据库控制层接口 * @date: 2018-09-14 09:47:53
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */
@Mapper
public interface SmsSendLogMapper extends BaseMapper<SmsSendLog> {

}
