package com.sunseagear.common.utils;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;

public class PinyinUtils {
    private static HanyuPinyinOutputFormat format = null;

    public static String getPinYin(String str, boolean toUpperCase) {
        StringBuilder sb = new StringBuilder();
        String tempPinyin = null;
        try {
            for (int i = 0; i < str.length(); i++) {
                String[] pinyin = PinyinHelper.toHanyuPinyinStringArray(str.charAt(i), format);
                tempPinyin = pinyin == null ? null : pinyin[0];
                if (tempPinyin == null) {
                    sb.append(str.charAt(i));
                } else sb.append(tempPinyin);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (!toUpperCase) {
            return sb.toString().toLowerCase();
        }
        return sb.toString();
    }

    public static String getPinYinHeadChar(String str) {
        String convert = "";
        for (int j = 0; j < str.length(); j++) {
            char word = str.charAt(j);

            String[] pinyinArray = PinyinHelper.toHanyuPinyinStringArray(word);
            if (pinyinArray != null)
                convert = convert + pinyinArray[0].charAt(0);
            else {
                convert = convert + word;
            }
        }
        return convert.toUpperCase();
    }

    static {
        format = new HanyuPinyinOutputFormat();
        format.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
        format.setCaseType(HanyuPinyinCaseType.UPPERCASE);
    }
}

