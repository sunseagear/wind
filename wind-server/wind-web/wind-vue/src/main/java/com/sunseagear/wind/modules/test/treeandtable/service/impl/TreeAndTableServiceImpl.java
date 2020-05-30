package com.sunseagear.wind.modules.test.treeandtable.service.impl;

import com.sunseagear.common.mvc.service.impl.CommonServiceImpl;
import com.sunseagear.wind.modules.test.treeandtable.entity.TreeAndTable;
import com.sunseagear.wind.modules.test.treeandtable.mapper.TreeAndTableMapper;
import com.sunseagear.wind.modules.test.treeandtable.service.ITreeAndTableService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package test.treeandtable
 * @title: 左树右表控制器
 * @description: 左树右表控制器
 * @author: admin
 * @date: 2019-11-13 21:24:52
 * @copyright: www.sunseagear.com Inc. All rights reserved.
 */
@Transactional
@Service("treeAndTableService")
public class TreeAndTableServiceImpl extends CommonServiceImpl<TreeAndTableMapper, TreeAndTable> implements ITreeAndTableService {

}
