package com.sunseagear.wind.utils;

import com.sunseagear.common.utils.CookieUtils;
import com.sunseagear.common.utils.ServletUtils;
import com.sunseagear.common.utils.SpringContextHolder;
import com.sunseagear.common.utils.StringUtils;
import org.springframework.core.env.Environment;

import javax.servlet.http.Cookie;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.utils
 * @title:
 * @description: 模板样式 * @date: 2018/10/6 15:06
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public class ThemeUtils {
    /**
     * 设置样式
     *
     * @param theme 央视
     */
    public static void setTheme(String theme) {
        CookieUtils.setCookie(ServletUtils.getResponse(), "theme", theme);
    }

    /**
     * 获得样式
     *
     * @return
     */
    public static String getTheme() {
        // 默认风格
        Environment env = SpringContextHolder.getBean(Environment.class);
        String theme = env.getProperty("jeeweb.admin.default.theme");
        if (StringUtils.isEmpty(theme)) {
            theme = "uadmin";
        }
        // cookies配置中的模版
        Cookie[] cookies = ServletUtils.getRequest().getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie == null || StringUtils.isEmpty(cookie.getName())) {
                    continue;
                }
                if (cookie.getName().equalsIgnoreCase("theme")) {
                    theme = cookie.getValue();
                }
            }
        }
        return theme;
    }

}
