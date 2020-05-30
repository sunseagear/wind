package com.sunseagear.wind.utils;

import com.sunseagear.common.utils.CacheUtils;
import com.sunseagear.common.utils.SpringContextHolder;
import com.sunseagear.wind.modules.sys.service.IDictService;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.utils
 * @title:
 * @description: Cache工具类 * @date: 2018/3/22 16:11
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public class DictUtils {

    public static String DICT_CACHE_KEY = "DICT_CACHE_KEY";
    protected final static String DICT_CACHE_NAME = "dictCache";

    public static Map<String, List<Dict>> getDict() {
        //数据字典
        if (CacheUtils.get(DICT_CACHE_NAME, DICT_CACHE_KEY) == null) {
            initDict();
        }
        initDict();
        return (Map<String, List<Dict>>) CacheUtils.get(DICT_CACHE_NAME, DICT_CACHE_KEY);
    }

    /**
     * 数据字典初始化
     *
     * @return
     */
    public static Map<String, List<Dict>> initDict() {
        Map<String, List<Dict>> dictMap = new HashMap<String, List<Dict>>();
        for (com.sunseagear.wind.modules.sys.entity.Dict dict : SpringContextHolder.getBean(IDictService.class).selectDictList()) {
            List<Dict> dictList = dictMap.get(dict.getCode());
            if (dictList != null) {
                dictList.add(new Dict(dict.getLabel(), dict.getValue()));
            } else {
                dictMap.put(dict.getCode(),
                        Lists.newArrayList(new Dict(dict.getLabel(), dict.getValue())));
            }
        }
        putDict(dictMap);
        return dictMap;
    }

    public static List<Dict> getDictList(String code) {
        //数据字典
        if (CacheUtils.get(DICT_CACHE_NAME, DICT_CACHE_KEY) == null) {
            initDict();
        }
        Map<String, List<Dict>> dictMap = (Map<String, List<Dict>>) CacheUtils.get(DICT_CACHE_NAME, DICT_CACHE_KEY);
        List<Dict> dictList = dictMap.get(code);
        if (dictList == null) {
            dictList = new ArrayList<Dict>();
        }
        return dictList;
    }

    /**
     * 放入缓存
     *
     * @param dictMap
     */
    public static void putDict(Map<String, List<Dict>> dictMap) {
        CacheUtils.put(DICT_CACHE_NAME, DICT_CACHE_KEY, dictMap);
    }

    public static String getDictLabel(String code, String value, String defaultValue) {
        if (StringUtils.isNotBlank(code) && StringUtils.isNotBlank(value)) {
            for (Dict dict : getDictList(code)) {
                if (value.equals(dict.getValue())) {
                    return dict.getLabel();
                }
            }
        }
        return defaultValue;
    }

    public static String getDictLabels(String values, String code, String defaultValue) {
        if (StringUtils.isNotBlank(code) && StringUtils.isNotBlank(values)) {
            List<String> valueList = new ArrayList<String>();
            for (String value : StringUtils.split(values, ",")) {
                valueList.add(getDictLabel(value, code, defaultValue));
            }
            return StringUtils.join(valueList, ",");
        }
        return defaultValue;
    }

    public static String getDictValue(String label, String code, String defaultLabel) {
        if (StringUtils.isNotBlank(code) && StringUtils.isNotBlank(label)) {
            for (Dict dict : getDictList(code)) {
                if (label.equals(dict.getLabel())) {
                    return dict.getValue();
                }
            }
        }
        return defaultLabel;
    }

    /*
     * 清除换成
     */
    public static void clear() {
        CacheUtils.remove(DICT_CACHE_NAME, DICT_CACHE_KEY);
    }

    /**
     * 返回字典
     */
    public static class Dict implements Serializable {
        private String label;
        private String value;

        public Dict() {

        }

        public Dict(String label, String value) {
            this.label = label;
            this.value = value;
        }

        public String getLabel() {
            return label;
        }

        public void setLabel(String label) {
            this.label = label;
        }

        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
        }
    }
}
