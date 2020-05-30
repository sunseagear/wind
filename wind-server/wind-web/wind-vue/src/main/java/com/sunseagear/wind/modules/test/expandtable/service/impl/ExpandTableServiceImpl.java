package com.sunseagear.wind.modules.test.expandtable.service.impl;

import com.sunseagear.common.mvc.service.impl.CommonServiceImpl;
import com.sunseagear.wind.modules.test.expandtable.entity.ExpandTable;
import com.sunseagear.wind.modules.test.expandtable.mapper.ExpandTableMapper;
import com.sunseagear.wind.modules.test.expandtable.service.IExpandTableService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package test.expandtable
 * @title: 商品信息控制器
 * @description: 商品信息控制器
 * @author: admin
 * @date: 2019-11-13 15:02:03
 * @copyright: www.sunseagear.com Inc. All rights reserved.
 */
@Transactional
@Service("expandTableService")
public class ExpandTableServiceImpl extends CommonServiceImpl<ExpandTableMapper, ExpandTable> implements IExpandTableService {

}
