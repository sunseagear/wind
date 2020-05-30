package com.sunseagear.wind.modules.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sunseagear.common.datarule.handler.DataRuleHandler;
import com.sunseagear.common.mvc.service.impl.CommonServiceImpl;
import com.sunseagear.wind.modules.sys.entity.DataRule;
import com.sunseagear.wind.modules.sys.entity.RoleDataRule;
import com.sunseagear.wind.modules.sys.mapper.DataRuleMapper;
import com.sunseagear.wind.modules.sys.mapper.RoleDataRuleMapper;
import com.sunseagear.wind.modules.sys.service.IDataRuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.Collection;


/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package sys
 * @title: 数据权限表控制器
 * @description: 数据权限表控制器
 * @author: 未知
 * @date: 2019-11-29 06:05:01
 * @copyright: www.sunseagear.com Inc. All rights reserved.
 */
@Transactional
@Service("dataRuleService")
public class DataRuleServiceImpl extends CommonServiceImpl<DataRuleMapper, DataRule> implements IDataRuleService {

    //所有数据更新都需要刷新数据权限
    @Autowired
    private DataRuleHandler dataRuleHandler;
    @Autowired
    private RoleDataRuleMapper roleDataRuleMapper;

    @Override
    public boolean update(DataRule entity) {
        boolean result = super.update(entity);
        dataRuleHandler.refreshDataRule(entity.getId());
        return result;
    }

    @Override
    public boolean save(DataRule entity) {
        boolean save = super.save(entity);
        dataRuleHandler.refreshDataRule(entity.getId());
        return save;
    }

    @Override
    public boolean insertOrUpdate(DataRule entity) {
        boolean result = super.saveOrUpdate(entity);
        dataRuleHandler.refreshDataRule(entity.getId());
        return result;
    }

    @Override
    public boolean deleteById(Serializable id) {
        boolean result = super.removeById(id);
        roleDataRuleMapper.delete(new QueryWrapper<RoleDataRule>().eq("role_id", id));
        dataRuleHandler.deleteDataRule(String.valueOf(id));
        return result;
    }

    @Override
    public boolean removeByIds(Collection<? extends Serializable> idList) {
        boolean result = super.removeByIds(idList);
        idList.forEach(id -> {
            roleDataRuleMapper.delete(new QueryWrapper<RoleDataRule>().eq("role_id", id));
            dataRuleHandler.deleteDataRule(String.valueOf(id));
        });
        return result;
    }
}
