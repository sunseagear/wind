package com.sunseagear.wind.modules.sys.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sunseagear.common.http.Response;
import com.sunseagear.common.mvc.controller.BaseBeanController;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.modules.sys.entity.DataRule;
import com.sunseagear.wind.modules.sys.service.IDataRuleService;
import com.sunseagear.wind.utils.PageRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;
import java.util.List;


/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package sys
 * @title: 数据权限表控制器
 * @description: 数据权限表控制器
 * @author: 未知
 * @date: 2019-11-29 06:05:01
 * @copyright: www.sunseagear.com Inc. All rights reserved.
 */

@RestController
@RequestMapping("sys/datarule")
@RequiresPermissions("sys:datarule")
@Log(title = "数据权限表")
public class DataRuleController extends BaseBeanController<DataRule> {

    @Autowired
    private IDataRuleService dataRuleService;

    /**
     * 根据页码和每页记录数，以及查询条件动态加载数据
     *
     * @param request
     * @throws IOException
     */
    @PostMapping(value = "list")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("sys:datarule:list")
    public String list(HttpServletRequest request) throws IOException {
        //加入条件
        QueryWrapper<DataRule> entityWrapper = new QueryWrapper<>();
        entityWrapper.orderByDesc( "create_date");
        String resourceCode = request.getParameter("resourceCode");
        if (!StringUtils.isEmpty(resourceCode)) {
            entityWrapper.eq("resource_code", resourceCode);
        }
        String scopeName = request.getParameter("scopeName");
        if (!StringUtils.isEmpty(scopeName)) {
            entityWrapper.eq("scope_name", scopeName);
        }
        // 预处理
        Page pageBean = dataRuleService.selectPage(PageRequest.getPage(), entityWrapper);
        return Response.successPageJson(pageBean, "scopeValue", false);
    }

    @PostMapping("add")
    @Log(logType = LogType.INSERT)
    @RequiresPermissions("sys:datarule:add")
    public String add(DataRule entity, BindingResult result,
                      HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        dataRuleService.insert(entity);
        return Response.ok("添加成功");
    }

    @PostMapping("update")
    @Log(logType = LogType.UPDATE)
    @RequiresPermissions("sys:datarule:update")
    public String update(DataRule entity, BindingResult result,
                         HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        dataRuleService.insertOrUpdate(entity);
        return Response.ok("更新成功");
    }

    @PostMapping("delete/{id}")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("sys:datarule:delete")
    public String delete(@PathVariable("id") String id) {
        dataRuleService.deleteById(id);
        return Response.ok("删除成功");
    }

    @GetMapping("detail/{id}")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("sys:datarule:detail")
    public String detail(@PathVariable("id") String id) {
        DataRule dataRule = dataRuleService.selectById(id);
        return Response.successJson(dataRule);
    }

    @PostMapping("batch/delete")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("sys:datarule:delete")
    public String batchDelete(@RequestParam("ids") String[] ids) {
        List<Serializable> idList = java.util.Arrays.asList(ids);
        dataRuleService.deleteBatchIds(idList);
        return Response.ok("删除成功");
    }
}
