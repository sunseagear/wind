package com.sunseagear.wind.modules.sys.service.impl;


import com.sunseagear.common.mvc.service.impl.CommonServiceImpl;
import com.sunseagear.wind.modules.sys.entity.SysConfig;
import com.sunseagear.wind.modules.sys.mapper.SysConfigMapper;
import com.sunseagear.wind.modules.sys.service.ISysConfigService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service("sysConfigService")
public class SysConfigServiceImpl extends CommonServiceImpl<SysConfigMapper, SysConfig> implements ISysConfigService {

}
