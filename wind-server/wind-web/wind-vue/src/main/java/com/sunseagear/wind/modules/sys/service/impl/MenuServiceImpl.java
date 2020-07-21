package com.sunseagear.wind.modules.sys.service.impl;

import com.sunseagear.common.mvc.service.impl.TreeCommonServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.modules.sys.entity.Menu;
import com.sunseagear.wind.modules.sys.mapper.MenuMapper;
import com.sunseagear.wind.modules.sys.service.IMenuService;
import com.sunseagear.wind.utils.UserUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Transactional
@Service("menuService")
public class MenuServiceImpl extends TreeCommonServiceImpl<MenuMapper, Menu, String> implements IMenuService {

    @Override
    public List<Menu> getCurrentUserMenus() {
        List<Menu> treeNodeList = baseMapper.findMenuByUserId(UserUtils.getUser().getId());
        List<Menu> list = getMenus(treeNodeList);
        List<Menu> newList = new ArrayList<>();
        for (Menu menu : list) {
            if (menu.getType().equals(Menu.BUTTON)) {
                continue;
            }
            newList.add(menu);
        }
        return newList;
    }

    @Override
    public List<Menu> getCurrentUserAllMenus() {
        List<Menu> treeNodeList = baseMapper.findAllMenuByUserId(UserUtils.getUser().getId());
        return getMenus(treeNodeList);
    }

    private List<Menu> getMenus(List<Menu> treeNodeList) {
        List<Menu> menuListAll = list(new QueryWrapper());
        HashMap<String, Menu> menuHashMapAll = new HashMap<>();
        menuListAll.forEach(menu -> {
            menuHashMapAll.put(menu.getId(), menu);
        });
        HashMap<String, Menu> menuHashMap = new HashMap<>();
        treeNodeList.forEach(treeNode -> {
            String parentIds = treeNode.getParentIds();
            if (!StringUtils.isEmpty(parentIds)) {
                Arrays.asList(parentIds.split("/")).forEach(id -> {
                    Menu menu = menuHashMapAll.get(id);
                    menuHashMap.put(id, menu);
                });
            }
            menuHashMap.put(treeNode.getId(), menuHashMapAll.get(treeNode.getId()));

        });
        List<Menu> menuList = new ArrayList<>();
        menuHashMap.values().forEach(item -> {
            menuList.add(item);
        });
        menuList.sort(new Comparator<Menu>() {
            @Override
            public int compare(Menu o1, Menu o2) {
                return o1.getSort() - o2.getSort();
            }
        });
        return menuList;
    }


    @Override
    public List<Menu> findMenuByUserId(String userId) {
        return baseMapper.findMenuByUserId(userId);
    }

    @Override
    public List<Menu> findMenuByRoleId(String roleId) {
        return baseMapper.findMenuByRoleId(roleId);
    }

    @Override
    public List<String> findPermissionByUserId(String userId) {
        return baseMapper.findPermissionByUserId(userId);
    }

    @Override
    public List<String> findPermissionByRoleId(String roleId) {
        return baseMapper.findPermissionByRoleId(roleId);
    }

    @Override
    public void changeSort(String menuId, Integer sort) {
        Menu menu = selectById(menuId);
        menu.setSort(sort);
        insertOrUpdate(menu);
    }

    @Override
    public void generateButton(String menuId,
                               String parentPermission,
                               String[] permissions,
                               String[] permissionTitles, Boolean additional) {
        if (!additional) {
            QueryWrapper<Menu> deleteEntityWrapper = new QueryWrapper();
            deleteEntityWrapper.eq("parent_id", menuId);
            deleteEntityWrapper.eq("type", 3);
            delete(deleteEntityWrapper);
        }
        QueryWrapper<Menu> countEntityWrapper = new QueryWrapper();
        countEntityWrapper.eq("t.parent_id", menuId);
        countEntityWrapper.eq("t.type", 3);

        int count = selectTreeList(countEntityWrapper).size();

        List<Menu> menuList = new ArrayList<>();
        for (int i = 0; i < permissions.length; i++) {
            Menu menu = new Menu();
            menu.setParentId(menuId);
            menu.setName(permissionTitles[i]);
            menu.setPermission(parentPermission + ":" + permissions[i]);
            menu.setSort(i + count);
            menu.setType("3");
            menu.setEnabled((short) 1);
            menu.setCacheable(true);
            menu.setRequireAuth(true);
            menuList.add(menu);
        }
        insertBatch(menuList);
    }
}
