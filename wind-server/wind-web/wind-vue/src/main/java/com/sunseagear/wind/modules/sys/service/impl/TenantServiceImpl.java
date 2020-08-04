package com.sunseagear.wind.modules.sys.service.impl;

import com.sunseagear.common.mvc.service.impl.CommonServiceImpl;
import com.sunseagear.wind.modules.sys.entity.Organization;
import com.sunseagear.wind.modules.sys.entity.Tenant;
import com.sunseagear.wind.modules.sys.entity.User;
import com.sunseagear.wind.modules.sys.mapper.OrganizationMapper;
import com.sunseagear.wind.modules.sys.mapper.TenantMapper;
import com.sunseagear.wind.modules.sys.service.ITenantService;
import com.sunseagear.wind.modules.sys.service.IUserRoleService;
import com.sunseagear.wind.modules.sys.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package sys
 * @title: 租户管理控制器
 * @description: 租户管理控制器
 * @author: 未知
 * @date: 2019-11-28 06:24:52
 * @copyright: www.sunseagear.com Inc. All rights reserved.
 */
@Transactional
@Service("tenantService")
public class TenantServiceImpl extends CommonServiceImpl<TenantMapper, Tenant> implements ITenantService {

    @Autowired
    private OrganizationMapper organizationMapper;
    @Autowired
    private IUserService userService;
    @Autowired
    private IUserRoleService userRoleService;

    @Override
    public boolean insert(Tenant entity) {
        Organization organization = new Organization();
        organization.setName(entity.getName());
        organization.setTenantId(entity.getTenantId());
        organizationMapper.insert(organization);
        User user = new User();
        user.setUsername(entity.getUserName());
        user.setRealname(entity.getName());
        user.setPhone(entity.getPhone());
        user.setOrganization(organization);
        user.setTenantId(entity.getTenantId());
        user.setPassword(entity.getTenantId());
        userService.insert(user);
        userRoleService.insertByRoleId(user.getId(), "1");
        entity.setUserId(user.getId());
        return super.insert(entity);
    }
}
