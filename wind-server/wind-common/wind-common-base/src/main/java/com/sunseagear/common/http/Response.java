package com.sunseagear.common.http;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sunseagear.common.utils.DateUtils;
import com.sunseagear.common.utils.StringUtils;
import com.google.gson.*;
import org.apache.commons.text.StringEscapeUtils;

import java.lang.reflect.Type;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.common.http
 * @title:
 * @description: 数据响应实体 * @date: 2018/6/24 21:41
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public class Response {
    private static final int OK_CODE = 0;
    private static final int ERROR_CODE = 500;

    public static String ok() {
        return successJson("");
    }

    public static String ok(String msg) {
        return successJson(msg);
    }


    public static String error(String msg) {
        return failJson(ERROR_CODE, msg);
    }

    public static String error(int code, String msg) {
        return failJson(code, msg);
    }


    private static Gson gson;

    static {
        gson = createGson(null, false);
    }


    public static Gson getGson() {
        return getGson(null, false);
    }

    public static Gson getGson(String fields) {
        return getGson(fields, true);
    }

    public static Gson getGson(String fields, boolean isInclude) {
        if (StringUtils.isEmpty(fields)) {
            return gson;
        }
        return createGson(fields, isInclude);

    }

    //如果isInclude为true，保留fields中的字段，否则是不保留
    private static Gson createGson(String fields, boolean isInclude) {
        GsonBuilder gsonBuilder = new GsonBuilder();
        gsonBuilder.registerTypeAdapter(Date.class, new JsonSerializer<Date>() {
            public JsonElement serialize(Date src, Type typeOfSrc, JsonSerializationContext context) {
                return new JsonPrimitive(DateUtils.formatDateTime(src));
            }
        });

        gsonBuilder.registerTypeAdapter(Date.class, new JsonDeserializer() {
            public Date deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
                return DateUtils.parseDate(json.getAsJsonPrimitive().getAsString());
            }
        });

        gsonBuilder.registerTypeAdapter(String.class, new JsonSerializer<String>() {
            public JsonElement serialize(String src, Type typeOfSrc, JsonSerializationContext context) {
                return new JsonPrimitive(StringEscapeUtils.unescapeHtml4(src));
            }
        });

        gsonBuilder.registerTypeAdapter(String.class, new JsonDeserializer() {
            public String deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
                return StringEscapeUtils.escapeHtml4(json.getAsJsonPrimitive().getAsString());
            }
        });

        gsonBuilder.setPrettyPrinting();
        gsonBuilder.disableHtmlEscaping();

        if (!StringUtils.isEmpty(fields)) {

            String[] fieldArray = fields.split(",");
            HashSet<String> fieldSet = new HashSet<>();
            for (String field : fieldArray) {
                fieldSet.add(field);
            }

            gsonBuilder.setExclusionStrategies(new ExclusionStrategy() {
                @Override
                public boolean shouldSkipField(FieldAttributes fieldAttributes) {
                    if (fieldAttributes.getDeclaringClass() == Result.class) {
                        return false;
                    }
                    if (fieldSet.contains(fieldAttributes.getName())) {
                        return !isInclude;
                    }

                    return isInclude;
                }

                @Override
                public boolean shouldSkipClass(Class<?> aClass) {
                    return false;
                }
            });
        }


//        gsonBuilder.excludeFieldsWithoutExposeAnnotation();
//        gsonBuilder.serializeNulls();
        return gsonBuilder.create();
    }

    public static String successJson(String message) {
        return gson.toJson(new Result(message));
    }

    public static <T> String successJson(T object) {
        return successJson(object, null);
    }

    public static <T> String successJson(T object, String includesProperties) {
        return getGson(includesProperties).toJson(new Result(object));
    }

    public static String successPageJson(Page object) {
        return successPageJson(object, null);
    }

    public static String successPageJson(Page object, String includesProperties) {
        return getGson(includesProperties).toJson(new PageResult(object));
    }

    public static String successPageJson(Page object, String includesProperties, boolean isInclude) {
        return getGson(includesProperties, isInclude).toJson(new PageResult(object));
    }

    public static <T> String toJson(T object, String mesage) {
        return gson.toJson(new Result(mesage, object));

    }

    public static String failJson(String msg) {
        return failJson(ERROR_CODE, msg);
    }

    public static String failJson(int code, String msg) {
        return gson.toJson(new Result(code, msg));
    }

    public static class Result extends HashMap<String, Object> {

        public Result(Object data) {
            put("code", OK_CODE);
            put("msg", "操作成功");
            put("data", data);
        }

        public Result(String msg) {
            put("code", OK_CODE);
            put("msg", msg);
        }

        public Result(int code, String msg) {
            put("code", code);
            put("msg", msg);
        }

        public Result(int code, String msg, Object data) {
            put("code", code);
            put("msg", msg);
            put("data", data);
        }

        public Result(String msg, Object data) {
            put("code", OK_CODE);
            put("msg", msg);
            put("data", data);
        }


    }

    public static class PageResult extends Result {

        public PageResult(Page data) {
            super(data.getRecords());
            put("pages", data.getPages());
            put("total", data.getTotal());
        }

        public PageResult(int code, String msg) {
            super(code, msg);
        }

        public PageResult(int code, String msg, Page data) {
            super(code, msg, data.getRecords());
            put("pages", data.getPages());
            put("total", data.getTotal());

        }

        public PageResult(String msg, Page data) {
            super(msg, data.getRecords());
            put("pages", data.getPages());
            put("total", data.getTotal());
        }

    }

}
