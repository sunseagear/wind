package com.sunseagear.wind.modules.sms.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sunseagear.common.http.Response;
import com.sunseagear.common.mvc.controller.BaseBeanController;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.modules.sms.entity.SmsSendLog;
import com.sunseagear.wind.modules.sms.service.ISmsSendLogService;
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
 * @package com.sunseagear.wind.modules.sms.controller
 * @title: 发送日志控制器
 * @description: 发送日志控制器 * @date: 2018-09-14 09:47:53
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */

@RestController
@RequestMapping("sms/sendlog")
@RequiresPermissions("sms:sendlog")
@Log(title = "短信发送日志")
public class SmsSendLogController extends BaseBeanController<SmsSendLog> {

    @Autowired
    private ISmsSendLogService smsSendLogService;


    @GetMapping(value = "list")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("sms:sendlog:list")
    public String list(HttpServletRequest request) throws IOException {
        //加入条件
        QueryWrapper<SmsSendLog> entityWrapper = new QueryWrapper<>();
        entityWrapper.orderByDesc( "response_date");
        String sendCode = request.getParameter("sendCode");
        if (!StringUtils.isEmpty(sendCode)) {
            entityWrapper.eq("send_code", sendCode);
        }
        String phone = request.getParameter("phone");
        if (!StringUtils.isEmpty(phone)) {
            entityWrapper.eq("phone", phone);
        }
        String status = request.getParameter("status");
        if (!StringUtils.isEmpty(status)) {
            entityWrapper.eq("status", status);
        }
        // 预处理
        Page pageBean = smsSendLogService.selectPage(PageRequest.getPage(), entityWrapper);
        return Response.successPageJson(pageBean, "id,phone,templateName,sendData,sendCode,tryNum,status,smsid,code,msg,delFlag,responseDate");
    }

    @PostMapping("delete/{id}")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("sms:sendlog:delete")
    public String delete(@PathVariable("id") String id) {
        smsSendLogService.deleteById(id);
        return Response.ok("删除成功");
    }

    @PostMapping("batch/delete")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("sms:sendlog:delete")
    public String batchDelete(@RequestParam("ids") String[] ids) {
        List<Serializable> idList = java.util.Arrays.asList(ids);
        smsSendLogService.deleteBatchIds(idList);
        return Response.ok("删除成功");
    }

    @PostMapping(value = "retrySend")
    public String retrySend(@RequestParam(value = "ids", required = false) String[] ids) {
        try {
            List<Serializable> idList = java.util.Arrays.asList(ids);
            smsSendLogService.retrySend(idList);
        } catch (Exception e) {
            e.printStackTrace();
            return Response.error("重发队列添加失败");
        }
        return Response.ok("重发队列添加成功");
    }
}
