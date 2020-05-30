package com.sunseagear.wind.modules.test.table.service.impl;

import com.sunseagear.common.mvc.service.impl.CommonServiceImpl;
import com.sunseagear.wind.modules.test.table.entity.Table;
import com.sunseagear.wind.modules.test.table.mapper.TableMapper;
import com.sunseagear.wind.modules.test.table.service.ITableService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.wind.modules.sys.service.impl
 * @title: 操作日志服务实现
 * @description: 操作日志服务实现 * @date: 2018-09-30 15:53:25
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */
@Transactional
@Service("tableService")
public class TableServiceImpl extends CommonServiceImpl<TableMapper, Table> implements ITableService {

}
