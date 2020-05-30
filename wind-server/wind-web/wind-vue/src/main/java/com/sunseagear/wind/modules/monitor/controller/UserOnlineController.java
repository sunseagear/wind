package com.sunseagear.wind.modules.monitor.controller;

import com.sunseagear.common.http.Response;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.modules.sso.service.IOAuthService;
import com.sunseagear.wind.utils.PageRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * @version V1.0
 * @Title: 在线用户
 * @Description: 在线用户
 * @date 2017-05-15 08:18:21
 */
@RestController
@RequestMapping(value = "/monitor/user/online")
@RequiresPermissions("monitor:user:online")
@Log(title = "在线用户")
public class UserOnlineController {

    @Autowired
    private IOAuthService oAuthService;

    /**
     * 根据页码和每页记录数，以及查询条件动态加载数据
     *
     * @throws IOException
     */
    @RequestMapping(value = "list", method = {RequestMethod.GET, RequestMethod.POST})
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("monitor:user:online:list")
    public String list(HttpServletRequest request) throws IOException {
        // 预处理
        com.baomidou.mybatisplus.extension.plugins.pagination.Page pageBean = oAuthService.activePrincipal(PageRequest.getPage(),request);
        return Response.successPageJson(pageBean);
    }

    @PostMapping("/forceLogout")
    @Log(title = "用户强制退出")
    public String forceLogout(@RequestParam(value = "ids") String[] ids) {
        for (String id : ids) {
            // 强制退出，不想频繁的请求redis没想好怎么处理
        }
        return Response.ok("强制退出成功");
    }

}
