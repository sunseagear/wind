package com.sunseagear.common.query.data;

import com.alibaba.fastjson.serializer.SerializeFilter;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @title: PropertyPreFilterable.java
 * @package com.sunseagear.common.query.data
 * @description: JSON格式化输出 * @date: 2017年5月1日 下午9:43:09
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public interface PropertyPreFilterable {

    public SerializeFilter constructFilter(Class<?> clazz);

    public void addQueryProperty(String... properties);

    public void addIncludeFilter(Class<?> clazz, String... properties);

    public void addExcludeFilter(Class<?> clazz, String... properties);
}
