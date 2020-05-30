package com.sunseagear.wind.modules.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sunseagear.wind.modules.sys.entity.Tenant;
import org.apache.ibatis.annotations.Mapper;

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
@Mapper
public interface TenantMapper extends BaseMapper<Tenant> {

}
