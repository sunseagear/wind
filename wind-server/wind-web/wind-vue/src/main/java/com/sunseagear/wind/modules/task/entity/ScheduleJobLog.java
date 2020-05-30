package com.sunseagear.wind.modules.task.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.sunseagear.common.mvc.entity.AbstractEntity;

import java.util.Date;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.task.entity
 * @title: 任务日志实体
 * @description: 任务日志实体 * @date: 2018-09-17 14:25:19
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */

@TableName("task_schedule_job_log")
@SuppressWarnings("serial")
public class ScheduleJobLog extends AbstractEntity<String> {

    public static final String SCHEDULE_JOB_LOG_RUN_SUCCESS = "1";

    public static final String SCHEDULE_JOB_LOG_RUN_NOMAL = "0";

    public static final String SCHEDULE_JOB_LOG_RUN_FAIL = "-1";
    /**
     * 任务日志ID
     */
    @TableId(value = "id", type = IdType.UUID)
    private String id;
    /**
     * 任务名称
     */
    @TableField(value = "job_name")
    private String jobName;
    /**
     * 任务组名
     */
    @TableField(value = "job_group")
    private String jobGroup;
    /**
     * Spring bean
     */
    @TableField(value = "execute_class")
    private String executeClass;
    /**
     * 任务方法
     */
    @TableField(value = "method_name")
    private String methodName;
    /**
     * 方法参数
     */
    @TableField(value = "method_params")
    private String methodParams;
    /**
     * 日志信息
     */
    @TableField(value = "job_message")
    private String jobMessage;
    /**
     * 执行状态（0正常 1失败）
     */
    @TableField(value = "status")
    private String status;
    /**
     * 异常信息
     */
    @TableField(value = "exception_info")
    private String exceptionInfo;
    /**
     * 创建时间
     */
    @TableField(value = "create_time")
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /**
     * 获取  id
     *
     * @return String  任务日志ID
     */
    public String getId() {
        return this.id;
    }

    /**
     * 设置  id
     *
     * @param id 任务日志ID
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 获取  jobName
     *
     * @return String  任务名称
     */
    public String getJobName() {
        return this.jobName;
    }

    /**
     * 设置  jobName
     *
     * @param jobName 任务名称
     */
    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    /**
     * 获取  jobGroup
     *
     * @return String  任务组名
     */
    public String getJobGroup() {
        return this.jobGroup;
    }

    /**
     * 设置  jobGroup
     *
     * @param jobGroup 任务组名
     */
    public void setJobGroup(String jobGroup) {
        this.jobGroup = jobGroup;
    }

    public String getExecuteClass() {
        return executeClass;
    }

    public void setExecuteClass(String executeClass) {
        this.executeClass = executeClass;
    }

    /**
     * 获取  methodName
     *
     * @return String  任务方法
     */
    public String getMethodName() {
        return this.methodName;
    }

    /**
     * 设置  methodName
     *
     * @param methodName 任务方法
     */
    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    /**
     * 获取  methodParams
     *
     * @return String  方法参数
     */
    public String getMethodParams() {
        return this.methodParams;
    }

    /**
     * 设置  methodParams
     *
     * @param methodParams 方法参数
     */
    public void setMethodParams(String methodParams) {
        this.methodParams = methodParams;
    }

    /**
     * 获取  jobMessage
     *
     * @return String  日志信息
     */
    public String getJobMessage() {
        return this.jobMessage;
    }

    /**
     * 设置  jobMessage
     *
     * @param jobMessage 日志信息
     */
    public void setJobMessage(String jobMessage) {
        this.jobMessage = jobMessage;
    }

    /**
     * 获取  status
     *
     * @return String  执行状态（0正常 1失败）
     */
    public String getStatus() {
        return this.status;
    }

    /**
     * 设置  status
     *
     * @param status 执行状态（0正常 1失败）
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 获取  exceptionInfo
     *
     * @return String  异常信息
     */
    public String getExceptionInfo() {
        return this.exceptionInfo;
    }

    /**
     * 设置  exceptionInfo
     *
     * @param exceptionInfo 异常信息
     */
    public void setExceptionInfo(String exceptionInfo) {
        this.exceptionInfo = exceptionInfo;
    }

    /**
     * 获取  createTime
     *
     * @return Date  创建时间
     */
    public Date getCreateTime() {
        return this.createTime;
    }

    /**
     * 设置  createTime
     *
     * @param createTime 创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}
