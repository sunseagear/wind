package com.sunseagear.wind.modules.websocket.processor;

import com.sunseagear.common.utils.websocket.processor.JsonProcessor;
import com.sunseagear.common.utils.websocket.processor.SocketMessage;
import com.sunseagear.wind.modules.websocket.ConstantMessageCode;
import com.sunseagear.wind.modules.websocket.WebSocketWebCodeServer;
import com.sunseagear.wind.modules.websocket.message.WebServerHellowReqMessage;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;


@Component
@AllArgsConstructor
public class WebServerHellowRequestProcessor extends JsonProcessor<WebServerHellowReqMessage> {

    private WebSocketWebCodeServer webSocketWebCodeServer;


    @Override
    public void process(SocketMessage<WebServerHellowReqMessage> message) {
        WebServerHellowReqMessage webCodeGenReqMessage = message.getEntity();
        String userId = message.getUserId();
        webSocketWebCodeServer.send(userId, ConstantMessageCode.SERVER_WEB_HELLOW_ACK, webCodeGenReqMessage);
    }


}
