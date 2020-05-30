package com.sunseagear.common.utils;

import com.sunseagear.common.utils.entity.Principal;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.subject.Subject;

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
public class UserUtils {

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

    public static String getTenantId() {
        Principal principal = getPrincipal();
        if (principal == null) {
            return null;
        }
        return principal.getTenantId();
    }


}
