package com.sunseagear.wind.modules.sys.controller;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.TemplateExportParams;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sunseagear.common.http.DuplicateValid;
import com.sunseagear.common.http.Response;
import com.sunseagear.common.http.ValidResponse;
import com.sunseagear.common.mvc.controller.BaseBeanController;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.sunseagear.common.utils.DateUtils;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.common.response.ResponseError;
import com.sunseagear.wind.modules.sys.entity.User;
import com.sunseagear.wind.modules.sys.entity.UserRole;
import com.sunseagear.wind.modules.sys.service.IOrganizationService;
import com.sunseagear.wind.modules.sys.service.IRoleService;
import com.sunseagear.wind.modules.sys.service.IUserRoleService;
import com.sunseagear.wind.modules.sys.service.IUserService;
import com.sunseagear.wind.utils.PageRequest;
import com.sunseagear.wind.utils.UserUtils;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


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
@RequestMapping("/sys/user")
@RequiresPermissions("sys:user")
@Log(title = "用户管理")
public class UserController extends BaseBeanController<User> {
    @Autowired
    private IUserService userService;

    @Autowired
    private IUserRoleService userRoleService;

    @Autowired
    private IRoleService roleService;
    @Autowired
    private IOrganizationService organizationService;

    /**
     * 根据页码和每页记录数，以及查询条件动态加载数据
     *
     * @param request
     * @throws IOException
     */
    @RequestMapping(value = "list", method = {RequestMethod.GET, RequestMethod.POST})
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("sys:user:list")
    public String list(HttpServletRequest request) throws IOException {
        QueryWrapper<User> entityWrapper = new QueryWrapper<>();
        entityWrapper.eq("t.tenant_id", UserUtils.getTenantId());
        String realname = request.getParameter("realname");
        if (!StringUtils.isEmpty(realname)) {
            entityWrapper.like("t.realname", realname);
        }
        String username = request.getParameter("username");
        if (!StringUtils.isEmpty(username)) {
            entityWrapper.like("t.username", username);
        }
        String phone = request.getParameter("phone");
        if (!StringUtils.isEmpty(phone)) {
            entityWrapper.like("t.phone", phone);
        }
        String organizationId = request.getParameter("organization.id");
        if (!StringUtils.isEmpty(organizationId)) {
            entityWrapper.apply(String.format("t.organization_id = '%s' or b.parent_ids like '%%%s%%'", organizationId, organizationId));
        }
        // 预处理
        Page pageBean = userService.selectPage(PageRequest.getPage(), entityWrapper);
        return Response.successPageJson(pageBean);
    }

    @PostMapping("add")
    @Log(logType = LogType.INSERT)
    @RequiresPermissions("sys:user:add")
    public String add(User entity, BindingResult result,
                      HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        //账号重复
        if (userService.selectCount(new QueryWrapper<User>().eq("username", entity.getUsername())) > 0) {
            return Response.failJson("账号重复");
        }
        entity.setTenantId(UserUtils.getTenantId());
        userService.insert(entity);
        //保存之后
        afterSave(entity, request);
        return Response.ok("添加成功");
    }

    @PostMapping("update")
    @Log(logType = LogType.UPDATE)
    @RequiresPermissions("sys:user:update")
    public String update(User entity, BindingResult result,
                         HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        //账号重复
        if (userService.selectCount(new QueryWrapper<User>().ne("id", entity.getId()).eq("username", entity.getUsername())) > 0) {
            return Response.failJson("账号重复");
        }
        userService.insertOrUpdate(entity);
        //保存之后
        afterSave(entity, request);
        return Response.ok("更新成功");
    }

    @PostMapping("delete/{id}")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("sys:user:delete")
    public String delete(@PathVariable("id") String id) {
        userService.deleteById(id);
        return Response.ok("删除成功");
    }

    @PostMapping("batch/delete")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("sys:user:delete")
    public String batchDelete(@RequestParam("ids") String[] ids) {
        List<Serializable> idList = java.util.Arrays.asList(ids);
        userService.deleteBatchIds(idList);
        return Response.ok("删除成功");
    }

    @PostMapping(value = "{id}/changePassword")
    @Log(logType = LogType.OTHER, title = "修改成功")
    @RequiresPermissions("sys:user:change:password")
    public String changePassword(@PathVariable("id") String id, HttpServletRequest request,
                                 HttpServletResponse response) {
        String password = request.getParameter("password");
        userService.changePassword(id, password);
        return Response.ok("密码修改成功");
    }

    @GetMapping("detail/{id}")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("sys:user:list")
    public String detail(@PathVariable("id") String id) {
        User user = userService.selectById(id);
        return Response.successJson(user);
    }

