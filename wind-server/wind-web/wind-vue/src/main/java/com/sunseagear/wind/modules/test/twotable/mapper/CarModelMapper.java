package com.sunseagear.wind.modules.test.twotable.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sunseagear.wind.modules.test.twotable.entity.CarModel;
import com.sunseagear.wind.modules.test.twotable.entity.CarModel;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CarModelMapper extends BaseMapper<CarModel> {
    List<CarModel> selectDictList();
}
