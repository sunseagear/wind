package com.sunseagear.wind.modules.test.twotable.service.impl;

import com.sunseagear.common.mvc.service.impl.CommonServiceImpl;
import com.sunseagear.wind.modules.test.twotable.entity.Car;
import com.sunseagear.wind.modules.test.twotable.mapper.CarMapper;
import com.sunseagear.wind.modules.test.twotable.service.ICarService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service("carService")
public class CarServiceImpl extends CommonServiceImpl<CarMapper, Car> implements ICarService {
}
