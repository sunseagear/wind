package com.sunseagear.wind.utils;

import com.sunseagear.common.utils.CacheUtils;
import com.sunseagear.common.utils.SpringContextHolder;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.common.utils.entity.Principal;
import com.sunseagear.wind.modules.sys.entity.Role;
import com.sunseagear.wind.modules.sys.entity.User;
import com.sunseagear.wind.modules.sys.service.IMenuService;
import com.sunseagear.wind.modules.sys.service.IRoleService;
import com.sunseagear.wind.modules.sys.service.IUserService;
import com.google.common.base.Function;
import com.google.common.collect.Collections2;
import com.google.common.collect.Sets;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.subject.Subject;

import java.util.List;
import java.util.Set;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @title: UserUtils.java
 * @package com.sunseagear.wind.modules.sys.utils
 * @description: 用户工具类 * @date: 2017年6月26日 下午6:00:39
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
@SuppressWarnings("unchecked")
public class UserUtils extends com.sunseagear.common.utils.UserUtils {

    private static IUserService userService = SpringContextHolder.getBean(IUserService.class);
    private static IRoleService roleService = SpringContextHolder.getBean(IRoleService.class);
    private static IMenuService menuService = SpringContextHolder.getBean(IMenuService.class);
    public static final String USER_CACHE = "userCache";
    public static final String USER_CACHE_ID_ = "id_";
    public static final String USER_CACHE_USER_NAME_ = "username_";
    public static final String CACHE_ROLE_LIST_ = "roleList_";
    public static final String CACHE_PERMISSION_LIST_ = "permission_List_";

    /**
     * 获取当前用户
     *
     * @return 取不到返回 new User()
     */
    public static User getUser() {
        Principal principal = getPrincipal();
        if (principal != null) {
            User user = get(principal.getId());
            if (user != null) {
                return user;
            }
            return new User();
        }
        // 如果没有登录，则返回实例化空的User对象。
        User user = new User();
        user.setDefault();
        return user;
    }

    /**
     * 获取授权主要对象
     */
    public static Subject getSubject() {
        return SecurityUtils.getSubject();
    }

    /**
     * 获取当前登录者对象
     */
    public static Principal getPrincipal() {
        try {
            Subject subject = SecurityUtils.getSubject();
            Principal principal = (Principal) subject.getPrincipal();
            if (principal != null) {
                return principal;
            }
            // subject.logout();
        } catch (UnavailableSecurityManagerException e) {

        } catch (InvalidSessionException e) {

        }
        return null;
    }

    /**
     * 根据ID获取用户
     *
     * @param id
     * @return 取不到返回null
     */
    public static User get(String id) {
        User user = (User) CacheUtils.get(USER_CACHE, USER_CACHE_ID_ + id);
        if (user == null) {
            user = userService.selectById(id);
            if (user == null) {
                return null;
            }
            CacheUtils.put(USER_CACHE, USER_CACHE_ID_ + user.getId(), user);
            CacheUtils.put(USER_CACHE, USER_CACHE_USER_NAME_ + user.getUsername(), user);
        }
        return user;
    }

    public static void update(String id) {
        User user = userService.selectById(id);
        if (user == null) {
            return;
        }
        CacheUtils.put(USER_CACHE, USER_CACHE_ID_ + user.getId(), user);
        CacheUtils.put(USER_CACHE, USER_CACHE_USER_NAME_ + user.getUsername(), user);
    }

    /**
     * 根据用户名获取用户
     *
     * @param username
     * @return
     */
    public static User getByUserName(String username) {
        User user = (User) CacheUtils.get(USER_CACHE, USER_CACHE_USER_NAME_ + username);
        if (user == null) {
            user = userService.findByUsername(username);
            if (user == null) {
                return null;
            }
            CacheUtils.put(USER_CACHE, USER_CACHE_ID_ + user.getId(), user);
            CacheUtils.put(USER_CACHE, USER_CACHE_USER_NAME_ + user.getUsername(), user);
        }
        return user;
    }

    /**
     * 清除当前用户缓存
     */
    public static void clearCache() {
        UserUtils.clearCache(getUser());
    }

    /**
     * 清除指定用户缓存
     *
     * @param user
     */
    public static void clearCache(User user) {
        CacheUtils.remove(USER_CACHE, USER_CACHE_ID_ + user.getId());
        CacheUtils.remove(USER_CACHE, USER_CACHE_USER_NAME_ + user.getUsername());
        CacheUtils.remove(USER_CACHE, CACHE_ROLE_LIST_ + user.getId());
    }

    /**
     * 获取当前用户角色列表
     *
     * @return
     */
    public static List<Role> getRoleList() {
        User user = getUser();
        List<Role> roleList = (List<Role>) CacheUtils.get(USER_CACHE, CACHE_ROLE_LIST_ + user.getId());
        if (roleList == null || roleList.size() == 0) {
            roleList = roleService.findListByUserId(user.getId());
            // 不加入缓存
            CacheUtils.put(USER_CACHE, CACHE_ROLE_LIST_ + user.getId(), roleList);
        }
        return roleList;
    }

    public static Set<String> getRoleStringList() {
        Set<Role> roles = Sets.newConcurrentHashSet(getRoleList());
        return Sets.newHashSet(Collections2.transform(roles, new Function<Role, String>() {
            @Override
            public String apply(Role role) {
                return role.getCode();
            }
        }));
    }

    public static boolean hasRole(String roleCode) {
        Set<String> roleCodeList = getRoleStringList();
        for (String roleCodeItem : roleCodeList) {
            if (roleCodeItem.equals(roleCode)) {
                return Boolean.TRUE;
            }
        }
        return Boolean.FALSE;
    }

    public static Set<String> getPermissionsList() {
        List<String> permissionList = UserUtils.getPermissionList();
        Set<String> permissionsList = Sets.newConcurrentHashSet();
        for (String permission : permissionList) {
            if (StringUtils.isNotBlank(permission)) {
                // 添加基于Permission的权限信息
                for (String permissionItem : StringUtils.split(permission, ",")) {
                    if (StringUtils.isNotBlank(permissionItem)) {
                        permissionsList.add(permissionItem);
                    }
                }
            }
        }
        return permissionsList;
    }

    /**
     * 获取当前用户授权菜单
     *
     * @return
     */
    public static List<String> getPermissionList() {
        User user = getUser();
        List<String> permissionList = (List<String>) CacheUtils.get(USER_CACHE, CACHE_PERMISSION_LIST_ + user.getId());
        permissionList = null;
        if (permissionList == null) {
            permissionList = menuService.findPermissionByUserId(user.getId());
            // 不加入缓存
            CacheUtils.put(USER_CACHE, CACHE_PERMISSION_LIST_ + user.getId(), permissionList);
        }
        return permissionList;
    }
}
