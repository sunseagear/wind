package com.sunseagear.wind.modules.task.service.impl;

import com.sunseagear.common.mvc.service.impl.CommonServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sunseagear.common.quartz.QuartzManager;
import com.sunseagear.common.quartz.callback.QuartzInitCallback;
import com.sunseagear.common.quartz.constant.ScheduleConstants;
import com.sunseagear.wind.modules.task.entity.ScheduleJob;
import com.sunseagear.wind.modules.task.mapper.ScheduleJobMapper;
import com.sunseagear.wind.modules.task.service.IScheduleJobService;
import com.sunseagear.wind.modules.task.utils.ScheduleJobUtils;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

/**
 * @version V1.0
 * @Title: 任务
 * @Description: 任务
 * @date 2017-05-09 23:22:51
 */
@Transactional
@Service("scheduleJobService")
public class ScheduleJobServiceImpl extends CommonServiceImpl<ScheduleJobMapper, ScheduleJob>
        implements IScheduleJobService, QuartzInitCallback {

    @Autowired
    private QuartzManager quartzManager;

    @Override
    public void updateCron(String jobId) {
        try {
            ScheduleJob scheduleJob = selectById(jobId);
            if (scheduleJob == null) {
                return;
            }
            quartzManager.updateJobCron(ScheduleJobUtils.entityToData(scheduleJob));
            super.insertOrUpdate(scheduleJob);
        } catch (SchedulerException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    public void changeStatus(String jobId, String cmd) {
        try {
            ScheduleJob scheduleJob = selectById(jobId);
            if (scheduleJob == null) {
                return;
            }
            if ("stop".equals(cmd)) {
                quartzManager.deleteJob(ScheduleJobUtils.entityToData(scheduleJob));
                scheduleJob.setJobStatus(ScheduleConstants.STATUS_NOT_RUNNING);
            } else if ("start".equals(cmd)) {
                scheduleJob.setJobStatus(ScheduleConstants.STATUS_RUNNING);
                quartzManager.addJob(ScheduleJobUtils.entityToData(scheduleJob));
            }
            super.insertOrUpdate(scheduleJob);
        } catch (SchedulerException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    public boolean deleteById(Serializable id) {
        try {
            ScheduleJob scheduleJob = selectById(id);
            quartzManager.deleteJob(ScheduleJobUtils.entityToData(scheduleJob));
        } catch (SchedulerException e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
        return super.deleteById(id);
    }

    @Override
    public void initSchedule() {
        try {
            // 这里获取任务信息数据
            List<ScheduleJob> jobList = selectList(new QueryWrapper<ScheduleJob>());
            for (ScheduleJob scheduleJob : jobList) {
                quartzManager.addJob(ScheduleJobUtils.entityToData(scheduleJob));
            }
        } catch (SchedulerException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    public void refreshTask() {
        try {
            quartzManager.empty();
            initSchedule();
        } catch (SchedulerException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    public void runAJobNow(String jobId) {
        try {
            ScheduleJob scheduleJob = selectById(jobId);
            quartzManager.runAJobNow(ScheduleJobUtils.entityToData(scheduleJob));
        } catch (SchedulerException e) {
            throw new RuntimeException(e.getMessage());
        }
    }
}
