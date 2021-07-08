package com.sunseagear.wind.modules.sys.mapper;

import com.sunseagear.common.mvc.mapper.BaseTreeMapper;
import com.sunseagear.wind.modules.sys.entity.Menu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MenuMapper extends BaseTreeMapper<Menu> {

    /**
     * @param userId
     * @return
     * @title: findMenuByUserId
     * @description: 通过用户查找菜单
     * @return: List<Menu>
     */
    List<Menu> findMenuAndPermissionByUserId(String userId);

    List<Menu> findMenuByUserId(String userId);

    /**
     * @param roleId
     * @return
     * @title: findMenuByRoleId
     * @description: 通过角色查找菜单
     * @return: List<Menu>
     */
    List<Menu> findMenuByRoleId(String roleId);


    /**
     * @param userId
     * @return
     * @title: findMenuByUserId
     * @description: 通过用户查找菜单
     * @return: List<Menu>
     */
    List<Menu> findPermissionByUserId(String userId);

    /**
     * @param roleId
     * @return
     * @title: findMenuByRoleId
     * @description: 通过角色查找菜单
     * @return: List<Menu>
     */
    List<Menu> findPermissionByRoleId(String roleId);

    void deleteRoleMenu(String roleId);

    void deleteRolePermission(String roleId);

}
