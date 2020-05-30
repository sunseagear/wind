package com.sunseagear.common.utils.convert;

import com.sunseagear.common.utils.DateUtils;
import org.springframework.util.StringUtils;

import java.beans.PropertyEditorSupport;
import java.util.Date;

/**
 * 时间处理类
 *
 * @version V 1.0
 * @date 2016-12-21
 */
public class DateConvertEditor extends PropertyEditorSupport {

    public void setAsText(String text) throws IllegalArgumentException {
        if (StringUtils.hasText(text)) {
            try {
                Date date = DateUtils.parseDate(text);
                if (date == null) {
                    long value = Long.parseLong(text);
                    date = new Date(value);
                }
                setValue(date);
            } catch (Exception ex) {
                try {
                } catch (Exception e) {
                    IllegalArgumentException iae = new IllegalArgumentException("Could not parse date: " + ex.getMessage());
                    iae.initCause(ex);
                    throw iae;
                }
            }
        } else {
            setValue(null);
        }
    }
}
