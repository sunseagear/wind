package com.sunseagear.wind.modules.email.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sunseagear.common.http.Response;
import com.sunseagear.common.mvc.controller.BaseBeanController;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.modules.email.entity.EmailTemplate;
import com.sunseagear.wind.modules.email.service.IEmailTemplateService;
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
 * @package com.sunseagear.wind.modules.email.controller
 * @title: 邮件模板控制器
 * @description: 邮件模板控制器 * @date: 2018-09-12 10:59:18
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */

@RestController
@RequestMapping("/email/template")
@RequiresPermissions("email:template")
@Log(title = "邮件模板")
public class EmailTemplateController extends BaseBeanController<EmailTemplate> {

    @Autowired
    private IEmailTemplateService emailTemplateService;

    /**
     * 根据页码和每页记录数，以及查询条件动态加载数据
     *
     * @param request
     * @throws IOException
     */
    @GetMapping(value = "list")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("email:template:list")
    public String list(HttpServletRequest request) throws IOException {
        //加入条件
        QueryWrapper<EmailTemplate> entityWrapper = new QueryWrapper<>();
        entityWrapper.orderByDesc( "create_date");
        String code = request.getParameter("code");
        if (!StringUtils.isEmpty(code)) {
            entityWrapper.like("code", code);
        }
        String name = request.getParameter("name");
        if (!StringUtils.isEmpty(name)) {
            entityWrapper.like("name", name);
        }
        // 预处理
        Page pageBean = emailTemplateService.selectPage(PageRequest.getPage(), entityWrapper);
        return Response.successPageJson(pageBean, "id,name,code,templateSubject,templateContent");
    }

    @PostMapping("add")
    @Log(logType = LogType.INSERT)
    @RequiresPermissions("email:template:add")
    public String add(EmailTemplate entity, BindingResult result,
                      HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        String templateCode = StringUtils.randomString(10);
        entity.setCode(templateCode);
        emailTemplateService.insert(entity);
        return Response.ok("添加成功");
    }


    @PostMapping("update")
    @RequiresPermissions("email:template:update")
    @Log(logType = LogType.UPDATE)
    public String update(EmailTemplate entity, BindingResult result,
                         HttpServletRequest request, HttpServletResponse response) {
        // 验证错误
        this.checkError(entity, result);
        emailTemplateService.insertOrUpdate(entity);
        return Response.ok("更新成功");
    }

    @PostMapping("delete/{id}")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("email:template:delete")
    public String delete(@PathVariable("id") String id) {
        emailTemplateService.deleteById(id);
        return Response.ok("删除成功");
    }

    @PostMapping("batch/delete")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("email:template:delete")
    public String batchDelete(@RequestParam("ids") String[] ids) {
        List<Serializable> idList = Arrays.asList(ids);
        emailTemplateService.deleteBatchIds(idList);
        return Response.ok("删除成功");
    }
}
