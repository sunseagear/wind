package com.sunseagear.wind.modules.sys.service;

import com.sunseagear.common.mvc.service.ICommonService;
import com.sunseagear.wind.modules.sys.entity.Role;

import java.util.List;

/**
 * @author jwcg
 * @version V1.0
 * @Title:
 * @Description:
 * @date 2014-12-20 21:33:15
 */
public interface IRoleService extends ICommonService<Role> {
    /**
     * 通过用户ID查找角色
     */
    List<Role> findListByUserId(String userid);
}
