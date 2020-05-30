package com.sunseagear.wind.modules.sms.entity;

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
 * @package com.sunseagear.wind.modules.sms.entity
 * @title: 发送日志实体
 * @description: 发送日志实体 * @date: 2018-09-14 09:47:53
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */

@Data
@TableName("sms_send_log")
@SuppressWarnings("serial")
public class SmsSendLog extends AbstractEntity<String> {

    public static final String SMS_SEND_STATUS_SUCCESS = "1";
    public static final String SMS_SEND_STATUS_FAIL = "-1";
    public static final String SMS_SEND_STATUS_IN = "0";
    /**
     * id
     */
    @TableId(value = "id", type = IdType.UUID)
    private String id;
    /**
     * 联系电话
     */
    @TableField(value = "phone")
    private String phone;
    /**
     * 模板名称
     */
    @TableField(value = "template_name")
    private String templateName;
    /**
     * 发送数据
     */
    @TableField(value = "send_data")
    private String sendData;
    /**
     * send_code
     */
    @TableField(value = "send_code")
    private String sendCode;
    /**
     * try_num
     */
    @TableField(value = "try_num")
    private Integer tryNum;
    /**
     * 发送状态
     */
    @TableField(value = "status")
    private String status; // 0发送中，1成功，-1失败
    /**
     * 发送响应消息ID
     */
    @TableField(value = "smsid")
    private String smsid;
    /**
     * 返回码
     */
    @TableField(value = "code")
    private String code;
    /**
     * 返回消息
     */
    @TableField(value = "msg")
    private String msg;
    /**
     * 删除标记（0：正常；1：删除）
     */
    @TableField(value = "del_flag")
    private String delFlag;
    /**
     * 响应时间
     */
    @TableField(value = "response_date")
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date responseDate;

}
