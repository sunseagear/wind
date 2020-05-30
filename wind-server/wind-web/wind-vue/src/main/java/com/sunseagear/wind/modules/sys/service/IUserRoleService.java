package com.sunseagear.wind.modules.sys.service;

import com.sunseagear.common.mvc.service.ICommonService;
import com.sunseagear.wind.modules.sys.entity.UserRole;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @title: IUserRoleService.java
 * @package com.sunseagear.wind.modules.sys.service
 * @description: 角色 * @date: 2017年7月11日 下午9:21:20
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public interface IUserRoleService extends ICommonService<UserRole> {

    void insert(String uid, String roleCode);

    void insertByRoleId(String uid, String roleId);

    void deleteUserRole(String uid, String roleId);
}
