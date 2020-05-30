package com.sunseagear.wind.modules.test.twotable.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sunseagear.common.http.Response;
import com.sunseagear.common.mvc.controller.BaseBeanController;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.modules.test.twotable.entity.Car;
import com.sunseagear.wind.modules.test.twotable.service.ICarService;
import com.sunseagear.wind.utils.PageRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RestController
@RequestMapping("/test/twotable/car")
@RequiresPermissions("test:twotable:car")
@Log(title = "车辆品牌分组")
public class CarController extends BaseBeanController<Car> {

    @Autowired
    private ICarService carService;


    /**
     * 根据页码和每页记录数，以及查询条件动态加载数据
     *
     * @param request
     * @throws IOException
     */
    @PostMapping(value = "list")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("test:twotable:car:list")
    public String list(HttpServletRequest request) throws IOException {
        //加入条件
        QueryWrapper<Car> entityWrapper = new QueryWrapper<>();
        entityWrapper.orderByDesc( "create_date");
        String keyword = request.getParameter("keyword");
        if (!StringUtils.isEmpty(keyword)) {
            entityWrapper.like("name", keyword).or().like("code", keyword);
        }
        // 预处理
        Page pageBean = carService.selectPage(PageRequest.getPage(), entityWrapper);
        return Response.successPageJson(pageBean, "id,name,code,remarks,usable");
    }

    @GetMapping("detail/{id}")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("test:twotable:car:detail")
    public String detail(@PathVariable("id") String id) {
        Car car = carService.selectById(id);
        return Response.successJson(car);
    }

    @PostMapping("add")
    @Log(logType = LogType.INSERT)
    @RequiresPermissions("add")
    public String add(Car entity, BindingResult result,
                      HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        carService.insert(entity);
        return Response.ok("添加成功");
    }

    @PostMapping("update")
    @Log(logType = LogType.UPDATE)
    @RequiresPermissions("test:twotable:car:update")
    public String update(Car entity, BindingResult result,
                         HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        carService.insertOrUpdate(entity);
        return Response.ok("更新成功");
    }

    @PostMapping("delete/{id}")
    @RequiresPermissions("test:twotable:car:delete")
    public String delete(@PathVariable("id") String id) {
        carService.deleteById(id);
        return Response.ok("删除成功");
    }

    @RequestMapping(value = "/forceRefresh", method = RequestMethod.POST)
    @ResponseBody
    @Log(logType = LogType.OTHER, title = "字典刷新")
    @RequiresPermissions("test:twotable:car:force:refresh")
    public String forceRefresh(HttpServletRequest request, HttpServletResponse response) {
        try {
            // DictUtils.clear();
        } catch (Exception e) {
            e.printStackTrace();
            return Response.error("字典刷新失败" + e.getMessage());
        }
        return Response.ok("字典刷新成功");
    }

}
