package com.sunseagear.common.datarule.model;

import lombok.Data;

/**
 * @version V1.0
 * @Title 用户实体
 * @Description:
 * @date 2016-12-03 21:31:50
 */
@Data
@SuppressWarnings("serial")
public class UserModel {

    private String id;
    private String username;
    private String realname;
    private String portrait;
    private String password;
    private String salt;
    private String email;
    private String phone;

    private String tenantId; //租户ID

    private String organizationId;

    private String status;

}
