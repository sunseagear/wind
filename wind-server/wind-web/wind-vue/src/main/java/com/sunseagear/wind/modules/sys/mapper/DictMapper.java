package com.sunseagear.wind.modules.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sunseagear.wind.modules.sys.entity.Dict;
import com.sunseagear.wind.modules.sys.entity.Dict;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DictMapper extends BaseMapper<Dict> {
    List<Dict> selectDictList();
}
