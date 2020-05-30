package com.sunseagear.wind.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.sunseagear.common.mvc.entity.DataEntity;
import lombok.Data;

/**
 * @version V1.0
 * @Title: 角色实体
 * @Description: 角色实体
 * @date 2016-12-03 21:33:15
 */
@Data
@TableName("sys_role")
@SuppressWarnings("serial")
public class Role extends DataEntity<String> {
    @TableId(value = "id", type = IdType.UUID)
    private String id;
    @TableField(value = "name")
    private String name;// 角色名称
    @TableField(value = "code")
    private String code;// 角色编码
    @TableField(value = "is_sys")
    private String isSys;// 是否系统数据
    @TableField(value = "usable")
    private String usable;// 是否可用
    @TableField(value = "tenant_id")
    private String tenantId; //租户ID

}
