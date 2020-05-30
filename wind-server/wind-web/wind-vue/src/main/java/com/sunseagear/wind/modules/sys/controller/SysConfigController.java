package com.sunseagear.wind.modules.sys.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sunseagear.common.http.Response;
import com.sunseagear.common.mvc.controller.BaseBeanController;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.common.helper.SysConfigHelper;
import com.sunseagear.wind.modules.sys.entity.SysConfig;
import com.sunseagear.wind.modules.sys.service.ISysConfigService;
import com.sunseagear.wind.utils.PageRequest;
import com.sunseagear.wind.utils.UserUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.sys.controller
 * @title: 消息模版控制器
 * @description: 消息模版控制器 * @date: 2018-09-03 15:10:10
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */

@RestController
@RequestMapping("/sys/config")
@RequiresPermissions("sys:config")
@Log(title = "系统配置")
public class SysConfigController extends BaseBeanController<SysConfig> {
    @Autowired
    private ISysConfigService sysConfigService;

    @PostMapping(value = "list")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("sys:config:list")
    public String list(HttpServletRequest request) throws IOException {
        //加入条件
        QueryWrapper<SysConfig> entityWrapper = new QueryWrapper<>();
        entityWrapper.eq("tenant_id", UserUtils.getTenantId());
        entityWrapper.orderByDesc( "create_date");
        String code = request.getParameter("code");
        if (!StringUtils.isEmpty(code)) {
            entityWrapper.eq("code", code);
        }
        String name = request.getParameter("name");
        if (!StringUtils.isEmpty(name)) {
            entityWrapper.eq("name", name);
        }
        // 预处理
        Page pageBean = sysConfigService.selectPage(PageRequest.getPage(), entityWrapper);
        return Response.successPageJson(pageBean);
    }

    @PostMapping("add")
    @Log(logType = LogType.INSERT)
    @RequiresPermissions("sys:config:add")
    public String add(SysConfig entity, BindingResult result,
                      HttpServletRequest request, HttpServletResponse response) {
        int count = sysConfigService.selectCount(new QueryWrapper<SysConfig>().
                nested(i -> i.eq("name", entity.getName()).or().eq("code", entity.getName()))
                .eq("tenant_id",UserUtils.getTenantId()));
        if (count > 0) {
            return Response.failJson("名称和编码不能重复");
        }
        // 验证错误
        this.checkError(entity, result);
        entity.setTenantId(UserUtils.getTenantId());
        sysConfigService.insert(entity);
        SysConfigHelper.getInstance().update(UserUtils.getTenantId());
        return Response.ok("添加成功");
    }

    @PostMapping("update")
    @Log(logType = LogType.UPDATE)
    @RequiresPermissions("sys:config:update")
    public String update(SysConfig entity, BindingResult result,
                         HttpServletRequest request, HttpServletResponse response) {
        int count = sysConfigService.selectCount(new QueryWrapper<SysConfig>()
                .nested(i -> i.eq("name", entity.getName()).or().eq("code", entity.getName()))
                .eq("tenant_id",UserUtils.getTenantId())
                .ne("id", entity.getId()));
        if (count > 0) {
            return Response.failJson("名称和编码不能重复");
        }
        // 验证错误
        this.checkError(entity, result);
        sysConfigService.insertOrUpdate(entity);
        SysConfigHelper.getInstance().update(UserUtils.getTenantId());
        return Response.ok("更新成功");
    }


    @PostMapping("delete/{id}")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("sys:config:delete")
    public String delete(@PathVariable("id") String id) {
        sysConfigService.deleteById(id);
        SysConfigHelper.getInstance().update(UserUtils.getTenantId());
        return Response.ok("删除成功");
    }

    @GetMapping("detail/{id}")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("sys:config:detail")
    public String detail(@PathVariable("id") String id) {
        SysConfig tenant = sysConfigService.selectById(id);
        SysConfigHelper.getInstance().update(UserUtils.getTenantId());
        return Response.successJson(tenant);
    }


}
