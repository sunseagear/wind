package com.sunseagear.wind.common.listener;

import com.sunseagear.common.utils.CacheUtils;
import com.sunseagear.common.utils.MessageUtils;
import com.sunseagear.wind.common.helper.SysConfigHelper;
import com.sunseagear.wind.modules.sys.entity.SysConfig;
import com.sunseagear.wind.utils.DictUtils;
import com.sunseagear.wind.utils.UserUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class WebStartInitListener implements ApplicationListener<ContextRefreshedEvent> {

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        // 需要执行的逻辑代码，当spring容器初始化完成后就会执行该方法。
        log.error("=================数据初始化=========================");
        log.error("===初始化字典缓存===");
        DictUtils.initDict();
        log.error("===初始化系统配置数据===");
        SysConfigHelper.getInstance().init();
        log.error("===清空用户缓存===");
        UserUtils.clearAllCache();
        log.error("=================数据初始化完成=========================");
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
        log.error(sb.toString());
        return true;
    }
}
