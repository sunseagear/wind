package com.sunseagear.wind.modules.sys.controller;

import com.sunseagear.common.http.Response;
import com.sunseagear.common.mvc.controller.BaseBeanController;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.common.helper.VueTreeHelper;
import com.sunseagear.wind.modules.sys.entity.Menu;
import com.sunseagear.wind.modules.sys.service.IMenuService;
import com.sunseagear.wind.common.helper.MenuTreeHelper;
import com.sunseagear.wind.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping("/sys/menu")
@RequiresPermissions("sys:menu")
@Log(title = "菜单管理")
public class MenuController extends BaseBeanController<Menu> {

    @Autowired
    private IMenuService menuService;

    /**
     * 根据页码和每页记录数，以及查询条件动态加载数据
     *
     * @param request
     * @throws IOException
     */
    @GetMapping(value = "list")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("sys:menu:list")
    public String list(HttpServletRequest request) throws IOException {
        QueryWrapper<Menu> entityWrapper = new QueryWrapper<>();
        //加入条件
        String keyword = request.getParameter("keyword");
        if (!StringUtils.isEmpty(keyword)) {
            entityWrapper.like("name", keyword);
        }
        entityWrapper.orderByAsc( "sort");
        List<Menu> treeNodeList = menuService.selectList(entityWrapper);
        List<Menu> vueTreeNodes = VueTreeHelper.create().sort(treeNodeList);
        return Response.successJson(vueTreeNodes);
    }

    @PostMapping("add")
    @Log(logType = LogType.INSERT)
    @RequiresPermissions("sys:menu:add")
    public String add(Menu entity, BindingResult result,
                      HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        menuService.insert(entity);
        return Response.ok("添加成功");
    }

    @PostMapping("update")
    @Log(logType = LogType.UPDATE)
    @RequiresPermissions("sys:menu:update")
    public String update(Menu entity, BindingResult result,
                         HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        menuService.insertOrUpdate(entity);
        return Response.ok("更新成功");
    }

    @PostMapping("delete/{id}")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("sys:menu:delete")
    public String delete(@PathVariable("id") String id) {
        QueryWrapper<Menu> entityWrapper = new QueryWrapper<>();
        entityWrapper.eq("parent_id", id);
        menuService.delete(entityWrapper);
        menuService.deleteById(id);
        return Response.ok("删除成功");
    }

    @PostMapping("batch/delete")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("sys:menu:delete")
    public String batchDelete(@RequestParam("ids") String[] ids) {
        List<Serializable> idList = Arrays.asList(ids);
        menuService.deleteBatchIds(idList);
        return Response.ok("删除成功");
    }

    /**
     * 获得菜单列表
     *
     * @throws IOException
     */
    @GetMapping(value = "getMenus")
    public String getMenus() {
        List<Menu> menuList = menuService.getCurrentUserMenus();
        List<MenuTreeHelper.MenuTreeNode> menuTreeNodes = MenuTreeHelper.create().sort(menuList);
        return Response.successJson(menuTreeNodes);
    }

    @PostMapping("{id}/changeSort")
    public String changeSort(@PathVariable("id") String id,
                             @RequestParam("sort") Integer sort) {
        menuService.changeSort(id, sort);
        return Response.ok("排序成功");
    }

    /**
     * 获得菜单列表
     *
     * @throws IOException
     */
    @GetMapping(value = "getPermissions")
    public String getPermissions() {
        //加入条件
        String uid = UserUtils.getUser().getId();
        List<String> permissionValueList = menuService.findPermissionByUserId(uid);
        return Response.successJson(permissionValueList);
    }

    @PostMapping("{id}/generate/button")
    @Log(logType = LogType.OTHER, title = "生成按钮")
    @RequiresPermissions("sys:menu:generate:button")
    public String generateButton(@PathVariable("id") String id,
                                 @RequestParam("parentPermission") String parentPermission,
                                 @RequestParam("permissions") String permissions,
                                 @RequestParam("permissionTitles") String permissionTitles,
                                 @RequestParam("additional") Boolean additional) {
        menuService.generateButton(id, parentPermission, permissions.split(","), permissionTitles.split(","), additional);
        return Response.ok("生成成功");
    }
}
