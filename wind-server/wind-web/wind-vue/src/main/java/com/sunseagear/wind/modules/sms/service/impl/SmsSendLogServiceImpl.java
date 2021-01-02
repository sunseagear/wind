package com.sunseagear.wind.modules.sms.service.impl;

import com.sunseagear.common.mvc.service.impl.CommonServiceImpl;
import com.sunseagear.wind.modules.sms.entity.SmsSendLog;
import com.sunseagear.wind.modules.sms.mapper.SmsSendLogMapper;
import com.sunseagear.wind.modules.sms.service.ISmsSendLogService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.sms.service.impl
 * @title: 发送日志服务实现
 * @description: 发送日志服务实现 * @date: 2018-09-14 09:47:53
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */
@Transactional
@Service("smsSendLogService")
public class SmsSendLogServiceImpl extends CommonServiceImpl<SmsSendLogMapper, SmsSendLog> implements ISmsSendLogService {

    @Override
    public boolean retrySend(List<? extends Serializable> idList) {
        List<SmsSendLog> smsSendLogList = new ArrayList<SmsSendLog>();
        for (Serializable id : idList) {
            SmsSendLog smsSendLog = selectById(id);
            smsSendLog.setTryNum(0);
            smsSendLog.setStatus(SmsSendLog.SMS_SEND_STATUS_FAIL);
            smsSendLogList.add(smsSendLog);
        }
        insertOrUpdateBatch(smsSendLogList);
        return false;
    }

}
