package com.sunseagear.wind.modules.sys.service.impl;

import com.sunseagear.common.mvc.service.impl.CommonServiceImpl;
import com.sunseagear.wind.modules.sys.entity.Role;
import com.sunseagear.wind.modules.sys.mapper.RoleMapper;
import com.sunseagear.wind.modules.sys.service.IRoleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service("roleService")
public class RoleServiceImpl extends CommonServiceImpl<RoleMapper, Role> implements IRoleService {

    @Override
    public List<Role> findListByUserId(String userid) {
        return baseMapper.findRoleByUserId(userid);
    }

}
