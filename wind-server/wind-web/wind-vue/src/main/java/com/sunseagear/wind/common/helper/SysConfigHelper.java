package com.sunseagear.wind.common.helper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sunseagear.common.tenant.TenantProperties;
import com.sunseagear.common.utils.SpringContextHolder;
import com.sunseagear.common.utils.UserUtils;
import com.sunseagear.wind.modules.sys.entity.SysConfig;
import com.sunseagear.wind.modules.sys.service.ISysConfigService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class SysConfigHelper {
    private SysConfigHelper() {
    }

    private static SysConfigHelper sysConfigHelper;
    private ISysConfigService sysConfigService;

    private HashMap<String, List<SysConfig>> sysConfigMap = new HashMap<>();

    public static SysConfigHelper getInstance() {
        if (sysConfigHelper == null) {
            sysConfigHelper = new SysConfigHelper();
        }
        return sysConfigHelper;
    }

    public void init() {
        sysConfigService = SpringContextHolder.getBean("sysConfigService");
        List<SysConfig> sysConfigList = sysConfigService.list();
        sysConfigList.forEach(config -> {
            String tenantId = config.getTenantId();
            if (!sysConfigMap.containsKey(tenantId)) {
                sysConfigMap.put(tenantId, new ArrayList<>());
            }
            sysConfigMap.get(tenantId).add(config);
        });
    }

    public SysConfig getSysConfig(String code) {
        return getSysConfig(UserUtils.getTenantId(), code);
    }

    public SysConfig getSysConfig(String tenantId, String code) {
        if (!sysConfigMap.containsKey(tenantId)) {
            sysConfigMap.put(tenantId, new ArrayList<>());
        }
        List<SysConfig> configList = sysConfigMap.get(tenantId);
        for (SysConfig config : configList) {
            if (config.getCode().equals(code)) {
                return config;
            }
        }
        SysConfig sysConfig = sysConfigService.getOne(new QueryWrapper<SysConfig>().eq("code", code).eq("tenant_id", tenantId));
        if (sysConfig == null) {
            sysConfig = getDefaultConfig(code);
        }else{
            configList.add(sysConfig);
        }
        return sysConfig;

    }

    public SysConfig getDefaultConfig(String code){
        List<SysConfig> configList = sysConfigMap.get(TenantProperties.getInstance().getDefaultTenantId());
        for (SysConfig config : configList) {
            if (config.getCode().equals(code)) {
                return config;
            }
        }
        return null;
    }

    public void update(String tenantId){
        if (!sysConfigMap.containsKey(tenantId)) {
            sysConfigMap.put(tenantId, new ArrayList<>());
        }
        sysConfigMap.get(tenantId).clear();
        sysConfigMap.get(tenantId).addAll(sysConfigService.selectList(new QueryWrapper<SysConfig>().eq("tenant_id", tenantId)));
    }


}
