package com.sunseagear.wind.modules.sys.service.impl;

import com.sunseagear.common.mvc.service.impl.CommonServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.modules.sys.entity.RoleMenu;
import com.sunseagear.wind.modules.sys.mapper.RoleMenuMapper;
import com.sunseagear.wind.modules.sys.service.IMenuService;
import com.sunseagear.wind.modules.sys.service.IRoleMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Transactional
@Service("roleMenuService")
public class RoleMenuServiceImpl extends CommonServiceImpl<RoleMenuMapper, RoleMenu> implements IRoleMenuService {

    @Autowired
    private IMenuService menuService;

    @Override
    public void setMenu(String roleId, String menuIds) {
        if (!StringUtils.isEmpty(menuIds)) {
            // 删除菜单关联
            delete(new QueryWrapper<RoleMenu>().eq("role_id", roleId));
            String[] selectMenus = menuIds.split(",");
            List<RoleMenu> roleMenuList = new ArrayList<RoleMenu>();
            for (String menuId : selectMenus) {
                RoleMenu roleMenu = new RoleMenu();
                roleMenu.setRoleId(roleId);
                roleMenu.setMenuId(menuId);
                roleMenuList.add(roleMenu);
            }
            insertOrUpdateBatch(roleMenuList);
        }
    }

    @Override
    public void insert(String roleId, String menuId) {
        QueryWrapper<RoleMenu> entityWrapper = new QueryWrapper<>();
        entityWrapper.eq("menu_id", menuId);
        entityWrapper.eq("role_id", roleId);
        int count = selectCount(entityWrapper);
        if (count == 0) {
            RoleMenu roleMenu = new RoleMenu();
            roleMenu.setMenuId(menuId);
            roleMenu.setRoleId(roleId);
            insert(roleMenu);
        }
    }
}
