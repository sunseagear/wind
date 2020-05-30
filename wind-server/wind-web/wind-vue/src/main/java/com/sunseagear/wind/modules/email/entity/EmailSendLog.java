package com.sunseagear.wind.modules.email.entity;

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
 * @package com.sunseagear.wind.modules.email.entity
 * @title: 邮件发送日志实体
 * @description: 邮件发送日志实体 * @date: 2018-09-12 10:58:46
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */

@Data
@TableName("email_send_log")
@SuppressWarnings("serial")
public class EmailSendLog extends AbstractEntity<String> {
    public static final String EMAIL_SEND_STATUS_SUCCESS = "1";
    public static final String EMAIL_SEND_STATUS_FAIL = "-1";
    public static final String EMAIL_SEND_STATUS_IN = "0";
    /**
     * id
     */
    @TableId(value = "id", type = IdType.UUID)
    private String id;
    /**
     * 联系电话
     */
    @TableField(value = "email")
    private String email;
    /**
     * 主题
     */
    @TableField(value = "subject")
    private String subject;
    /**
     * 模板类型
     */
    @TableField(value = "content")
    private String content;
    /**
     * send_data
     */
    @TableField(value = "send_data")
    private String sendData;
    /**
     * 发送编码
     */
    @TableField(value = "send_code")
    private String sendCode;
    /**
     * 响应时间
     */
    @TableField(value = "response_date")
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date responseDate;
    /**
     * 重发次数
     */
    @TableField(value = "try_num")
    private Integer tryNum;
    /**
     * 返回消息
     */
    @TableField(value = "msg")
    private String msg;
    /**
     * 发送状态
     */
    @TableField(value = "status")
    private String status;
    /**
     * 删除标记（0：正常；1：删除）
     */
    @TableField(value = "del_flag")
    private String delFlag;
    /**
     * 备注信息
     */
    @TableField(value = "remarks")
    private String remarks;


}
