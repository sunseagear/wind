package com.sunseagear.wind.modules.sys.service.impl;

import com.sunseagear.common.mvc.service.impl.CommonServiceImpl;
import com.sunseagear.wind.modules.sys.entity.DictGroup;
import com.sunseagear.wind.modules.sys.mapper.DictGroupMapper;
import com.sunseagear.wind.modules.sys.service.IDictGroupService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service("dictGroupService")
public class DictGroupServiceImpl extends CommonServiceImpl<DictGroupMapper, DictGroup> implements IDictGroupService {
}
