package com.sunseagear.wind.modules.sys.service;

import com.sunseagear.common.mvc.service.ICommonService;
import com.sunseagear.wind.modules.sys.entity.RoleMenu;

/**
 * @version V1.0
 * @Title:
 * @Description:
 * @date 2017-02-21 12:54:43
 */
public interface IRoleMenuService extends ICommonService<RoleMenu> {

    void insert(String roleId, String menuId);

    void setMenu(String roleId, String menuIds);
}

