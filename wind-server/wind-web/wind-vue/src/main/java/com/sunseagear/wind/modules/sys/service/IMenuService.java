package com.sunseagear.wind.modules.sys.service;

import com.sunseagear.common.mvc.service.ITreeCommonService;
import com.sunseagear.wind.modules.sys.entity.Menu;

import java.util.List;

/**
 * @author jwcg
 * @version V1.0
 * @Title:
 * @Description:
 * @date 2014-12-20 21:33:32
 */
public interface IMenuService extends ITreeCommonService<Menu, String> {

    List<Menu> getCurrentUserMenus();

    List<Menu> getCurrentUserAllMenus();

    /**
     * 通过用户ID查找菜单
     *
     * @return
     */
    List<Menu> findMenuByUserId(String userId);

    /**
     * 通过角色查找菜单
     *
     * @return
     */
    List<Menu> findMenuByRoleId(String roleId);

    /**
     * 通过用户ID查找菜单
     *
     * @return
     */
    List<String> findPermissionByUserId(String userId);

    /**
     * 通过用户ID查找菜单
     *
     * @return
     */
    List<String> findPermissionByRoleId(String roleId);

    void changeSort(String menuId, Integer sort);

    void generateButton(String menuId,
                        String parentPermission,
                        String[] permissions,
                        String[] permissionTitles, Boolean additional);
}
