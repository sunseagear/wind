package com.sunseagear.wind.modules.sys.mapper;

import com.sunseagear.common.mvc.mapper.BaseTreeMapper;
import com.sunseagear.wind.modules.sys.entity.Organization;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrganizationMapper extends BaseTreeMapper<Organization> {

    /**
     * @param userId
     * @return
     * @title: findListByUserId
     * @description: 通过用户查找组织机构
     * @return: List<Organization>
     */
    List<Organization> findListByUserId(String userId);
}
