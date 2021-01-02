package com.sunseagear.wind.modules.monitor.service.impl;

import com.sunseagear.common.mvc.service.impl.CommonServiceImpl;
import com.sunseagear.wind.modules.monitor.entity.OperationLog;
import com.sunseagear.wind.modules.monitor.mapper.OperationLogMapper;
import com.sunseagear.wind.modules.monitor.service.IOperationLogService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.sys.service.impl
 * @title: 操作日志服务实现
 * @description: 操作日志服务实现 * @date: 2018-09-30 15:53:25
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */
@Transactional
@Service("operationLogService")
public class OperationLogServiceImpl extends CommonServiceImpl<OperationLogMapper, OperationLog> implements IOperationLogService {

}
