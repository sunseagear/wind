package com.sunseagear.wind.modules.test.twotable.service.impl;

import com.sunseagear.common.mvc.service.impl.CommonServiceImpl;
import com.sunseagear.wind.modules.test.twotable.entity.CarModel;
import com.sunseagear.wind.modules.test.twotable.mapper.CarModelMapper;
import com.sunseagear.wind.modules.test.twotable.service.ICarModelService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service("carModelService")
public class CarModelServiceImpl extends CommonServiceImpl<CarModelMapper, CarModel> implements ICarModelService {

    @Override
    public List<CarModel> selectDictList() {
        return baseMapper.selectDictList();
    }

}
