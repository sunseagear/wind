package com.sunseagear.common.utils.websocket;


import com.sunseagear.common.utils.websocket.processor.JsonProcessor;
import com.sunseagear.common.utils.websocket.processor.SocketMessage;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.util.HashMap;

public class MessageDispatcher {

    private HashMap<Integer, JsonProcessor> jsonProcessorHashMap = new HashMap<>();

    private JsonProcessor errorProcessor;

    public MessageDispatcher() {
    }

    public void register(int code, JsonProcessor jsonProcessor) {
        jsonProcessorHashMap.put(code, jsonProcessor);
    }

    public void unRegister(int code, JsonProcessor jsonProcessor) {
        jsonProcessorHashMap.remove(code);
    }

    public JsonProcessor getProcessor(int code) {
        if (jsonProcessorHashMap.containsKey(code)) {
            return jsonProcessorHashMap.get(code);
        }
        return null;
    }

    public void dispatch(SocketMessage message) {
        if (jsonProcessorHashMap.containsKey(message.getCode())) {
            jsonProcessorHashMap.get(message.getCode()).preProcess(message);
        } else {
            processError(String.format("code:%s,data:%s", message.getCode(), message.getRawData()));
        }
    }

    public void dispatch(String msg) {
        JsonObject jsonObject = null;
        try {
            jsonObject = (JsonObject) new JsonParser().parse(msg);
        } catch (Exception e) {
            processError(String.format("socketMessage parse error: %s", msg));
            return;
        }
        int code = jsonObject.get("code").getAsInt();
        String data = jsonObject.get("data").toString();
        String userId = jsonObject.get("userId").getAsString();
        String message = jsonObject.get("message").getAsString();
        Boolean isSuccess = jsonObject.get("success").getAsBoolean();

        SocketMessage socketMessage = new SocketMessage();
        socketMessage.setCode(code);
        socketMessage.setUserId(userId);
        socketMessage.setRawData(data);
        socketMessage.setMessage(message);
        socketMessage.setSuccess(isSuccess);
        dispatch(socketMessage);

    }

    public void setErrorProcessor(JsonProcessor errorProcessor) {
        this.errorProcessor = errorProcessor;
    }

    public void processError(String errorMessage) {
        if (errorProcessor != null) {
            SocketMessage<String> message = new SocketMessage();
            message.setCode(SocketMessage.ERROR_CODE);
            message.setRawData(errorMessage);
            errorProcessor.process(message);
        }
    }
}
