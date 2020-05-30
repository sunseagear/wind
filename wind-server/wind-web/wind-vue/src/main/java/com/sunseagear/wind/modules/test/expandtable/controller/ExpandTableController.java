package com.sunseagear.wind.modules.test.expandtable.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sunseagear.common.http.Response;
import com.sunseagear.common.mvc.controller.BaseBeanController;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.modules.test.expandtable.entity.ExpandTable;
import com.sunseagear.wind.modules.test.expandtable.service.IExpandTableService;
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
 * @package test.expandtable
 * @title: 商品信息控制器
 * @description: 商品信息控制器
 * @author: admin
 * @date: 2019-11-13 15:02:00
 * @copyright: www.sunseagear.com Inc. All rights reserved.
 */

@RestController
@RequestMapping("test/expandtable/expandtable")
@RequiresPermissions("test:expandtable:expandtable")
@Log(title = "商品信息")
public class ExpandTableController extends BaseBeanController<ExpandTable> {

    @Autowired
    private IExpandTableService expandTableService;

    /**
     * 根据页码和每页记录数，以及查询条件动态加载数据
     *
     * @param request
     * @throws IOException
     */
    @PostMapping(value = "list")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("test:expandtable:expandtable:list")
    public String list(HttpServletRequest request) throws IOException {
        //加入条件
        QueryWrapper<ExpandTable> entityWrapper = new QueryWrapper<>();
        entityWrapper.orderByDesc( "create_date");
        // 预处理
        Page pageBean = expandTableService.selectPage(PageRequest.getPage(), entityWrapper);
        return Response.successPageJson(pageBean);
    }

    @PostMapping("add")
    @Log(logType = LogType.INSERT)
    @RequiresPermissions("test:expandtable:expandtable:add")
    public String add(ExpandTable entity, BindingResult result,
                      HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        expandTableService.insert(entity);
        return Response.ok("添加成功");
    }

    @PostMapping("update")
    @Log(logType = LogType.UPDATE)
    @RequiresPermissions("test:expandtable:expandtable:update")
    public String update(ExpandTable entity, BindingResult result,
                         HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        expandTableService.insertOrUpdate(entity);
        return Response.ok("更新成功");
    }

    @PostMapping("delete/{id}")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("test:expandtable:expandtable:delete")
    public String delete(@PathVariable("id") String id) {
        expandTableService.deleteById(id);
        return Response.ok("删除成功");
    }

    @GetMapping("detail/{id}")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("test:expandtable:expandtable:detail")
    public String detail(@PathVariable("id") String id) {
        ExpandTable expandTable = expandTableService.selectById(id);
        return Response.successJson(expandTable);
    }

    @PostMapping("batch/delete")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("test:expandtable:expandtable:delete")
    public String batchDelete(@RequestParam("ids") String[] ids) {
        List<Serializable> idList = java.util.Arrays.asList(ids);
        expandTableService.deleteBatchIds(idList);
        return Response.ok("删除成功");
    }
}
