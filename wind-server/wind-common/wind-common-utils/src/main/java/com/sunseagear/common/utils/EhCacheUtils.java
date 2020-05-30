package com.sunseagear.common.utils;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @title: StringUtils.java
 * @package com.sunseagear.common.util
 * @description: 缓存基础类 * @date:   2017年6月27日 下午10:41:03
 * @copyright: 2017  www.sunseagear.com Inc. All rights reserved.
 */
public class EhCacheUtils extends ObjectSwitchHelper {

    private static CacheManager manager = CacheManager.getInstance();
    private Cache cache = null;

    public EhCacheUtils() {

    }

    public EhCacheUtils(String cacheName) {
        load(cacheName);
    }

    /**
     * 加载缓存
     *
     * @param cacheName
     */
    public void load(String cacheName) {
        cache = manager.getCache(cacheName);
    }

    @Override
    public Object get(String key) {
        if (cache != null) {
            Element element = cache.get(key);
            if (element != null) {
                return element.getObjectValue();
            }
        }
        return null;
    }

    @Override
    public void set(String key, Object value) {
        if (cache != null) {
            cache.put(new Element(key, value));
        }
    }

    @Override
    public boolean remove(String key) {
        if (cache != null) {
            return cache.remove(key);
        }
        return false;
    }

    /**
     * @title: removeAll
     * @description: 清除所有緩存
     * @return: void
     */
    public void removeAll() {
        if (cache != null) {
            cache.removeAll();
        }
    }

}
