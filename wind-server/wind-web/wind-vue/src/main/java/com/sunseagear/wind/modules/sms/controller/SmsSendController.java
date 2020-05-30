package com.sunseagear.wind.modules.sms.controller;

import com.alibaba.fastjson.JSON;
import com.sunseagear.common.http.Response;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.modules.sms.service.ISmsSendService;
import com.google.common.collect.Maps;
import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * @version V1.0
 * @title 短信发送
 * @description 短信发送
 * @date 2017-06-08 12:56:37
 */
@RestController
@RequestMapping("/sms/send")
@Log(title = "短信发送")
public class SmsSendController {
    @Autowired
    private ISmsSendService smsSendService;

    @PostMapping(value = "/sendSmsByCode")
    @Log(logType = LogType.OTHER, title = "短信发送")
    public String sendSmsByCode(HttpServletRequest request,
                                @RequestParam("phone") String phone,
                                @RequestParam("code") String code,
                                @RequestParam("data") String data) {
        try {
            String[] phones = phone.split(",");
            if (!StringUtils.isEmpty(data)) {
                smsSendService.send(phones, code, JSON.parseObject(StringEscapeUtils.unescapeHtml4(data), Map.class));
            } else {
                smsSendService.send(phones, code, Maps.newHashMap());
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Response.error("短信发送失败");
        }
        return Response.ok("短信发送成功");
    }

    @PostMapping(value = "/massSendSmsByCode")
    public String massSendSmsByCode(HttpServletRequest request, HttpServletResponse response) {
        try {
            String phone = request.getParameter("phone");
            String code = request.getParameter("code");
            String data = request.getParameter("data");
            String[] phones = phone.split(",");
            if (!StringUtils.isEmpty(data)) {
                smsSendService.send(phones, code, JSON.parseObject(StringEscapeUtils.unescapeHtml4(data), Map.class));
            } else {
                smsSendService.send(phones, code, Maps.newHashMap());
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Response.error("短信发送失败");
        }
        return Response.ok("短信发送成功");
    }
}
