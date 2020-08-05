package com.sunseagear.wind.modules.sys.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sunseagear.common.http.Response;
import com.sunseagear.common.mvc.controller.BaseBeanController;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.modules.sys.entity.Tenant;
import com.sunseagear.wind.modules.sys.service.ITenantService;
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
 * @title: 租户管理控制器
 * @description: 租户管理控制器
 * @author: 未知
 * @date: 2019-11-28 06:24:52
 * @copyright: www.sunseagear.com Inc. All rights reserved.
 */

@RestController
@RequestMapping("sys/tenant")
@RequiresPermissions("sys:tenant")
@Log(title = "租户管理")
public class TenantController extends BaseBeanController<Tenant> {

    @Autowired
    private ITenantService tenantService;

    /**
     * 根据页码和每页记录数，以及查询条件动态加载数据
     *
     * @param request
     * @throws IOException
     */
    @PostMapping(value = "list")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("sys:tenant:list")
    public String list(HttpServletRequest request) throws IOException {
        //加入条件
        QueryWrapper<Tenant> entityWrapper = new QueryWrapper<>();
        entityWrapper.orderByDesc( "a.create_date");
        String tenantId = request.getParameter("tenantId");
        if (!StringUtils.isEmpty(tenantId)) {
            entityWrapper.eq("tenant_id", tenantId);
        }
        String contact = request.getParameter("contact");
        if (!StringUtils.isEmpty(contact)) {
            entityWrapper.eq("contact", contact);
        }
        String phone = request.getParameter("phone");
        if (!StringUtils.isEmpty(phone)) {
            entityWrapper.eq("phone", phone);
        }
        String name = request.getParameter("name");
        if (!StringUtils.isEmpty(name)) {
            entityWrapper.eq("name", name);
        }
        // 预处理
        Page pageBean = tenantService.selectPage(PageRequest.getPage(), entityWrapper);
        return Response.successPageJson(pageBean, "remarks", false);
    }

    @PostMapping("add")
    @Log(logType = LogType.INSERT)
    @RequiresPermissions("sys:tenant:add")
    public String add(Tenant entity, BindingResult result,
                      HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        entity.setTenantId(StringUtils.randomNumber(8));
        tenantService.insert(entity);
        return Response.ok("添加成功");
    }

    @PostMapping("update")
    @Log(logType = LogType.UPDATE)
    @RequiresPermissions("sys:tenant:update")
    public String update(Tenant entity, BindingResult result,
                         HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        tenantService.insertOrUpdate(entity);
        return Response.ok("更新成功");
    }

    @PostMapping("delete/{id}")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("sys:tenant:delete")
    public String delete(@PathVariable("id") String id) {
        tenantService.deleteById(id);
        return Response.ok("删除成功");
    }

    @GetMapping("detail/{id}")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("sys:tenant:detail")
    public String detail(@PathVariable("id") String id) {
        Tenant tenant = tenantService.selectById(id);
        return Response.successJson(tenant);
    }

    @PostMapping("batch/delete")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("sys:tenant:delete")
    public String batchDelete(@RequestParam("ids") String[] ids) {
        List<Serializable> idList = java.util.Arrays.asList(ids);
        tenantService.deleteBatchIds(idList);
        return Response.ok("删除成功");
    }
}
