package com.sunseagear.wind.modules.email.service;

import com.sunseagear.common.mvc.service.ICommonService;
import com.sunseagear.wind.modules.email.entity.EmailSendLog;

import java.io.Serializable;
import java.util.List;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.email.service
 * @title: 邮件发送日志服务接口
 * @description: 邮件发送日志服务接口 * @date: 2018-09-12 10:58:46
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */
public interface IEmailSendLogService extends ICommonService<EmailSendLog> {

    /**
     * <p>
     * 邮件重发
     * </p>
     *
     * @param idList 主键ID列表
     * @return boolean
     */
    boolean retrySend(List<? extends Serializable> idList);
}
