package com.sunseagear.wind.modules.email.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sunseagear.common.http.Response;
import com.sunseagear.common.mvc.controller.BaseBeanController;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.modules.email.entity.EmailSendLog;
import com.sunseagear.wind.modules.email.service.IEmailSendLogService;
import com.sunseagear.wind.utils.PageRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.Serializable;
import java.util.List;


/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.email.controller
 * @title: 邮件发送日志控制器
 * @description: 邮件发送日志控制器 * @date: 2018-09-12 10:58:46
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */

@RestController
@RequestMapping("/email/sendlog")
@RequiresPermissions("email:sendlog")
@Log(title = "邮件发送日志")
public class EmailSendLogController extends BaseBeanController<EmailSendLog> {

    @Autowired
    private IEmailSendLogService emailSendLogService;


    @GetMapping(value = "list")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("email:sendlog:list")
    public String list(HttpServletRequest request) throws IOException {
        //加入条件
        QueryWrapper<EmailSendLog> entityWrapper = new QueryWrapper<>();
        entityWrapper.orderByDesc( "response_date");
        String subject = request.getParameter("subject");
        if (!StringUtils.isEmpty(subject)) {
            entityWrapper.like("subject", subject);
        }
        String email = request.getParameter("email");
        if (!StringUtils.isEmpty(email)) {
            entityWrapper.eq("email", email);
        }
        String status = request.getParameter("status");
        if (!StringUtils.isEmpty(status)) {
            entityWrapper.eq("status", status);
        }
        // 预处理
        Page pageBean = emailSendLogService.selectPage(PageRequest.getPage(), entityWrapper);
        return Response.successPageJson(pageBean, "id,email,subject,content,sendData,sendCode,responseDate,tryNum,msg,status,delFlag,emarks");
    }

    @PostMapping("delete/{id}")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("email:sendlog:delete")
    public String delete(@PathVariable("id") String id) {
        emailSendLogService.deleteById(id);
        return Response.ok("删除成功");
    }

    @PostMapping("batch/delete")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("email:sendlog:delete")
    public String batchDelete(@RequestParam("ids") String[] ids) {
        List<Serializable> idList = java.util.Arrays.asList(ids);
        emailSendLogService.deleteBatchIds(idList);
        return Response.ok("删除成功");
    }

    @PostMapping(value = "retrySend")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("email:sendlog:list")
    public String retrySend(@RequestParam(value = "ids", required = false) String[] ids) {
        try {
            List<Serializable> idList = java.util.Arrays.asList(ids);
            emailSendLogService.retrySend(idList);
        } catch (Exception e) {
            e.printStackTrace();
            return Response.error("重发队列添加失败");
        }
        return Response.ok("重发队列添加成功");
    }
}
