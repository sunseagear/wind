package com.sunseagear.wind.modules.monitor.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sunseagear.wind.modules.monitor.entity.LoginLog;
import org.apache.ibatis.annotations.Mapper;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.sys.mapper
 * @title: 登陆日志数据库控制层接口
 * @description: 登陆日志数据库控制层接口
 * @author: sys * @date: 2018-09-28 11:31:36
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */
@Mapper
public interface LoginLogMapper extends BaseMapper<LoginLog> {

}
