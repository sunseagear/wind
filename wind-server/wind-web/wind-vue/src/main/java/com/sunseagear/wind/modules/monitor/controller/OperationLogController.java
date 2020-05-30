package com.sunseagear.wind.modules.monitor.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sunseagear.common.http.Response;
import com.sunseagear.common.mvc.controller.BaseBeanController;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sunseagear.common.tenant.TenantProperties;
import com.sunseagear.common.utils.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.modules.monitor.entity.OperationLog;
import com.sunseagear.wind.modules.monitor.service.IOperationLogService;
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
 * @package com.sunseagear.wind.modules.sys.controller
 * @title: 操作日志控制器
 * @description: 操作日志控制器 * @date: 2018-09-30 15:53:25
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */

@RestController
@RequestMapping("monitor/operation/log")
@RequiresPermissions("monitor:operation:log")
@Log(title = "操作日志")
public class OperationLogController extends BaseBeanController<OperationLog> {

    @Autowired
    private IOperationLogService operationLogService;

    static {
        TenantProperties.getInstance().getIgnoreTables().add("sys_operation_log");
    }
    /**
     * 根据页码和每页记录数，以及查询条件动态加载数据
     *
     * @param request
     * @throws IOException
     */
    @GetMapping(value = "list")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("monitor:operation:log:list")
    public String list(HttpServletRequest request) throws IOException {
        //加入条件
        QueryWrapper<OperationLog> entityWrapper = new QueryWrapper<>();
        entityWrapper.orderByDesc( "create_date");
        String operationIp = request.getParameter("operationIp");
        if (!StringUtils.isEmpty(operationIp)) {
            entityWrapper.eq("operation_ip", operationIp);
        }
        String requestUri = request.getParameter("requestUri");
        if (!StringUtils.isEmpty(requestUri)) {
            entityWrapper.like("request_uri", requestUri);
        }

        // 预处理
        Page pageBean = operationLogService.selectPage(PageRequest.getPage(), entityWrapper);
        return Response.successPageJson(pageBean);
    }

    @PostMapping("delete/{id}")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("monitor:operation:log:delete")
    public String delete(@PathVariable("id") String id) {
        operationLogService.deleteById(id);
        return Response.ok("删除成功");
    }

    @GetMapping("detail/{id}")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("monitor:operation:log:detail")
    public String detail(@PathVariable("id") String id) {
        OperationLog operationLog = operationLogService.selectById(id);
        return Response.successJson(operationLog);
    }

    @PostMapping("batch/delete")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("monitor:operation:log:delete")
    public String batchDelete(@RequestParam("ids") String[] ids) {
        List<Serializable> idList = java.util.Arrays.asList(ids);
        operationLogService.deleteBatchIds(idList);
        return Response.ok("删除成功");
    }
}
