package com.sunseagear.wind.modules.websocket;

import com.sunseagear.common.utils.websocket.WebSocketServer;
import com.sunseagear.wind.modules.websocket.processor.WebServerHellowRequestProcessor;
import org.springframework.stereotype.Component;

import javax.websocket.server.ServerEndpoint;

@Component
@ServerEndpoint("/json/web/server/{userId}")
public class WebSocketWebCodeServer extends WebSocketServer {


    public WebSocketWebCodeServer() {
        onlineSessions = webOnlineSessions;
    }


    @Override
    public void intiMessage() {
        getMessageDispatcher().register(ConstantMessageCode.WEB_SERVER_HELLOW_REQ, new WebServerHellowRequestProcessor(this));

    }
}
