package com.sunseagear.common.utils.websocket.processor;

import lombok.Data;

@Data
public class SocketMessage<T> {

    public static final int ERROR_CODE = -1;
    public static final int OPEN_CODE = 1;
    public static final int CLOSE_CODE = 2;


    private int code;
    protected boolean success;
    protected String message;
    protected String userId;
    protected String rawData; //接收消息用，接受到的原始数据
    protected Object data;  //发送消息用，数据载体
    protected T entity;    //接收消息用，解析后的数据
}
