package com.sunseagear.common.utils;

import com.google.gson.Gson;
import org.springframework.data.redis.core.BoundHashOperations;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.List;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @title: CacheUtils.java
 * @package com.sunseagear.core.utils
 * @description: Cache工具类  * @date:   2017年6月27日 下午10:41:03
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public class CacheUtils {

    private static RedisTemplate redisTemplate;
    private static final String SYS_CACHE = "sysCache";

    /**
     * 获取SYS_CACHE缓存
     *
     * @param key
     * @return
     */
    public static Object get(String key) {
        return get(SYS_CACHE, key);
    }

    public static <T> T getJson(String key, Class<T> clazz) {
        return getJson(SYS_CACHE, key, clazz);
    }

    public static <T> List<T> getJsonListBean(String key, Class<T> clazz) {
        return getJsonListBean(SYS_CACHE, key, clazz);
    }

    /**
     * 写入SYS_CACHE缓存
     *
     * @param key
     * @return
     */
    public static void put(String key, Object value) {
        put(SYS_CACHE, key, value);
    }

    public static void putJson(String key, Object value) {
        putJson(SYS_CACHE, key, value);
    }

    /**
     * 从SYS_CACHE缓存中移除
     *
     * @param key
     * @return
     */
    public static void remove(String key) {
        remove(SYS_CACHE, key);
    }

    /**
     * 获取缓存
     *
     * @param cacheName
     * @param key
     * @return
     */
    public static Object get(String cacheName, String key) {
        return getCache(cacheName).get(key);
    }

    public static <T> T getJson(String cacheName, String key, Class<T> clazz) {
        String json = (String) getCache(cacheName).get(key);
        return new Gson().fromJson(json, clazz);
    }

    public static <T> List<T> getJsonListBean(String cacheName, String key, Class<T> clazz) {
        String json = (String) getCache(cacheName).get(key);
        return JsonUtils.jsonStringToListBean(json, clazz);
    }

    /**
     * 写入缓存
     *
     * @param cacheName
     * @param key
     * @param value
     */
    public static void put(String cacheName, String key, Object value) {
        getCache(cacheName).put(key, value);
    }


    public static void putJson(String cacheName, String key, Object value) {
        String json = new Gson().toJson(value);
        getCache(cacheName).put(key, json);
    }

    /**
     * 从缓存中移除
     *
     * @param cacheName
     * @param key
     */
    public static void remove(String cacheName, String key) {
        getCache(cacheName).delete(key);
    }

    public static void clear(String cacheName) {
        redisTemplate.delete(cacheName);
    }

    public static void clear() {
        clear(SYS_CACHE);
    }

    /**
     * 获得一个Cache，没有则创建一个。
     *
     * @param cacheName
     * @return
     */
    public static BoundHashOperations getCache(String cacheName) {
        if (redisTemplate == null) {
            redisTemplate = SpringContextHolder.getBean("redisTemplate");
        }
        return redisTemplate.boundHashOps(cacheName);
    }

}
