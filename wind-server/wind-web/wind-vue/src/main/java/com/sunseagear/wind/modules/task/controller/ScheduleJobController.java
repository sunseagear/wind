package com.sunseagear.wind.modules.task.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sunseagear.common.http.Response;
import com.sunseagear.common.mvc.controller.BaseBeanController;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.sunseagear.common.utils.BeanUtils;
import com.sunseagear.common.utils.ObjectUtils;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.modules.task.entity.ScheduleJob;
import com.sunseagear.wind.modules.task.service.IScheduleJobService;
import com.sunseagear.wind.utils.PageRequest;
import org.quartz.CronExpression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;
import java.util.List;


@RestController
@RequestMapping("/task/schedule/job")
@RequiresPermissions("task:schedule:job")
@Log(title = "计划任务")
public class ScheduleJobController extends BaseBeanController<ScheduleJob> {

    @Autowired
    private IScheduleJobService scheduleJobService;


    @GetMapping(value = "list")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("task:schedule:job:list")
    public String list(HttpServletRequest request) throws IOException {
        //加入条件
        QueryWrapper<ScheduleJob> entityWrapper = new QueryWrapper<>();
        entityWrapper.orderByDesc( "create_date");
        String jobName = request.getParameter("jobName");
        if (!StringUtils.isEmpty(jobName)) {
            entityWrapper.like("job_name", jobName);
        }
        // 预处理
        Page pageBean = scheduleJobService.selectPage(PageRequest.getPage(), entityWrapper);
        return Response.successPageJson(pageBean, "id,jobName,cronExpression,executeClass,methodName,methodParams,misfirePolicy,loadWay,isConcurrent,description,jobStatus,jobGroup");
    }

    @PostMapping("add")
    @Log(logType = LogType.INSERT)
    @RequiresPermissions("task:schedule:job:add")
    public String add(ScheduleJob entity, BindingResult result,
                      HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        if (!CronExpression.isValidExpression(entity.getCronExpression())) {
            return Response.error("cron表达式格式不对");
        }
        scheduleJobService.insert(entity);
        return Response.ok("添加成功");
    }

    @PostMapping("update")
    @Log(logType = LogType.UPDATE)
    @RequiresPermissions("task:schedule:job:update")
    public String update(ScheduleJob entity, BindingResult result,
                         HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        if (!CronExpression.isValidExpression(entity.getCronExpression())) {
            return Response.error("cron表达式格式不对");
        }
        scheduleJobService.insertOrUpdate(entity);
        return Response.ok("更新成功");
    }

    @PostMapping("delete/{id}")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("task:schedule:job:delete")
    public String delete(@PathVariable("id") String id) {
        scheduleJobService.deleteById(id);
        return Response.ok("删除成功");
    }

    @PostMapping(value = "/saveScheduleJob")
    public String saveScheduleJob(ScheduleJob scheduleJob, HttpServletRequest request, HttpServletResponse response) {
        if (!CronExpression.isValidExpression(scheduleJob.getCronExpression())) {
            return Response.error("cron表达式格式不对");
        }
        try {
            if (ObjectUtils.isNullOrEmpty(scheduleJob.getId())) {
                scheduleJobService.insert(scheduleJob);
            } else {
                // FORM NULL不更新
                ScheduleJob oldEntity = scheduleJobService.selectById(scheduleJob.getId());
                BeanUtils.copyProperties(scheduleJob, oldEntity);
                scheduleJobService.insertOrUpdate(oldEntity);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Response.error("保存失败" + e.getMessage());
        }
        return Response.ok("保存成功");
    }

    @PostMapping("batch/delete")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("task:schedule:job:delete")
    public String batchDelete(@RequestParam("ids") String[] ids) {
        List<Serializable> idList = java.util.Arrays.asList(ids);
        scheduleJobService.deleteBatchIds(idList);
        return Response.ok("删除成功");
    }

    @PostMapping(value = "{id}/changeJobStatus")
    @Log(logType = LogType.OTHER, title = "任务状态")
    @RequiresPermissions("task:schedule:job:change:job:status")
    public String changeJobStatus(@PathVariable("id") String id, HttpServletRequest request,
                                  HttpServletResponse response) {
        String cmd = request.getParameter("cmd");
        String label = "停止";
        if (cmd.equals("start")) {
            label = "启动";
        } else {
            label = "停止";
        }
        try {
            scheduleJobService.changeStatus(id, cmd);
        } catch (Exception e) {
            e.printStackTrace();
            return Response.error("任务" + label + "失败" + e.getMessage());
        }
        return Response.ok("任务" + label + "成功");
    }

    @PostMapping(value = "{id}/updateCron")
    @Log(logType = LogType.OTHER, title = "任务更新")
    @RequiresPermissions("task:schedule:job:update:cron")
    public String updateCron(@PathVariable("id") String id) {
        scheduleJobService.updateCron(id);
        return Response.ok("任务更新成功");
    }

    @PostMapping(value = "/runAJobNow")
    @Log(logType = LogType.OTHER, title = "执行一次")
    @RequiresPermissions("task:schedule:job:change:job:status")
    public String runAJobNow(ScheduleJob scheduleJob, HttpServletRequest request,
                             HttpServletResponse response) {
        scheduleJobService.runAJobNow(scheduleJob.getId());
        return Response.ok("任务启动成功");
    }

    /**
     * 刷新任务
     *
     * @return
     */
    @PostMapping(value = "/refreshJob")
    @Log(logType = LogType.OTHER, title = "刷新任务")
    @RequiresPermissions("task:schedule:job:refresh:job")
    public String refreshJob() {
        scheduleJobService.refreshTask();
        return Response.ok("刷新任务成功");
    }
}
