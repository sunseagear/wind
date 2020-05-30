package com.sunseagear.wind.modules.sms.service;

import com.sunseagear.common.mvc.service.ICommonService;
import com.sunseagear.wind.modules.sms.entity.SmsSendLog;

import java.io.Serializable;
import java.util.List;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.sms.service
 * @title: 发送日志服务接口
 * @description: 发送日志服务接口 * @date: 2018-09-14 09:47:53
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */
public interface ISmsSendLogService extends ICommonService<SmsSendLog> {
    /**
     * <p>
     * 短信重发
     * </p>
     *
     * @param idList 主键ID列表
     * @return boolean
     */
    boolean retrySend(List<? extends Serializable> idList);
}
