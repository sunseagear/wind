package com.sunseagear.wind.modules.test.twotable.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sunseagear.common.http.Response;
import com.sunseagear.common.mvc.controller.BaseBeanController;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.modules.test.twotable.entity.CarModel;
import com.sunseagear.wind.modules.test.twotable.service.ICarModelService;
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
 * @package com.sunseagear.wind.modules.sys.controller
 * @title: 消息模版控制器
 * @description: 消息模版控制器 * @date: 2018-09-03 15:10:10
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */

@RestController
@RequestMapping("/test/twotable/carmodel")
@RequiresPermissions("test:twotable:carmodel")
@Log(title = "车辆型号管理")
public class CarModelController extends BaseBeanController<CarModel> {

    @Autowired
    private ICarModelService carModelService;


    /**
     * 根据页码和每页记录数，以及查询条件动态加载数据
     *
     * @param request
     * @throws IOException
     */
    @PostMapping(value = "list")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("test:twotable:carmodel:list")
    public String list(HttpServletRequest request) throws IOException {
        //加入条件
        QueryWrapper<CarModel> entityWrapper = new QueryWrapper<>();
        entityWrapper.orderByAsc( "sort");
        String keyword = request.getParameter("keyword");
        String carId = request.getParameter("carId");
        if (!StringUtils.isEmpty(carId) && !StringUtils.isEmpty(keyword)) {
            entityWrapper.eq("car_id", carId).and(i -> i.like("label", keyword).or().like("value", keyword));
        } else if (!StringUtils.isEmpty(carId)) {
            entityWrapper.eq("car_id", carId);
        }

        // 预处理
        Page pageBean = carModelService.selectPage(PageRequest.getPage(), entityWrapper);
        return Response.successPageJson(pageBean);
    }

    @GetMapping("detail/{id}")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("test:twotable:carmodel:detail")
    public String detail(@PathVariable("id") String id) {
        CarModel carModel = carModelService.selectById(id);
        return Response.successJson(carModel);
    }

    @PostMapping("add")
    @Log(logType = LogType.UPDATE)
    @RequiresPermissions("add")
    public String add(CarModel entity, BindingResult result,
                      HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        carModelService.insert(entity);
        return Response.ok("添加成功");
    }

    @PostMapping("update")
    @Log(logType = LogType.UPDATE)
    @RequiresPermissions("test:twotable:carmodel:update")
    public String update(CarModel entity, BindingResult result,
                         HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        carModelService.insertOrUpdate(entity);
        return Response.ok("更新成功");
    }

    @PostMapping("delete/{id}")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("test:twotable:carmodel:delete")
    public String delete(@PathVariable("id") String id) {
        carModelService.deleteById(id);
        return Response.ok("删除成功");
    }

    @PostMapping("batch/delete")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("test:twotable:carmodel:delete")
    public String batchDelete(@RequestParam("ids") String[] ids) {
        List<Serializable> idList = java.util.Arrays.asList(ids);
        carModelService.deleteBatchIds(idList);
        return Response.ok("删除成功");
    }

}
