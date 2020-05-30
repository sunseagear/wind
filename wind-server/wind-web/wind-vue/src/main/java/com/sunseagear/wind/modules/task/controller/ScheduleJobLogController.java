package com.sunseagear.wind.modules.task.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sunseagear.common.http.Response;
import com.sunseagear.common.mvc.controller.BaseBeanController;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.modules.task.entity.ScheduleJobLog;
import com.sunseagear.wind.modules.task.service.IScheduleJobLogService;
import com.sunseagear.wind.utils.PageRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.Serializable;
import java.util.List;


/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.task.controller
 * @title: 任务日志控制器
 * @description: 任务日志控制器 * @date: 2018-09-17 14:25:19
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */

@RestController
@RequestMapping("/task/schedule/job/log")
@RequiresPermissions("task:schedule:joblog")
@Log(title = "计划任务日志")
public class ScheduleJobLogController extends BaseBeanController<ScheduleJobLog> {

    @Autowired
    private IScheduleJobLogService scheduleJobLogService;

    @GetMapping(value = "list")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("task:schedule:joblog:list")
    public String list(HttpServletRequest request) throws IOException {
        //加入条件
        QueryWrapper<ScheduleJobLog> entityWrapper = new QueryWrapper<>();
        entityWrapper.orderByDesc( "create_time");
        String jobName = request.getParameter("jobName");
        if (!StringUtils.isEmpty(jobName)) {
            entityWrapper.like("job_name", jobName);
        }
        String executeClass = request.getParameter("executeClass");
        if (!StringUtils.isEmpty(executeClass)) {
            entityWrapper.eq("execute_class", executeClass);
        }
        String status = request.getParameter("status");
        if (!StringUtils.isEmpty(status)) {
            entityWrapper.eq("status", status);
        }
        // 预处理
        Page pageBean = scheduleJobLogService.selectPage(PageRequest.getPage(), entityWrapper);
        return Response.successPageJson(pageBean, "id,jobName,executeClass,jobGroup,methodName,methodParams,jobMessage,status,exceptionInfo,createTime");
    }

    @PostMapping("delete/{id}")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("task:schedule:joblog:delete")
    public String delete(@PathVariable("id") String id) {
        scheduleJobLogService.deleteById(id);
        return Response.ok("删除成功");
    }

    @PostMapping("batch/delete")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("task:schedule:joblog:delete")
    public String batchDelete(@RequestParam("ids") String[] ids) {
        List<Serializable> idList = java.util.Arrays.asList(ids);
        scheduleJobLogService.deleteBatchIds(idList);
        return Response.ok("删除成功");
    }
}
