package com.sunseagear.common.disruptor;

import com.lmax.disruptor.WorkHandler;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @title: SmsHandler.java
 * @package com.sunseagear.common.disruptor.sms
 * @description: 内容消费者 * @date: 2017年6月7日 下午11:20:32
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public class TaskHandler implements WorkHandler<TaskEvent> {

    @Override
    public void onEvent(TaskEvent event) throws Exception {
        //运行任务
        event.getTask().run();
    }

}
