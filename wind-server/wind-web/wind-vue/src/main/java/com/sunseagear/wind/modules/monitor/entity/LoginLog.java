package com.sunseagear.wind.modules.monitor.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.sunseagear.common.mvc.entity.AbstractEntity;
import lombok.Data;

import java.util.Date;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.bbs.modules.sys.entity
 * @title: 登陆日志实体
 * @description: 登陆日志实体
 * @author: sys * @date: 2018-09-28 11:31:36
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */

@Data
@TableName("sys_login_log")
@SuppressWarnings("serial")
public class LoginLog extends AbstractEntity<String> {

    /**
     * 访问ID
     */
    @TableId(value = "id", type = IdType.UUID)
    private String id;
    /**
     * 登录账号
     */
    @Excel(name = "登录账号", orderNum = "0", width = 15)
    @TableField(value = "login_name")
    private String loginName;
    /**
     * 登录IP地址
     */
    @TableField(value = "login_ip")
    @Excel(name = "登录IP", orderNum = "1", width = 20)
    private String loginIp;
    /**
     * 登录地点
     */
    @Excel(name = "登录地点", orderNum = "2")
    @TableField(value = "login_location")
    private String loginLocation;
    /**
     * 浏览器类型
     */
    @Excel(name = "浏览器类型", orderNum = "3")
    @TableField(value = "browser")
    private String browser;
    /**
     * 操作系统
     */
    @Excel(name = "操作系统", orderNum = "4", width = 15)
    @TableField(value = "os")
    private String os;
    /**
     * 登录状态（1成功 -1失败）
     */
    @Excel(name = "操作系统", replace = {"成功_1", "失败_-1", "退出_0"}, orderNum = "5")
    @TableField(value = "status")
    private String status;
    /**
     * 提示消息
     */
    @Excel(name = "提示消息", orderNum = "6", width = 20)
    @TableField(value = "msg")
    private String msg;
    /**
     * 访问时间
     */
    @Excel(name = "操作时间", orderNum = "7", format = "yyyy-MM-dd HH:mm:ss", width = 30)
    @TableField(value = "login_time")
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date loginTime;

    private String tenantId;


}
