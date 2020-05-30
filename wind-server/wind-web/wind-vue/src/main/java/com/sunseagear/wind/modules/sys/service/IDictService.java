package com.sunseagear.wind.modules.sys.service;


import com.sunseagear.common.mvc.service.ICommonService;
import com.sunseagear.wind.modules.sys.entity.Dict;

import java.util.List;

/**
 * @author jwcg
 * @version V1.0
 * @Title:
 * @Description:
 * @date 2017-02-09 09:05:29
 */
public interface IDictService extends ICommonService<Dict> {
    List<Dict> selectDictList();
}
