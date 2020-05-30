package com.sunseagear.wind.modules.task.utils;


import com.sunseagear.wind.modules.task.entity.ScheduleJob;

public class ScheduleJobUtils {
    public static com.sunseagear.common.quartz.data.ScheduleJob entityToData(ScheduleJob scheduleJobEntity) {
        com.sunseagear.common.quartz.data.ScheduleJob scheduleJob = new com.sunseagear.common.quartz.data.ScheduleJob();
        scheduleJob.setJobId(scheduleJobEntity.getId());
        scheduleJob.setCronExpression(scheduleJobEntity.getCronExpression());
        scheduleJob.setDescription(scheduleJobEntity.getDescription());
        scheduleJob.setIsConcurrent(scheduleJobEntity.getIsConcurrent());
        scheduleJob.setJobName(scheduleJobEntity.getJobName());
        scheduleJob.setLoadWay(scheduleJobEntity.getLoadWay());
        scheduleJob.setJobGroup(scheduleJobEntity.getJobGroup());
        scheduleJob.setJobStatus(scheduleJobEntity.getJobStatus());
        scheduleJob.setMethodName(scheduleJobEntity.getMethodName());
        scheduleJob.setMethodParams(scheduleJobEntity.getMethodParams());
        scheduleJob.setMisfirePolicy(scheduleJobEntity.getMisfirePolicy());
        scheduleJob.setExecuteClass(scheduleJobEntity.getExecuteClass());
        return scheduleJob;
    }
}
