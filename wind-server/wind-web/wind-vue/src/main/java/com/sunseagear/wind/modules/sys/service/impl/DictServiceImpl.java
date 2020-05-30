package com.sunseagear.wind.modules.sys.service.impl;

import com.sunseagear.common.mvc.service.impl.CommonServiceImpl;
import com.sunseagear.wind.modules.sys.entity.Dict;
import com.sunseagear.wind.modules.sys.mapper.DictMapper;
import com.sunseagear.wind.modules.sys.service.IDictService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service("dictService")
public class DictServiceImpl extends CommonServiceImpl<DictMapper, Dict> implements IDictService {

    @Override
    public List<Dict> selectDictList() {
        return baseMapper.selectDictList();
    }

}
