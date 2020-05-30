package com.sunseagear.common.utils;

import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.beans.BeansException;
import org.springframework.beans.PropertyAccessorFactory;
import org.springframework.cglib.beans.BeanCopier;
import org.springframework.lang.Nullable;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.*;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @ClassName: BeanUtils
 * @Description:Bean操作类 * @date: 2017年3月1日 上午8:50:31
 * @Copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public class BeanUtils extends org.springframework.beans.BeanUtils {
    /**
     * 判断一个类是否为基本数据类型。
     *
     * @param clazz 要判断的类。
     * @return true 表示为基本数据类型。
     */
    public static boolean isBaseDataType(Class<?> clazz) throws Exception {
        return (clazz.equals(String.class) || clazz.equals(Integer.class) || clazz.equals(Byte.class)
                || clazz.equals(Long.class) || clazz.equals(Double.class) || clazz.equals(Float.class)
                || clazz.equals(Character.class) || clazz.equals(Short.class) || clazz.equals(BigDecimal.class)
                || clazz.equals(BigInteger.class) || clazz.equals(Boolean.class) || clazz.equals(Date.class)
                || clazz.isPrimitive());
    }

    public static String[] getNullPropertyNames(Object source) {
        final BeanWrapper src = new BeanWrapperImpl(source);
        java.beans.PropertyDescriptor[] pds = src.getPropertyDescriptors();

        Set<String> emptyNames = new HashSet<>();
        for (java.beans.PropertyDescriptor pd : pds) {
            Object srcValue = src.getPropertyValue(pd.getName());
            if (srcValue == null) {
                emptyNames.add(pd.getName());
            }
        }
        String[] result = new String[emptyNames.size()];
        return emptyNames.toArray(result);
    }

    public static void copyPropertiesIgnoreNull(Object src, Object target) {
        copyProperties(src, target, getNullPropertyNames(src));
    }

    /**
     * 实例化对象
     *
     * @param clazz 类
     * @param <T>   泛型标记
     * @return 对象
     */
    @SuppressWarnings("unchecked")
    public static <T> T newInstance(Class<?> clazz) {
        return (T) instantiateClass(clazz);
    }

    /**
     * 实例化对象
     *
     * @param clazzStr 类名
     * @param <T>      泛型标记
     * @return 对象
     */
    public static <T> T newInstance(String clazzStr) {
        try {
            Class<?> clazz = ClassUtil.forName(clazzStr, null);
            return newInstance(clazz);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 获取Bean的属性, 支持 propertyName 多级 ：test.user.name
     *
     * @param bean         bean
     * @param propertyName 属性名
     * @return 属性值
     */
    @Nullable
    public static Object getProperty(@Nullable Object bean, String propertyName) {
        if (bean == null) {
            return null;
        }
        BeanWrapper beanWrapper = PropertyAccessorFactory.forBeanPropertyAccess(bean);
        return beanWrapper.getPropertyValue(propertyName);
    }

    /**
     * 设置Bean属性, 支持 propertyName 多级 ：test.user.name
     *
     * @param bean         bean
     * @param propertyName 属性名
     * @param value        属性值
     */
    public static void setProperty(Object bean, String propertyName, Object value) {
        Objects.requireNonNull(bean, "bean Could not null");
        BeanWrapper beanWrapper = PropertyAccessorFactory.forBeanPropertyAccess(bean);
        beanWrapper.setPropertyValue(propertyName, value);
    }

    /**
     * 深复制
     *
     * <p>
     * 支持 map bean
     * </p>
     *
     * @param source 源对象
     * @param <T>    泛型标记
     * @return T
     */
    @SuppressWarnings("unchecked")
    @Nullable
    public static <T> T clone(@Nullable T source) {
        if (source == null) {
            return null;
        }
        return (T) copy(source, source.getClass());
    }

    /**
     * copy 对象属性，默认不使用Convert
     *
     * <p>
     * 支持 map bean copy
     * </p>
     *
     * @param source 源对象
     * @param clazz  类名
     * @param <T>    泛型标记
     * @return T
     */
    @Nullable
    public static <T> T copy(@Nullable Object source, Class<T> clazz) {
        if (source == null) {
            return null;
        }
        return copy(source, source.getClass(), clazz);
    }

    /**
     * copy 对象属性，默认不使用Convert
     *
     * <p>
     * 支持 map bean copy
     * </p>
     *
     * @param source      源对象
     * @param sourceClazz 源类型
     * @param targetClazz 转换成的类型
     * @param <T>         泛型标记
     * @return T
     */
    @Nullable
    public static <T> T copy(@Nullable Object source, Class sourceClazz, Class<T> targetClazz) {
        if (source == null) {
            return null;
        }
        BeanCopier copier = BeanCopier.create(sourceClazz, targetClazz, false);
        T to = newInstance(targetClazz);
        copier.copy(source, to, null);
        return to;
    }

    /**
     * copy 列表对象，默认不使用Convert
     *
     * <p>
     * 支持 map bean copy
     * </p>
     *
     * @param sourceList  源列表
     * @param targetClazz 转换成的类型
     * @param <T>         泛型标记
     * @return T
     */
    public static <T> List<T> copy(@Nullable Collection<?> sourceList, Class<T> targetClazz) {
        if (sourceList == null || sourceList.isEmpty()) {
            return Collections.emptyList();
        }
        List<T> outList = new ArrayList<>(sourceList.size());
        Class<?> sourceClazz = null;
        for (Object source : sourceList) {
            if (source == null) {
                continue;
            }
            if (sourceClazz == null) {
                sourceClazz = source.getClass();
            }
            T bean = copy(source, sourceClazz, targetClazz);
            outList.add(bean);
        }
        return outList;
    }

    /**
     * 拷贝对象
     *
     * <p>
     * 支持 map bean copy
     * </p>
     *
     * @param source     源对象
     * @param targetBean 需要赋值的对象
     */
    public static void copy(@Nullable Object source, @Nullable Object targetBean) {
        if (source == null || targetBean == null) {
            return;
        }
        BeanCopier copier = BeanCopier
                .create(source.getClass(), targetBean.getClass(), false);

        copier.copy(source, targetBean, null);
    }

    /**
     * 拷贝对象，source 属性做 null 判断，Map 不支持，map 会做 instanceof 判断，不会
     *
     * <p>
     * 支持 bean copy
     * </p>
     *
     * @param source     源对象
     * @param targetBean 需要赋值的对象
     */
    public static void copyNonNull(@Nullable Object source, @Nullable Object targetBean) {
        if (source == null || targetBean == null) {
            return;
        }
        BeanCopier copier = BeanCopier
                .create(source.getClass(), targetBean.getClass(), false);

        copier.copy(source, targetBean, null);
    }

    /**
     * Copy the property values of the given source bean into the target class.
     * <p>Note: The source and target classes do not have to match or even be derived
     * from each other, as long as the properties match. Any bean properties that the
     * source bean exposes but the target bean does not will silently be ignored.
     * <p>This is just a convenience method. For more complex transfer needs,
     *
     * @param source      the source bean
     * @param targetClazz the target bean class
     * @param <T>         泛型标记
     * @return T
     * @throws BeansException if the copying failed
     */
    @Nullable
    public static <T> T copyProperties(@Nullable Object source, Class<T> targetClazz) throws BeansException {
        if (source == null) {
            return null;
        }
        T to = newInstance(targetClazz);
        copyProperties(source, to);
        return to;
    }

    /**
     * Copy the property values of the given source bean into the target class.
     * <p>Note: The source and target classes do not have to match or even be derived
     * from each other, as long as the properties match. Any bean properties that the
     * source bean exposes but the target bean does not will silently be ignored.
     * <p>This is just a convenience method. For more complex transfer needs,
     *
     * @param sourceList  the source list bean
     * @param targetClazz the target bean class
     * @param <T>         泛型标记
     * @return List
     * @throws BeansException if the copying failed
     */
    public static <T> List<T> copyProperties(@Nullable Collection<?> sourceList, Class<T> targetClazz) throws BeansException {
        if (sourceList == null || sourceList.isEmpty()) {
            return Collections.emptyList();
        }
        List<T> outList = new ArrayList<>(sourceList.size());
        for (Object source : sourceList) {
            if (source == null) {
                continue;
            }
            T bean = copyProperties(source, targetClazz);
            outList.add(bean);
        }
        return outList;
    }

    public static <T> T map2bean(Map<Object, Object> map, Class<T> beanType) {
        T t = null;
        try {
            t = beanType.newInstance();
            PropertyDescriptor[] pds = Introspector.getBeanInfo(beanType, Object.class)
                    .getPropertyDescriptors();
            for (PropertyDescriptor pd : pds) {
                for (Map.Entry entry : map.entrySet()) {
                    if (entry.getKey().equals(pd.getName())) {
                        pd.getWriteMethod().invoke(t, entry.getValue());
                    }
                }
            }
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (IntrospectionException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        return t;
    }

    public static Map<Object, Object> bean2map(Object bean) {

        Map<Object, Object> map = new HashMap<>();
        try {
            BeanInfo info = Introspector.getBeanInfo(bean.getClass(), Object.class);
            PropertyDescriptor[] pds = info.getPropertyDescriptors();
            for (PropertyDescriptor pd : pds) {
                Object key = pd.getName();
                Object value = pd.getReadMethod().invoke(bean);
                map.put(key, value);
            }
        } catch (IntrospectionException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        return map;
    }

}
