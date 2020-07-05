package com.sunseagear.common.tenant;

import lombok.Data;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


@Data
public class TenantProperties {

    private static TenantProperties instance;

    private Boolean enable = true;

    private String defaultTenantId = "00000000";

    /**
     * 多租户字段名称
     */
    private String column = "tenant_id";

    /**
     * 多租户系统数据表
     */
    private List<String> ignoreTables = new ArrayList<>();


    private TenantProperties() {
    }

    public static TenantProperties getInstance() {
        if (instance == null) {
            instance = new TenantProperties();
            instance.getIgnoreTables().addAll(Arrays.asList("sys_menu", "sys_config", "sys_dict", "sys_dict_group", "sys_role_data_rule",
                    "sys_role_menu", "sys_sessions", "sys_tenant", "sys_user", "sys_role", "sys_organization", "sys_user_role", "task_schedule_job", "task_schedule_job_log"));
        }
        return instance;
    }
}
