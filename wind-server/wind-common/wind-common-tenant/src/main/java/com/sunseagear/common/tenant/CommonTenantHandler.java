package com.sunseagear.common.tenant;

import com.baomidou.mybatisplus.extension.plugins.tenant.TenantHandler;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.common.utils.UserUtils;
import lombok.AllArgsConstructor;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.StringValue;



@AllArgsConstructor
public class CommonTenantHandler implements TenantHandler {

    /**
     * 获取租户ID
     *
     * @return 租户ID
     */
    @Override
    public Expression getTenantId() {
        return new StringValue(UserUtils.getTenantId());
    }

    /**
     * 获取租户字段名称
     *
     * @return 租户字段名称
     */
    @Override
    public String getTenantIdColumn() {
        return TenantProperties.getInstance().getInstance().getColumn();
    }

    /**
     * 过滤租户表
     *
     * @param tableName 表名
     * @return 是否进行过滤 返回true 表示不进行多租户处理
     */
    @Override
    public boolean doTableFilter(String tableName) {
        if (!TenantProperties.getInstance().getEnable()){
            return true;
        }
        return StringUtils.isBlank(UserUtils.getTenantId()) || TenantProperties.getInstance().getIgnoreTables().contains(tableName);
    }
}
