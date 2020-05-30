package com.sunseagear.wind.modules.sys.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sunseagear.wind.modules.sys.entity.Role;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RoleMapper extends BaseMapper<Role> {
    /**
     * @param userId
     * @return
     * @title: findRoleByUserId
     * @description: 通过用户查找角色
     * @return: List<Role>
     */
    List<Role> findRoleByUserId(String userId);
}
