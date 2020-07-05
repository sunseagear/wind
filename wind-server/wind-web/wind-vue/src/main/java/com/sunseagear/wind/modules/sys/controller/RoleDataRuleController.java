package com.sunseagear.wind.modules.sys.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sunseagear.common.datarule.handler.DataRuleHandler;
import com.sunseagear.common.http.Response;
import com.sunseagear.common.mvc.controller.BaseBeanController;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.modules.sys.entity.DataRule;
import com.sunseagear.wind.modules.sys.entity.RoleDataRule;
import com.sunseagear.wind.modules.sys.service.IDataRuleService;
import com.sunseagear.wind.modules.sys.service.IRoleDataRuleService;
import com.sunseagear.wind.utils.PageRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package sys
 * @title: 角色数据权限关联表控制器
 * @description: 角色数据权限关联表控制器
 * @author: 未知
 * @date: 2019-12-03 13:03:38
 * @copyright: www.sunseagear.com Inc. All rights reserved.
 */

@RestController
@RequestMapping("sys/roledatarule")
@RequiresPermissions("sys:datarule")
@Log(title = "角色数据权限关联表")
public class RoleDataRuleController extends BaseBeanController<RoleDataRule> {

    @Autowired
    private IRoleDataRuleService roleDataRuleService;
    @Autowired
    private IDataRuleService dataRuleService;
    @Autowired
    private DataRuleHandler dataRuleHandler;

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
        QueryWrapper<RoleDataRule> roleDataRuleEntityWrapper = new QueryWrapper<>();
        String roleId = request.getParameter("roleId");
        roleDataRuleEntityWrapper.eq("role_id", roleId);
        // 预处理
        List<RoleDataRule> list = roleDataRuleService.selectList(roleDataRuleEntityWrapper);

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
        Page<DataRule> pageBean = dataRuleService.selectPage(PageRequest.getPage(), entityWrapper);
        pageBean.getRecords().forEach(item -> {
            list.forEach(roleDataRule -> {
                if (item.getId().equals(roleDataRule.getScopeId())) {
                    item.setSelect(true);
                }
            });
        });
        return Response.successPageJson(pageBean, "scopeValue", false);
    }

    @PostMapping("add")
    @Log(logType = LogType.INSERT)
    @RequiresPermissions("sys:datarule:add")
    public String add(RoleDataRule entity, BindingResult result,
                      HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        roleDataRuleService.insert(entity);
        return Response.ok("添加成功");
    }

    @PostMapping("update")
    @Log(logType = LogType.UPDATE)
    @RequiresPermissions("sys:datarule:update")
    public String update(RoleDataRule entity, BindingResult result,
                         HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        roleDataRuleService.insertOrUpdate(entity);
        return Response.ok("更新成功");
    }

    @PostMapping("updateRules")
    @Log(logType = LogType.UPDATE)
    @RequiresPermissions("sys:datarule:update")
    public String update(String roleId, String[] ids) {
        QueryWrapper<RoleDataRule> roleDataRuleEntityWrapper = new QueryWrapper<>();
        roleDataRuleEntityWrapper.eq("role_id", roleId);
        roleDataRuleService.remove(roleDataRuleEntityWrapper);
        if (ids == null) {
            return Response.ok("更新成功");
        }
        List<String> idList = java.util.Arrays.asList(ids);
        List<RoleDataRule> roleDataRuleList = new ArrayList<>();
        idList.forEach(item -> {
            RoleDataRule roleDataRule = new RoleDataRule();
            roleDataRule.setRoleId(roleId);
            roleDataRule.setScopeId(item);
            roleDataRuleList.add(roleDataRule);
        });
        roleDataRuleService.insertBatch(roleDataRuleList);
        dataRuleHandler.refreshRole();
        return Response.ok("更新成功");
    }

    @PostMapping("delete/{id}")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("sys:datarule:delete")
    public String delete(@PathVariable("id") String id) {
        roleDataRuleService.deleteById(id);
        return Response.ok("删除成功");
    }

    @GetMapping("detail/{id}")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("sys:datarule:detail")
    public String detail(@PathVariable("id") String id) {
        RoleDataRule roleDataRule = roleDataRuleService.selectById(id);
        return Response.successJson(roleDataRule);
    }

    @PostMapping("batch/delete")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("sys:datarule:delete")
    public String batchDelete(@RequestParam("ids") String[] ids) {
        List<Serializable> idList = java.util.Arrays.asList(ids);
        roleDataRuleService.deleteBatchIds(idList);
        return Response.ok("删除成功");
    }
}
