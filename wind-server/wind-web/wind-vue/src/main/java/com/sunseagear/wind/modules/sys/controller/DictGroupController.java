package com.sunseagear.wind.modules.sys.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sunseagear.common.http.Response;
import com.sunseagear.common.mvc.controller.BaseBeanController;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sunseagear.wind.utils.DictUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.modules.sys.entity.DictGroup;
import com.sunseagear.wind.modules.sys.service.IDictGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RestController
@RequestMapping("/sys/dict/group")
@RequiresPermissions("sys:dict")
@Log(title = "字典分组")
public class DictGroupController extends BaseBeanController<DictGroup> {

    @Autowired
    private IDictGroupService dictGroupService;


    /**
     * 根据页码和每页记录数，以及查询条件动态加载数据
     *
     * @param request
     * @throws IOException
     */
    @GetMapping(value = "list")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("sys:dict:group:list")
    public String list(HttpServletRequest request) throws IOException {
        //加入条件
        QueryWrapper<DictGroup> entityWrapper = new QueryWrapper<>();
        entityWrapper.orderByDesc( "create_date");
        String keyword = request.getParameter("keyword");
        if (!StringUtils.isEmpty(keyword)) {
            entityWrapper.like("name", keyword).or().like("code", keyword);
        }
        // 预处理
        Page pageBean = dictGroupService.selectPage(getPage(), entityWrapper);
        return Response.successPageJson(pageBean, "id,name,code,remarks,usable");
    }

    @PostMapping("add")
    @Log(logType = LogType.INSERT)
    @RequiresPermissions("sys:dict:group:add")
    public String add(DictGroup entity, BindingResult result,
                      HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        dictGroupService.insert(entity);
        DictUtils.initDict();
        return Response.ok("添加成功");
    }

    @PostMapping("update")
    @Log(logType = LogType.UPDATE)
    @RequiresPermissions("sys:dict:group:update")
    public String update(DictGroup entity, BindingResult result,
                         HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        dictGroupService.insertOrUpdate(entity);
        DictUtils.initDict();
        return Response.ok("更新成功");
    }

    @PostMapping("delete/{id}")
    @RequiresPermissions("sys:dict:group:delete")
    public String delete(@PathVariable("id") String id) {
        dictGroupService.deleteById(id);
        DictUtils.initDict();
        return Response.ok("删除成功");
    }

}
