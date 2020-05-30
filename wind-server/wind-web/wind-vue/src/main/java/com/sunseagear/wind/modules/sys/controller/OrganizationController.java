package com.sunseagear.wind.modules.sys.controller;

import com.sunseagear.common.http.Response;
import com.sunseagear.common.mvc.controller.BaseBeanController;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.common.helper.VueTreeHelper;
import com.sunseagear.wind.modules.sys.entity.Organization;
import com.sunseagear.wind.modules.sys.service.IOrganizationService;
import com.sunseagear.wind.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;
import java.util.List;


@RestController
@RequestMapping("/sys/organization")
@RequiresPermissions("sys:organization")
@Log(title = "部门管理")
public class OrganizationController extends BaseBeanController<Organization> {

    @Autowired
    private IOrganizationService organizationService;


    /**
     * 根据页码和每页记录数，以及查询条件动态加载数据
     *
     * @param request
     * @param response
     * @throws IOException
     */
    @GetMapping(value = "list")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("sys:organization:list")
    public String list(HttpServletRequest request,
                       HttpServletResponse response) throws IOException {
        QueryWrapper<Organization> entityWrapper = new QueryWrapper<Organization>();
        entityWrapper.eq("tenant_id", UserUtils.getTenantId());
        //加入条件
        String keyword = request.getParameter("keyword");
        if (!StringUtils.isEmpty(keyword)) {
            entityWrapper.like("name", keyword);
        }
        List<Organization> treeNodeList = organizationService.selectList(entityWrapper);
        List<Organization> vueTreeNodes = VueTreeHelper.create().sort(treeNodeList);
        return Response.successJson(vueTreeNodes);
    }

    @PostMapping("add")
    @Log(logType = LogType.INSERT)
    @RequiresPermissions("sys:organization:add")
    public String add(Organization entity, BindingResult result,
                      HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        entity.setTenantId(UserUtils.getTenantId());
        organizationService.insert(entity);
        return Response.ok("添加成功");
    }


    @PostMapping("update")
    @Log(logType = LogType.UPDATE)
    @RequiresPermissions("sys:organization:update")
    public String update(Organization entity, BindingResult result,
                         HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        organizationService.insertOrUpdate(entity);
        return Response.ok("更新成功");
    }

    @PostMapping("delete/{id}")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("sys:organization:delete")
    public String delete(@PathVariable("id") String id) {
        organizationService.deleteById(id);
        return Response.ok("删除成功");
    }

    @PostMapping("batch/delete")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("sys:organization:delete")
    public String batchDelete(@RequestParam("ids") String[] ids) {
        List<Serializable> idList = java.util.Arrays.asList(ids);
        organizationService.deleteBatchIds(idList);
        return Response.ok("删除成功");
    }
}
