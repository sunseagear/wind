package com.sunseagear.wind.utils;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sunseagear.common.utils.ServletUtils;
import com.sunseagear.common.utils.StringUtils;

/**
 * All rights Reserved, Designed By www.dataact.cn
 *
 * @version V1.0
 * @package com.sunseagear.wind.utils
 * @title:
 * @description: 分页 * @date: 2018/10/19 12:17
 * @copyright: 2017 www.dataact.cn Inc. All rights reserved.
 */
public class PageRequest {
    public static Page getPage() {
        String page = ServletUtils.getRequest().getParameter("page");
        String limit = ServletUtils.getRequest().getParameter("limit");
        Integer pageInt = 1;
        Integer limitInt = 20;
        if (!StringUtils.isEmpty(page)) {
            pageInt = Integer.parseInt(page);
        }
        if (!StringUtils.isEmpty(limit)) {
            limitInt = Integer.parseInt(limit);
        }
        Page pageBean = new Page(pageInt, limitInt);
        return pageBean;
    }
}
