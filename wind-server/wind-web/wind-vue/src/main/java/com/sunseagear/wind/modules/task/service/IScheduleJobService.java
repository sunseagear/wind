package com.sunseagear.wind.modules.task.service;


import com.sunseagear.common.mvc.service.ICommonService;
import com.sunseagear.wind.modules.task.entity.ScheduleJob;
import org.quartz.SchedulerException;

/**
 * @version V1.0
 * @Title: 任务
 * @Description: 任务
 * @date 2017-05-09 23:22:51
 */
public interface IScheduleJobService extends ICommonService<ScheduleJob> {
    /**
     * @throws SchedulerException
     * @title: initSchedule
     * @description: 初始化任务
     * @return: void
     */
    void initSchedule();

    /**
     * 更改状态
     *
     * @throws SchedulerException
     */
    void changeStatus(String jobId, String cmd);

    /**
     * 更改任务 cron表达式
     *
     * @throws SchedulerException
     */
    void updateCron(String jobId);

    /**
     * 执行一次
     *
     * @throws SchedulerException
     */
    void runAJobNow(String jobId);

    /**
     * 刷新任务
     *
     * @throws SchedulerException
     */
    void refreshTask();
}
