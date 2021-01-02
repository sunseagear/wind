package com.sunseagear.wind.modules.monitor.service.impl;

import com.sunseagear.common.mvc.service.impl.CommonServiceImpl;
import com.sunseagear.wind.modules.monitor.entity.LoginLog;
import com.sunseagear.wind.modules.monitor.mapper.LoginLogMapper;
import com.sunseagear.wind.modules.monitor.service.ILoginLogService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.sys.service.impl
 * @title: 登陆日志服务实现
 * @description: 登陆日志服务实现
 * @author: sys * @date: 2018-09-28 11:31:36
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */
@Transactional
@Service("loginLogService")
public class LoginLogServiceImpl extends CommonServiceImpl<LoginLogMapper, LoginLog> implements ILoginLogService {

}
