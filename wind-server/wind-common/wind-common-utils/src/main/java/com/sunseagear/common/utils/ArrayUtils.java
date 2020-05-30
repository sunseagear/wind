package com.sunseagear.common.utils;

import java.util.ArrayList;
import java.util.List;

public class ArrayUtils extends org.apache.commons.lang3.ArrayUtils {
    public static List<String> split(final String str, final String separatorChar) {
        List<String> strList = new ArrayList<String>();
        String[] strs = StringUtils.split(str, separatorChar);
        for (String string : strs) {
            strList.add(string);
        }
        return strList;
    }

    public static String join(final List<String> str, final String separatorChar) {
        final StringBuffer strList = new StringBuffer();
        str.forEach(item -> {
            strList.append(separatorChar).append(item);
        });
        String result = strList.toString().substring(1);
        return result;
    }
}
