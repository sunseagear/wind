package com.sunseagear.common.utils;

import com.sunseagear.common.utils.entity.JsonResult;
import com.sunseagear.common.utils.entity.ServerPageResult;
import com.google.gson.*;
import com.google.gson.reflect.TypeToken;
import com.google.gson.stream.JsonReader;
import org.apache.commons.text.StringEscapeUtils;

import java.io.IOException;
import java.io.StringReader;
import java.lang.reflect.Type;
import java.util.*;

public class JsonUtils {
    public static final int Default = 0;
    public static final int Empty = -1;
    public static final String DEFAULT_DATE_PATTERN = "yyyy-MM-dd HH:mm:ss SSS";

    private static Gson gson;

    static {
        gson = createGson(null, false);
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
                return new JsonPrimitive(Long.valueOf(src.getTime()));
            }
        }).setDateFormat(1);

        gsonBuilder.registerTypeAdapter(Date.class, new JsonDeserializer() {
            public Date deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
                return new Date(json.getAsJsonPrimitive().getAsLong());
            }
        }).setDateFormat(1);

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

        HashSet<String> fieldSet = new HashSet<>();
        if (!StringUtils.isEmpty(fields)) {
            String[] fieldArray = fields.split(",");
            for (String field : fieldArray) {
                fieldSet.add(field);
            }
        }

        gsonBuilder.setExclusionStrategies(new ExclusionStrategy() {
            @Override
            public boolean shouldSkipField(FieldAttributes fieldAttributes) {
                if (fieldAttributes.getName().contains("CGLIB")
                        || fieldAttributes.getName().equals("createBy")
                        || fieldAttributes.getName().equals("createDate")
                        || fieldAttributes.getName().equals("updateBy")
                        || fieldAttributes.getName().equals("updateDate")
                        || fieldAttributes.getName().equals("delFlag")
                        || fieldAttributes.getName().equals("currentUser")) {
                    return true;
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
        return gsonBuilder.create();
    }

    public static String objectToJsonString(Object obj) {
        String result = gson.toJson(obj);
        return result;
    }

    public static <T> T jsonStringToObject(String jsonString, Type type) {
        return gson.fromJson(jsonString, type);
    }

    public static <T> T jsonStringToObject(String jsonString, Class<T> clazz) {
        return gson.fromJson(jsonString, clazz);
    }

    public static <T> T[] jsonStringToObjects(String jsonString, Class<T[]> clazz) {
        return (T[]) gson.fromJson(jsonString, clazz);
    }

    public static <T> Map<String, T> jsonToMap(String jsonString) {
        Type type = new TypeToken() {
        }.getType();
        Map resultMap = (Map) gson.fromJson(jsonString, type);
        return resultMap;
    }

    public static <T> List<T> jsonStringToListBean(String jsonString, Class<T> clazz) {
        if (StringUtils.isBlank(jsonString)) {
            return new ArrayList();
        }
        JsonParser parser = new JsonParser();
        JsonElement el = parser.parse(jsonString);
        JsonArray jsonArray = null;
        if (el.isJsonArray()) {
            jsonArray = el.getAsJsonArray();
        }
        List listT = new ArrayList();
        if (jsonArray != null) {
            Iterator it = jsonArray.iterator();
            while (it.hasNext()) {
                JsonElement e = (JsonElement) it.next();

                listT.add(gson.fromJson(e, clazz));
            }

        }

        return listT;
    }

    public static Object getValue(String jsonString, String key) {
        Object result = null;
        JsonReader reader = new JsonReader(new StringReader(jsonString));
        reader.setLenient(true);
        try {
            reader.beginArray();
            while (reader.hasNext()) {
                reader.beginObject();
                while (reader.hasNext()) {
                    String tagName = reader.nextName();
                    if (tagName.equals(key)) {
                        result = reader.nextString();
                        break;
                    }
                }
                reader.endObject();
            }
            reader.endArray();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                reader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public static String successMessage(Object data, String includesProperties, boolean isInclude) {
        return getGson(includesProperties, isInclude).toJson(new JsonResult(true, "操作成功", data));
    }

    public static <T> String successMessage(String message) {
        return successMessage(message, "");
    }

    public static <T> String successMessage(String message, int statusCode) {
        return successMessage(message, statusCode, "");
    }

    public static <T> String successMessage(String message, T data) {
        return successMessage(message, 0, data);
    }

    public static <T> String successMessage(T data) {
        return successMessage("操作成功", 0, data);
    }

    public static <T> String successMessage(String message, int statusCode, T data) {
        return gson.toJson(new JsonResult(true, message, data));
    }

    public static <T> String failMessage(String message) {
        return gson.toJson(new JsonResult(false, message, ""));
    }


    public static <T> String serverPageMessage(boolean status, String message, int total, T data) {
        return gson.toJson(new ServerPageResult(status, message, total, data));
    }

    public static class ContextUrlAdapter implements JsonSerializer<String> {

        @Override
        public JsonElement serialize(String s, Type type, JsonSerializationContext jsonSerializationContext) {
            if (!StringUtils.startsWith(s,"http")){
                return new JsonPrimitive(ServletUtils.getContextUrl(ServletUtils.getRequest()) + s);
            }
            return new JsonPrimitive(s);
        }
    }
}
