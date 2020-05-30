package com.sunseagear.wind.modules.sys.service.impl;

import com.sunseagear.common.mvc.service.impl.CommonServiceImpl;
import com.sunseagear.wind.modules.sys.entity.RoleDataRule;
import com.sunseagear.wind.modules.sys.mapper.RoleDataRuleMapper;
import com.sunseagear.wind.modules.sys.service.IRoleDataRuleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package sys
 * @title: 角色数据权限关联表控制器
 * @description: 角色数据权限关联表控制器
 * @author: 未知
 * @date: 2019-12-03 13:03:38
 * @copyright: www.sunseagear.com Inc. All rights reserved.
 */
@Transactional
@Service("roleDataRuleService")
public class RoleDataRuleServiceImpl extends CommonServiceImpl<RoleDataRuleMapper, RoleDataRule> implements IRoleDataRuleService {

}
