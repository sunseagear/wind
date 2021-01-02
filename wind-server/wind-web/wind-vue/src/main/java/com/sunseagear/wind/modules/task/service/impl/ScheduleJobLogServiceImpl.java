package com.sunseagear.wind.modules.task.service.impl;

import com.sunseagear.common.mvc.service.impl.CommonServiceImpl;
import com.sunseagear.common.quartz.callback.QuartzExecuteCallback;
import com.sunseagear.common.quartz.data.ScheduleJob;
import com.sunseagear.wind.modules.task.entity.ScheduleJobLog;
import com.sunseagear.wind.modules.task.mapper.ScheduleJobLogMapper;
import com.sunseagear.wind.modules.task.service.IScheduleJobLogService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;


/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.task.service.impl
 * @title: 任务日志服务实现
 * @description: 任务日志服务实现 * @date: 2018-09-17 14:25:19
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */
@Transactional
@Service("scheduleJobLogService")
public class ScheduleJobLogServiceImpl
        extends CommonServiceImpl<ScheduleJobLogMapper, ScheduleJobLog>
        implements IScheduleJobLogService, QuartzExecuteCallback {

    @Override
    public void onStart(ScheduleJob scheduleJob) {
        ScheduleJobLog scheduleJobLog = newJobLog(scheduleJob);
        scheduleJobLog.setJobMessage(scheduleJob.getJobName() + "运行开始!");
        scheduleJobLog.setStatus(ScheduleJobLog.SCHEDULE_JOB_LOG_RUN_NOMAL);
        insert(scheduleJobLog);
    }

    @Override
    public void onSuccess(ScheduleJob scheduleJob, String message) {
        ScheduleJobLog scheduleJobLog = newJobLog(scheduleJob);
        scheduleJobLog.setJobMessage(message);
        scheduleJobLog.setStatus(ScheduleJobLog.SCHEDULE_JOB_LOG_RUN_SUCCESS);
        insert(scheduleJobLog);
    }

    @Override
    public void onFailure(ScheduleJob scheduleJob, Exception e, String message) {
        ScheduleJobLog scheduleJobLog = newJobLog(scheduleJob);
        scheduleJobLog.setJobMessage(message);
        scheduleJobLog.setStatus(ScheduleJobLog.SCHEDULE_JOB_LOG_RUN_FAIL);
        scheduleJobLog.setExceptionInfo(e.getMessage());
        insert(scheduleJobLog);
    }

    private ScheduleJobLog newJobLog(ScheduleJob scheduleJob) {
        ScheduleJobLog scheduleJobLog = new ScheduleJobLog();
        scheduleJobLog.setJobName(scheduleJob.getJobName());
        scheduleJobLog.setJobGroup(scheduleJob.getJobGroup());
        scheduleJobLog.setExecuteClass(scheduleJob.getExecuteClass());
        scheduleJobLog.setMethodName(scheduleJob.getMethodName());
        scheduleJobLog.setMethodParams(scheduleJob.getMethodParams());
        scheduleJobLog.setCreateTime(new Date());
        return scheduleJobLog;
    }
}
