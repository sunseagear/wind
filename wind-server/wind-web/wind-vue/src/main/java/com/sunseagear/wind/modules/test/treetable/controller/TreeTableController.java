package com.sunseagear.wind.modules.test.treetable.controller;

import com.sunseagear.common.http.Response;
import com.sunseagear.common.mvc.controller.BaseBeanController;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.common.helper.VueTreeHelper;
import com.sunseagear.wind.modules.test.treetable.entity.TreeTable;
import com.sunseagear.wind.modules.test.treetable.service.ITreeTableService;
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
 * @package test.treetable
 * @title: 树形结构表控制器
 * @description: 树形结构表控制器
 * @author: admin
 * @date: 2019-11-13 21:38:32
 * @copyright: www.sunseagear.com Inc. All rights reserved.
 */

@RestController
@RequestMapping("test/treetable/treetable")
@RequiresPermissions("test:treetable:treetable")
@Log(title = "树形结构表")
public class TreeTableController extends BaseBeanController<TreeTable> {

    @Autowired
    private ITreeTableService treeTableService;

    /**
     * 根据页码和每页记录数，以及查询条件动态加载数据
     *
     * @param request
     * @throws IOException
     */
    @PostMapping(value = "list")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("test:treetable:treetable:list")
    public String list(HttpServletRequest request) throws IOException {
        //加入条件
        QueryWrapper<TreeTable> entityWrapper = new QueryWrapper<>();
        entityWrapper.orderByDesc( "create_date");
        // 预处理
        List<TreeTable> treeNodeList = treeTableService.selectList(entityWrapper);
        List<TreeTable> vueTreeNodes = VueTreeHelper.create().sort(treeNodeList);
        return Response.successJson(vueTreeNodes);
    }

    @PostMapping("add")
    @Log(logType = LogType.INSERT)
    @RequiresPermissions("test:treetable:treetable:add")
    public String add(TreeTable entity, BindingResult result,
                      HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        treeTableService.insert(entity);
        return Response.ok("添加成功");
    }

    @PostMapping("update")
    @Log(logType = LogType.UPDATE)
    @RequiresPermissions("test:treetable:treetable:update")
    public String update(TreeTable entity, BindingResult result,
                         HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        treeTableService.insertOrUpdate(entity);
        return Response.ok("更新成功");
    }

    @PostMapping("delete/{id}")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("test:treetable:treetable:delete")
    public String delete(@PathVariable("id") String id) {
        treeTableService.deleteById(id);
        return Response.ok("删除成功");
    }

    @GetMapping("detail/{id}")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("test:treetable:treetable:detail")
    public String detail(@PathVariable("id") String id) {
        TreeTable treeTable = treeTableService.selectById(id);
        return Response.successJson(treeTable);
    }

    @PostMapping("batch/delete")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("test:treetable:treetable:delete")
    public String batchDelete(@RequestParam("ids") String[] ids) {
        List<Serializable> idList = java.util.Arrays.asList(ids);
        treeTableService.deleteBatchIds(idList);
        return Response.ok("删除成功");
    }
}