    @PostMapping(value = "{id}/avatar")
    @Log(logType = LogType.OTHER, title = "修改头像")
    @RequiresPermissions("sys:user:avatar")
    public String avatar(User user, HttpServletRequest request, HttpServletResponse response) {
        try {
            User oldUser = userService.selectById(user.getId());
            BeanUtils.copyProperties(user, oldUser);
            userService.insertOrUpdate(oldUser);
            String currentUserId = UserUtils.getUser().getId();
            if (currentUserId.equals(user.getId())) {
                UserUtils.clearCache();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Response.error("头像修改失败");
        }
        return Response.ok("头像修改成功");
    }

    public void afterSave(User entity, HttpServletRequest request) {
        // 删除角色关联
        String[] roleIdList = request.getParameterValues("roleIdList");
        if (roleIdList != null && roleIdList.length > 0) {
            userRoleService.delete(new QueryWrapper<UserRole>().eq("user_id", entity.getId()));
            List<UserRole> userRoleList = new ArrayList<UserRole>();
            for (String roleid : roleIdList) {
                UserRole userRole = new UserRole();
                userRole.setUserId(entity.getId());
                userRole.setRoleId(roleid);
                userRoleList.add(userRole);
            }
            userRoleService.insertBatch(userRoleList);
        }

    }

    @GetMapping("export")
    @Log(logType = LogType.EXPORT)
    @RequiresPermissions("sys:user:export")
    public String export(HttpServletRequest request) {
        HashMap<String, Object> response = new HashMap<>();
        try {
            TemplateExportParams params = new TemplateExportParams(
                    "");
            //加入条件
            QueryWrapper<User> entityWrapper = new QueryWrapper<>();
            // 子查询
            String organizationid = request.getParameter("organizationid");
            if (!StringUtils.isEmpty(organizationid)) {
                entityWrapper.eq("uo.organization_id", organizationid);
            }
            Page pageBean = userService.selectPage(PageRequest.getPage(), entityWrapper);
            String title = "用户信息";
            Workbook book = ExcelExportUtil.exportExcel(new ExportParams(
                    title, title, title), User.class, pageBean.getRecords());
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            book.write(bos);
            byte[] bytes = bos.toByteArray();
            String bytesRes = StringUtils.bytesToHexString2(bytes);
            title = title + "-" + DateUtils.getDateTime();
            response.put("bytes", bytesRes);
            response.put("title", title);
        } catch (Exception e) {
            e.printStackTrace();
            return Response.error(ResponseError.NORMAL_ERROR, "导出失败");
        }
        return Response.toJson(response, "导出成功");
    }

    @PostMapping(value = "validate")
    public ValidResponse validate(DuplicateValid duplicateValid, HttpServletRequest request) {
        ValidResponse validResponse = new ValidResponse();
        Boolean valid = Boolean.FALSE;
        try {
            QueryWrapper<User> entityWrapper = new QueryWrapper<>();
            valid = userService.doValid(duplicateValid, entityWrapper);
            if (valid) {
                validResponse.setStatus("y");
                validResponse.setInfo("验证通过!");
            } else {
                validResponse.setStatus("n");
                if (!StringUtils.isEmpty(duplicateValid.getErrorMsg())) {
                    validResponse.setInfo(duplicateValid.getErrorMsg());
                } else {
                    validResponse.setInfo("当前信息重复!");
                }
            }
        } catch (Exception e) {
            validResponse.setStatus("n");
            validResponse.setInfo("验证异常，请检查字段是否正确!");
        }
        return validResponse;
    }

    /**
     * 获取用户信息
     *
     * @return
     */
    @GetMapping(value = "info")
    public String info() {
        User user = UserUtils.getUser();
        if (user == null) {
            return Response.failJson("获取失败");
        } else {
            user.setRoles(roleService.findListByUserId(user.getId()));
            return Response.successJson(user);
        }
    }

    /**
     * 更新用户信息
     *
     * @param user
     * @param request
     * @return
     */
    @PostMapping("my/update")
    @Log(logType = LogType.UPDATE, title = "用户更新")
    public String myUpdate(User user, HttpServletRequest request) {
        String userId = UserUtils.getUser().getId();
        User oldUser = userService.selectById(userId);
        // 验证错误
        BeanUtils.copyProperties(user, oldUser);
        userService.insertOrUpdate(oldUser);
        return Response.ok("更新成功");
    }

    /**
     * 更新用户信息
     *
     * @param oldPassword
     * @param password
     * @param request
     * @return
     */
    @PostMapping("my/changePassword")
    @Log(logType = LogType.OTHER, title = "用户修改密码")
    public String myChangePassword(String oldPassword,
                                   String password, HttpServletRequest request) {
        String userId = UserUtils.getUser().getId();
        if (userService.checkPassword(userId, oldPassword)) {
            userService.changePassword(userId, password);
        } else {
            return Response.error("原密码错误");
        }
        return Response.ok("密码修改成功");
    }
}
