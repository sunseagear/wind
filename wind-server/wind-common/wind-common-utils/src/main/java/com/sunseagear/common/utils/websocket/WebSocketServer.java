package com.sunseagear.common.utils.websocket;

import com.sunseagear.common.utils.websocket.processor.SocketMessage;
import com.google.gson.Gson;
import org.springframework.context.annotation.Bean;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public abstract class WebSocketServer {

    protected static MessageDispatcher messageDispatcher = new MessageDispatcher();
    /**
     * 全部在线会话  PS: 基于场景考虑 这里使用线程安全的Map存储会话对象。
     * 以用户姓名为key
     */
    protected Map<String, Session> onlineSessions = null;
    protected static Map<String, Session> webOnlineSessions = new ConcurrentHashMap<>();

    @Bean
    public void init() {
        intiMessage();
    }

    /**
     * 当通信发生异常：打印错误日志
     */
    @OnError
    public void onError(Session session, Throwable error) {
        error.printStackTrace();
    }

    /**
     * 当客户端打开连接：1.添加会话对象 2.更新在线人数
     */
    @OnOpen
    public void onOpen(Session session, @PathParam("userId") String userId) {
        onlineSessions.put(userId, session);
    }

    /**
     * 当客户端发送消息：1.获取它的用户名和消息 2.发送消息给所有人
     * <p>
     * PS: 这里约定传递的消息为JSON字符串 方便传递更多参数！
     */
    @OnMessage
    public void onMessage(Session session, String jsonStr) {
        messageDispatcher.dispatch(jsonStr);
    }

    /**
     * 当关闭连接：1.移除会话对象 2.更新在线人数
     */
    @OnClose
    public void onClose(Session session, @PathParam("userId") String userId) {
        onlineSessions.remove(userId);
    }

    public abstract void intiMessage();

    /**
     * 公共方法：发送信息给所有人
     */
    private void sendMessageToAll(String msg) {
        onlineSessions.forEach((id, session) -> {
            try {
                session.getBasicRemote().sendText(msg);
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
    }

    public MessageDispatcher getMessageDispatcher() {
        return messageDispatcher;
    }


    public void sendSuccess(String userId, int code, String message) {
        send(userId, code, true, message, "");
    }

    public void sendFail(String userId, int code, String message) {
        send(userId, code, false, message, "");
    }

    public void send(String userId, int code, Object data) {
        send(userId, code, true, "成功", data);
    }

    public void send(String userId, int code, boolean success, String message, Object data) {
        if (onlineSessions.containsKey(userId)) {
            SocketMessage socketMessage = new SocketMessage();
            socketMessage.setCode(code);
            socketMessage.setMessage(message);
            socketMessage.setSuccess(success);
            socketMessage.setData(data);
            try {
                onlineSessions.get(userId).getBasicRemote().sendText(new Gson().toJson(socketMessage));
            } catch (IOException e) {
                e.printStackTrace();
                messageDispatcher.processError(String.format("messageSendFail:%s，message:%s", e.getMessage(), new Gson().toJson(message)));
            }
        }


    }
}
