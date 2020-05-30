package com.sunseagear.wind.modules.test.twotable.service;


import com.sunseagear.common.mvc.service.ICommonService;
import com.sunseagear.wind.modules.test.twotable.entity.CarModel;

import java.util.List;

/**
 * @author jwcg
 * @version V1.0
 * @Title:
 * @Description:
 * @date 2017-02-09 09:05:29
 */
public interface ICarModelService extends ICommonService<CarModel> {
    List<CarModel> selectDictList();
}
