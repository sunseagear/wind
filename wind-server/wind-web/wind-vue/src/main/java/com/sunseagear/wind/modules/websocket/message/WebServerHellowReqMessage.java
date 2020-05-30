package com.sunseagear.wind.modules.websocket.message;

import com.sunseagear.wind.modules.websocket.ConstantMessageCode;
import lombok.Data;

@Data
public class WebServerHellowReqMessage {
    public static final int Code = ConstantMessageCode.WEB_SERVER_HELLOW_REQ;


    private Integer type;
    private String message;
}
