package com.sunseagear.wind.modules.sys.controller;

import com.sunseagear.common.http.Response;
import com.sunseagear.common.mvc.controller.BaseBeanController;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.modules.sys.entity.UserRole;
import com.sunseagear.wind.modules.sys.service.IUserRoleService;
import com.sunseagear.wind.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.upms.controller
 * @title: 用户角色控制器
 * @description: 用户角色控制器 * @date: 2018-05-06 18:46:48
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */
@RestController
@RequestMapping("/sys/user/role")
@RequiresPermissions("sys:user:role")
@Log(title = "用户管理")
public class UserRoleController extends BaseBeanController<UserRole> {

    @Autowired
    private IUserRoleService userRoleService;


    /**
     * 根据页码和每页记录数，以及查询条件动态加载数据
     *
     * @param userid
     * @param request
     * @param response
     * @throws IOException
     */
    @GetMapping(value = "{userid}/roleIds")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("sys:user:role:list")
    public List<String> userRoleIds(@PathVariable("userid") String userid, HttpServletRequest request,
                                    HttpServletResponse response) throws IOException {
        List<String> roleIdList = new ArrayList<String>();
        List<UserRole> userRoleList = userRoleService.selectList(new QueryWrapper<UserRole>().eq("user_id", userid));
        for (UserRole userRole : userRoleList) {
            roleIdList.add(userRole.getRoleId());
        }
        return roleIdList;
    }

    /**
     * 新增关系
     *
     * @param userId
     * @param roleIds
     * @return
     */
    @PostMapping("{userId}/insertByUserId")
    @Log(logType = LogType.INSERT)
    @RequiresPermissions("sys:user:role:add")
    public String insertByUserId(@PathVariable("userId") String userId, @RequestParam("roleIds") String[] roleIds) {
        for (String roleId : roleIds) {
            UserRole userRole = new UserRole();
            userRole.setUserId(userId);
            userRole.setRoleId(roleId);
            userRoleService.insertByRoleId(userId, roleId);
        }
        UserUtils.clearCache();
        return Response.ok("添加成功");
    }

    /**
     * 删除关系
     *
     * @param userId
     * @param roleIds
     * @return
     */
    @PostMapping("{userId}/deleteByUserId")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("sys:user:role:delete")
    public String deleteByUserId(@PathVariable("userId") String userId, @RequestParam("roleIds") String roleIds) {
        QueryWrapper<UserRole> entityWrapper = new QueryWrapper<>();
        entityWrapper.eq("user_id", userId);
        entityWrapper.in("role_id", roleIds);
        userRoleService.delete(entityWrapper);
        UserUtils.clearCache();
        return Response.ok("删除成功");
    }

}
