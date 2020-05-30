package com.sunseagear.wind.modules.websocket;

/*
 * 消息命名规范：
 * web->server:10
 * server->web:11
 * 业务代码站三位
 * 建议一个模块100的范围
 * req:1
 * ack:2
 * */
public class ConstantMessageCode {
    public static final int WEB_SERVER_HELLOW_REQ = 101001;
    public static final int SERVER_WEB_HELLOW_ACK = 111002;
}
