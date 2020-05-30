package com.sunseagear.wind.modules.test.treetable.service.impl;

import com.sunseagear.common.mvc.service.impl.TreeCommonServiceImpl;
import com.sunseagear.wind.modules.test.treetable.entity.TreeTable;
import com.sunseagear.wind.modules.test.treetable.mapper.TreeTableMapper;
import com.sunseagear.wind.modules.test.treetable.service.ITreeTableService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package test.treetable
 * @title: 树形结构表控制器
 * @description: 树形结构表控制器
 * @author: admin
 * @date: 2019-11-13 21:38:34
 * @copyright: www.sunseagear.com Inc. All rights reserved.
 */
@Transactional
@Service("treeTableService")
public class TreeTableServiceImpl extends TreeCommonServiceImpl<TreeTableMapper, TreeTable, String> implements ITreeTableService {

}
