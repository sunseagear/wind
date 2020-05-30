package com.sunseagear.wind.modules.sys.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sunseagear.common.http.Response;
import com.sunseagear.common.mvc.controller.BaseBeanController;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.modules.sys.entity.Dict;
import com.sunseagear.wind.modules.sys.service.IDictService;
import com.sunseagear.wind.utils.DictUtils;
import com.sunseagear.wind.utils.PageRequest;
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
 * @title: 消息模版控制器
 * @description: 消息模版控制器 * @date: 2018-09-03 15:10:10
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */

@RestController
@RequestMapping("/sys/dict")
@RequiresPermissions("sys:dict")
@Log(title = "字典管理")
public class DictController extends BaseBeanController<Dict> {

    @Autowired
    private IDictService dictService;

    /**
     * 字典
     *
     * @return
     */
    @GetMapping(value = "")
    public String get() {
        try {
            //放入数据字典
            return Response.successJson(DictUtils.getDict());
        } catch (Exception e) {
            e.printStackTrace();
            return Response.error("获取失败");
        }
    }

    /**
     * 根据页码和每页记录数，以及查询条件动态加载数据
     *
     * @param request
     * @throws IOException
     */
    @GetMapping(value = "list")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("sys:dict:list")
    public String list(HttpServletRequest request) throws IOException {
        //加入条件
        QueryWrapper<Dict> entityWrapper = new QueryWrapper<>();
        entityWrapper.orderByAsc( "sort");
        String keyword = request.getParameter("keyword");
        String gid = request.getParameter("gid");
        if (!StringUtils.isEmpty(gid) && !StringUtils.isEmpty(keyword)) {
            entityWrapper.eq("gid", gid).and(i -> i.like("label", keyword).or().like("value", keyword));
        } else if (!StringUtils.isEmpty(gid)) {
            entityWrapper.eq("gid", gid);
        }

        // 预处理
        Page pageBean = dictService.selectPage(PageRequest.getPage(), entityWrapper);
        return Response.successPageJson(pageBean);
    }

    @PostMapping("add")
    @Log(logType = LogType.INSERT)
    @RequiresPermissions("sys:dict:add")
    public String add(Dict entity, BindingResult result,
                      HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        dictService.insert(entity);
        return Response.ok("添加成功");
    }

    @PostMapping("update")
    @Log(logType = LogType.UPDATE)
    @RequiresPermissions("sys:dict:add")
    public String update(Dict entity, BindingResult result,
                         HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        dictService.insertOrUpdate(entity);
        return Response.ok("更新成功");
    }

    @PostMapping("delete/{id}")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("sys:dict:delete")
    public String delete(@PathVariable("id") String id) {
        dictService.deleteById(id);
        return Response.ok("删除成功");
    }

    @PostMapping("batch/delete")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("sys:dict:delete")
    public String batchDelete(@RequestParam("ids") String[] ids) {
        List<Serializable> idList = Arrays.asList(ids);
        dictService.deleteBatchIds(idList);
        return Response.ok("删除成功");
    }

}
