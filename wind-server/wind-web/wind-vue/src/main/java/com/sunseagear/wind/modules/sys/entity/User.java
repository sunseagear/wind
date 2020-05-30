package com.sunseagear.wind.modules.sys.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.sunseagear.common.mvc.entity.DataEntity;
import com.sunseagear.common.utils.StringUtils;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @version V1.0
 * @Title 用户实体
 * @Description:
 * @date 2016-12-03 21:31:50
 */
@Data
@TableName("sys_user")
@SuppressWarnings("serial")
public class User extends DataEntity<String> {

    /**
     * 是否锁定（1：正常；-1：删除；0：锁定；）
     */

    public static final String STATUS_DELETE = "-1";
    public static final String STATUS_LOCKED = "0";
    public static final String STATUS_NORMAL = "1";


    /**
     * id
     */
    @TableId(value = "id", type = IdType.UUID)
    private String id;
    // 姓名
    @Excel(name = "用户名", orderNum = "1")
    private String username;
    // 用户名
    @Excel(name = "姓名", orderNum = "0")
    private String realname;
    // 头像
    private String portrait;
    // 密码
    private String password;
    // 盐
    private String salt;
    // 邮件
    @Excel(name = "邮件", orderNum = "3", width = 20.0D)
    private String email;
    // 联系电话
    @Excel(name = "联系电话", orderNum = "2", width = 20.0D)
    private String phone;

    private String tenantId; //租户ID

    @TableField(value = "organization_id")
    private String organizationId;

    @TableField(exist = false)
    private Organization organization;

    public void setOrganizationId(String organizationId) {
        this.organizationId = organizationId;
        if (this.organization == null) {
            this.organization = new Organization();
        }
        this.organization.setId(organizationId);
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
        if (organization != null) {
            this.setOrganizationId(organization.getId());
        }
    }

    /**
     * 系统用户的状态
     */
    private String status = STATUS_NORMAL;

    @TableField(exist = false)
    List<Role> roles;  //角色数据

    public String getCredentialsSalt() {
        return salt;
    }

    public void setDefault() {
        this.status = STATUS_NORMAL;
    }

    public String getRoleIds() {
        List<String> roleIds = new ArrayList<>();
        roles.forEach(item -> {
            roleIds.add(item.getId());
        });
        return StringUtils.join(roleIds, ",");
    }
}
