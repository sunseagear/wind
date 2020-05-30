package com.sunseagear.wind.modules.task.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.sunseagear.common.mvc.entity.AbstractEntity;

import java.util.Date;

/**
 * @version V1.0
 * @Title: 任务
 * @Description: 任务
 * @date 2017-05-09 23:22:51
 */
@TableName("task_schedule_job")
public class ScheduleJob extends AbstractEntity<String> {

    /**
     * 任务主键
     */
    @TableId(value = "id", type = IdType.UUID)
    private String id;
    /**
     * 任务名
     */
    @TableField(value = "job_name")
    private String jobName;
    /**
     * cron表达式
     */
    @TableField(value = "cron_expression")
    private String cronExpression;
    /**
     * Spring bean
     */
    @TableField(value = "execute_class")
    private String executeClass;
    /**
     * 任务调用的方法名
     */
    @TableField(value = "method_name")
    private String methodName;

    /**
     * 任务调用的参数
     */
    @TableField(value = "method_params")
    private String methodParams;
    /**
     * 执行策略
     */
    @TableField(value = "misfire_policy")
    private String misfirePolicy;

    @TableField(value = "load_way")
    private String loadWay;
    /**
     * 任务是否有状态
     */
    @TableField(value = "is_concurrent")
    private String isConcurrent;
    /**
     * 任务描述
     */
    @TableField(value = "description")
    private String description;
    /**
     * 更新者
     */
    @TableField(value = "update_by")
    private String updateBy;
    /**
     * 创建时间
     */
    @TableField(value = "create_date")
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date createDate;
    /**
     * 任务状态
     */
    @TableField(value = "job_status")
    private String jobStatus;
    /**
     * 任务分组
     */
    @TableField(value = "job_group")
    private String jobGroup;
    /**
     * 更新时间
     */
    @TableField(value = "update_date")
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date updateDate;
    /**
     * 创建者
     */
    @TableField(value = "create_by")
    private String createBy;

    public String getMethodParams() {
        return methodParams;
    }

    public void setMethodParams(String methodParams) {
        this.methodParams = methodParams;
    }

    public String getMisfirePolicy() {
        return misfirePolicy;
    }

    public void setMisfirePolicy(String misfirePolicy) {
        this.misfirePolicy = misfirePolicy;
    }

    /**
     * 获取 cronExpression
     *
     * @return: String cron表达式
     */
    public String getCronExpression() {
        return this.cronExpression;
    }

    /**
     * 设置 cronExpression
     *
     * @param: cronExpression
     * cron表达式
     */
    public void setCronExpression(String cronExpression) {
        this.cronExpression = cronExpression;
    }

    /**
     * 获取 methodName
     *
     * @return: String 任务调用的方法名
     */
    public String getMethodName() {
        return this.methodName;
    }

    /**
     * 设置 methodName
     *
     * @param: methodName
     * 任务调用的方法名
     */
    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    public String getLoadWay() {
        return loadWay;
    }

    public void setLoadWay(String loadWay) {
        this.loadWay = loadWay;
    }

    /**
     * 获取 isConcurrent
     *
     * @return: String 任务是否有状态
     */
    public String getIsConcurrent() {
        return this.isConcurrent;
    }

    /**
     * 设置 isConcurrent
     *
     * @param: isConcurrent
     * 任务是否有状态
     */
    public void setIsConcurrent(String isConcurrent) {
        this.isConcurrent = isConcurrent;
    }

    /**
     * 获取 description
     *
     * @return: String 任务描述
     */
    public String getDescription() {
        return this.description;
    }

    /**
     * 设置 description
     *
     * @param: description
     * 任务描述
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * 获取 id
     *
     * @return: String 任务主键
     */
    public String getId() {
        return this.id;
    }

    /**
     * 设置 id
     *
     * @param: id
     * 任务主键
     */
    public void setId(String id) {
        this.id = id;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public String getExecuteClass() {
        return executeClass;
    }

    public void setExecuteClass(String executeClass) {
        this.executeClass = executeClass;
    }

    /**
     * 获取 createDate
     *
     * @return: Date 创建时间
     */
    public Date getCreateDate() {
        return this.createDate;
    }

    /**
     * 设置 createDate
     *
     * @param: createDate
     * 创建时间
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * 获取 jobStatus
     *
     * @return: String 任务状态
     */
    public String getJobStatus() {
        return this.jobStatus;
    }

    /**
     * 设置 jobStatus
     *
     * @param: jobStatus
     * 任务状态
     */
    public void setJobStatus(String jobStatus) {
        this.jobStatus = jobStatus;
    }

    /**
     * 获取 jobGroup
     *
     * @return: String 任务分组
     */
    public String getJobGroup() {
        return this.jobGroup;
    }

    /**
     * 设置 jobGroup
     *
     * @param: jobGroup
     * 任务分组
     */
    public void setJobGroup(String jobGroup) {
        this.jobGroup = jobGroup;
    }

    /**
     * 获取 updateDate
     *
     * @return: Date 更新时间
     */
    public Date getUpdateDate() {
        return this.updateDate;
    }

    /**
     * 设置 updateDate
     *
     * @param: updateDate
     * 更新时间
     */
    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }


    /**
     * 获取 jobName
     *
     * @return: String 任务名
     */
    public String getJobName() {
        return this.jobName;
    }

    /**
     * 设置 jobName
     *
     * @param: jobName
     * 任务名
     */
    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

}
