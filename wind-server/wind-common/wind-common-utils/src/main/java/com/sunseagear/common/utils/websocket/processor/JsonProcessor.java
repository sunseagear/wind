package com.sunseagear.common.utils.websocket.processor;

import com.google.gson.Gson;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

public abstract class JsonProcessor<T> {


    private T jsonData(String data) {
        Type type = this.getClass().getGenericSuperclass();
        if (type instanceof ParameterizedType) {
            //如果用户写了泛型，就会进入这里，否者不会执行
            ParameterizedType parameterizedType = (ParameterizedType) type;
            Type beanType = parameterizedType.getActualTypeArguments()[0];
            if (beanType == String.class) {
                //如果是String类型，直接返回字符串
                return (T) data;
            } else {
                //如果是 Bean List Map ，则解析完后返回
                return new Gson().fromJson(data, beanType);
            }
        } else {
            //如果没有写泛型，直接返回Response对象
            return (T) data;
        }
    }

    public void preProcess(SocketMessage<T> message) {
        T entity = jsonData(message.getRawData());
        message.setEntity(entity);
        process(message);
    }

    public abstract void process(SocketMessage<T> message);

}
