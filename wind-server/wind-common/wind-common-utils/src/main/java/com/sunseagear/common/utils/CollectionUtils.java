/*
 *      Copyright (c) 2018-2028, DreamLu All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions are met:
 *
 *  Redistributions of source code must retain the above copyright notice,
 *  this list of conditions and the following disclaimer.
 *  Redistributions in binary form must reproduce the above copyright
 *  notice, this list of conditions and the following disclaimer in the
 *  documentation and/or other materials provided with the distribution.
 *  Neither the name of the dreamlu.net developer nor the names of its
 *  contributors may be used to endorse or promote products derived from
 *  this software without specific prior written permission.
 *  Author: DreamLu 卢春梦 (596392912@qq.com)
 */
package com.sunseagear.common.utils;

import org.springframework.lang.Nullable;

import java.lang.reflect.Array;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 集合工具类
 *
 * @author L.cm
 */
public class CollectionUtils extends org.springframework.util.CollectionUtils {

    /**
     * Return {@code true} if the supplied Collection is not {@code null} or empty.
     * Otherwise, return {@code false}.
     *
     * @param collection the Collection to check
     * @return whether the given Collection is not empty
     */
    public static boolean isNotEmpty(@Nullable Collection<?> collection) {
        return !CollectionUtils.isEmpty(collection);
    }

    /**
     * Return {@code true} if the supplied Map is not {@code null} or empty.
     * Otherwise, return {@code false}.
     *
     * @param map the Map to check
     * @return whether the given Map is not empty
     */
    public static boolean isNotEmpty(@Nullable Map<?, ?> map) {
        return !CollectionUtils.isEmpty(map);
    }

    /**
     * Check whether the given Array contains the given element.
     *
     * @param array   the Array to check
     * @param element the element to look for
     * @param <T>     The generic tag
     * @return {@code true} if found, {@code false} else
     */
    public static <T> boolean contains(@Nullable T[] array, final T element) {
        if (array == null) {
            return false;
        }
        return Arrays.stream(array).anyMatch(x -> org.springframework.util.ObjectUtils.nullSafeEquals(x, element));
    }

    /**
     * Concatenates 2 arrays
     *
     * @param one   数组1
     * @param other 数组2
     * @return 新数组
     */
    public static String[] concat(String[] one, String[] other) {
        return concat(one, other, String.class);
    }

    /**
     * Concatenates 2 arrays
     *
     * @param one   数组1
     * @param other 数组2
     * @param clazz 数组类
     * @return 新数组
     */
    public static <T> T[] concat(T[] one, T[] other, Class<T> clazz) {
        T[] target = (T[]) Array.newInstance(clazz, one.length + other.length);
        System.arraycopy(one, 0, target, 0, one.length);
        System.arraycopy(other, 0, target, one.length, other.length);
        return target;
    }

    /**
     * 对象是否为数组对象
     *
     * @param obj 对象
     * @return 是否为数组对象，如果为{@code null} 返回false
     */
    public static boolean isArray(Object obj) {
        if (null == obj) {
            return false;
        }
        return obj.getClass().isArray();
    }

    /**
     * 不可变 Set
     *
     * @param es  对象
     * @param <E> 泛型
     * @return 集合
     */
    @SafeVarargs
    public static <E> Set<E> ofImmutableSet(E... es) {
        Objects.requireNonNull(es, "args es is null.");
        return Arrays.stream(es).collect(Collectors.toSet());
    }

    /**
     * 不可变 List
     *
     * @param es  对象
     * @param <E> 泛型
     * @return 集合
     */
    @SafeVarargs
    public static <E> List<E> ofImmutableList(E... es) {
        Objects.requireNonNull(es, "args es is null.");
        return Arrays.stream(es).collect(Collectors.toList());
    }

    /**
     * Iterable 转换为List集合
     *
     * @param elements Iterable
     * @param <E>      泛型
     * @return 集合
     */
    public static <E> List<E> toList(Iterable<E> elements) {
        Objects.requireNonNull(elements, "elements es is null.");
        if (elements instanceof Collection) {
            return new ArrayList((Collection) elements);
        }
        Iterator<E> iterator = elements.iterator();
        List<E> list = new ArrayList<>();
        while (iterator.hasNext()) {
            list.add(iterator.next());
        }
        return list;
    }

    /**
     * 将key value 数组转为 map
     *
     * @param keysValues key value 数组
     * @param <K>        key
     * @param <V>        value
     * @return map 集合
     */
    public static <K, V> Map<K, V> toMap(Object... keysValues) {
        int kvLength = keysValues.length;
        if (kvLength % 2 != 0) {
            throw new IllegalArgumentException("wrong number of arguments for met, keysValues length can not be odd");
        }
        Map<K, V> keyValueMap = new HashMap<>(kvLength);
        for (int i = kvLength - 2; i >= 0; i -= 2) {
            Object key = keysValues[i];
            Object value = keysValues[i + 1];
            keyValueMap.put((K) key, (V) value);
        }
        return keyValueMap;
    }

}
