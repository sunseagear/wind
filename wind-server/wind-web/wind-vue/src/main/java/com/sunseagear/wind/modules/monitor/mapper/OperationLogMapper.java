package com.sunseagear.wind.modules.monitor.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sunseagear.wind.modules.monitor.entity.OperationLog;
import org.apache.ibatis.annotations.Mapper;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.sys.mapper
 * @title: 操作日志数据库控制层接口
 * @description: 操作日志数据库控制层接口 * @date: 2018-09-30 15:53:25
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */
@Mapper
public interface OperationLogMapper extends BaseMapper<OperationLog> {

}
