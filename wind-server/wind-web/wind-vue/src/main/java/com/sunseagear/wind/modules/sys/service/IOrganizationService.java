package com.sunseagear.wind.modules.sys.service;

import com.sunseagear.common.mvc.service.ITreeCommonService;
import com.sunseagear.wind.modules.sys.entity.Organization;

import java.util.List;

/**
 * @author jwcg
 * @version V1.0
 * @Title:
 * @Description:
 * @date 2014-12-20 21:33:51
 */
public interface IOrganizationService extends ITreeCommonService<Organization, String> {
    /**
     * 通过用户ID查找角色
     */
    public List<Organization> findListByUserId(String userid);
}
