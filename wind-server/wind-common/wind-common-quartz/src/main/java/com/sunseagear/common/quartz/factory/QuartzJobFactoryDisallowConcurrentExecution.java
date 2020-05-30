package com.sunseagear.common.quartz.factory;

import org.quartz.DisallowConcurrentExecution;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @title: QuartzJobFactoryDisallowConcurrentExecution.java
 * @package com.sunseagear.core.quartz.factory
 * @description: 若一个方法一次执行不完下次轮转时则等待改方法执行完后才执行下一次操作 * @date: 2017年5月10日 上午12:24:52
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
@DisallowConcurrentExecution
public class QuartzJobFactoryDisallowConcurrentExecution extends QuartzJobFactory {
}
