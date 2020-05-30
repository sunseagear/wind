package com.sunseagear.wind.modules.sys.service.impl;

import com.sunseagear.common.datarule.handler.DataRuleHandler;
import com.sunseagear.common.mvc.service.impl.TreeCommonServiceImpl;
import com.sunseagear.wind.modules.sys.entity.Organization;
import com.sunseagear.wind.modules.sys.mapper.OrganizationMapper;
import com.sunseagear.wind.modules.sys.service.IOrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

@Transactional
@Service("organizationService")
public class OrganizationServiceImpl extends TreeCommonServiceImpl<OrganizationMapper, Organization, String>
        implements IOrganizationService {

    //所有数据更新都需要刷新数据权限
    @Autowired
    private DataRuleHandler dataRuleHandler;

    @Override
    public List<Organization> findListByUserId(String userid) {
        return baseMapper.findListByUserId(userid);
    }

    @Override
    public boolean save(Organization entity) {
        boolean save = super.save(entity);
        dataRuleHandler.refreshTreeEntity("sys_organization");
        return save;
    }

    @Override
    public boolean saveOrUpdate(Organization entity) {
        boolean result = super.saveOrUpdate(entity);
        dataRuleHandler.refreshTreeEntity("sys_organization");
        return result;
    }

    @Override
    public boolean removeById(Serializable id) {
        boolean result = super.removeById(id);
        dataRuleHandler.refreshTreeEntity("sys_organization");
        return result;
    }

    @Override
    public boolean updateById(Organization entity) {
        boolean result = super.updateById(entity);
        dataRuleHandler.refreshTreeEntity("sys_organization");
        return result;
    }

    @Override
    public boolean removeByIds(Collection<? extends Serializable> idList) {
        boolean result = super.removeByIds(idList);
        dataRuleHandler.refreshTreeEntity("sys_organization");
        return result;
    }
}
