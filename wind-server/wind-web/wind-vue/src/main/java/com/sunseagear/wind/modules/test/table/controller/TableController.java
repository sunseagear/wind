package com.sunseagear.wind.modules.test.table.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sunseagear.common.http.Response;
import com.sunseagear.common.mvc.controller.BaseBeanController;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.modules.test.table.entity.Table;
import com.sunseagear.wind.modules.test.table.service.ITableService;
import com.sunseagear.wind.utils.PageRequest;
import org.apache.commons.text.StringEscapeUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;
import java.util.Arrays;
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
@RequestMapping("test/table/table")
@RequiresPermissions("test:table:table")
@Log(title = "综合表格")
public class TableController extends BaseBeanController<Table> {

    @Autowired
    private ITableService tableService;

    /**
     * 根据页码和每页记录数，以及查询条件动态加载数据
     *
     * @param request
     * @throws IOException
     */
    @PostMapping(value = "list")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("test:table:table:list")
    public String list(HttpServletRequest request) throws IOException {
        //加入条件
        QueryWrapper<Table> entityWrapper = new QueryWrapper<>();
        entityWrapper.orderByDesc( "create_date");

        String title = request.getParameter("title");
        if (!StringUtils.isEmpty(title)) {
            entityWrapper.eq("title", title);
        }
        String level = request.getParameter("level");
        if (!StringUtils.isEmpty(title)) {
            entityWrapper.eq("level", level);
        }
        String type = request.getParameter("type");
        if (!StringUtils.isEmpty(type)) {
            entityWrapper.eq("type", type);
        }
        // 预处理
        Page pageBean = tableService.selectPage(PageRequest.getPage(), entityWrapper);
        return Response.successPageJson(pageBean, "content", false);
    }

    @PostMapping("add")
    @Log(logType = LogType.INSERT)
    @RequiresPermissions("test:table:table:add")
    public String add(Table entity, BindingResult result,
                      HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        tableService.insert(entity);
        return Response.ok("添加成功");
    }

    @PostMapping("update")
    @Log(logType = LogType.UPDATE)
    @RequiresPermissions("test:table:table:update")
    public String update(Table entity, BindingResult result,
                         HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        tableService.insertOrUpdate(entity);
        return Response.ok("更新成功");
    }

    @PostMapping("delete/{id}")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("test:table:table:delete")
    public String delete(@PathVariable("id") String id) {
        tableService.deleteById(id);
        return Response.ok("删除成功");
    }

    @GetMapping("detail/{id}")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("test:table:table:detail")
    public String detail(@PathVariable("id") String id) {
        Table tableEntity = tableService.selectById(id);
        tableEntity.setContent(StringEscapeUtils.unescapeHtml4(tableEntity.getContent()));
        return Response.successJson(tableEntity);
    }

    @PostMapping("batch/delete")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("test:table:table:delete")
    public String batchDelete(@RequestParam("ids") String[] ids) {
        List<Serializable> idList = Arrays.asList(ids);
        tableService.deleteBatchIds(idList);
        return Response.ok("删除成功");
    }
}
