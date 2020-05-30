package com.sunseagear.wind.common.listener;

import com.sunseagear.common.utils.MessageUtils;
import com.sunseagear.wind.common.helper.SysConfigHelper;
import com.sunseagear.wind.modules.sys.entity.SysConfig;
import com.sunseagear.wind.utils.DictUtils;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

@Component
public class WebStartInitListener implements ApplicationListener<ContextRefreshedEvent> {

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        // 需要执行的逻辑代码，当spring容器初始化完成后就会执行该方法。
        DictUtils.initDict();
        SysConfigHelper.getInstance().init();
        printKeyLoadMessage();
    }

    /**
     * 获取Key加载信息
     */
    public boolean printKeyLoadMessage() {
        StringBuilder sb = new StringBuilder();
        sb.append("\r\n======================================================================\r\n");
        sb.append("\r\n    欢迎使用 " + MessageUtils.getMessage("platform.name") + " " + MessageUtils.getMessage("platform.version") + "  - " + MessageUtils.getMessage("platform.copyright") + "  " + MessageUtils.getMessage("platform.website") + "\r\n");
        sb.append("\r\n======================================================================\r\n");
        System.out.println(sb.toString());
        return true;
    }
}
