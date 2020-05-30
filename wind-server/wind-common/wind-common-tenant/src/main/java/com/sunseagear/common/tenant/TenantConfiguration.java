package com.sunseagear.common.tenant;

import com.baomidou.mybatisplus.core.parser.ISqlParser;
import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import com.baomidou.mybatisplus.extension.plugins.tenant.TenantHandler;
import com.baomidou.mybatisplus.extension.plugins.tenant.TenantSqlParser;
import lombok.AllArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.List;


@Configuration
@AllArgsConstructor
public class TenantConfiguration {

    /**
     * 自定义租户处理器
     *
     * @return TenantHandler
     */
    @Bean
    @ConditionalOnMissingBean(TenantHandler.class)
    public TenantHandler tenantHandler() {
        return new CommonTenantHandler();
    }

    /**
     * 分页插件
     *
     * @param tenantHandler 自定义租户处理器
     * @return PaginationInterceptor
     */
    @Bean
    public PaginationInterceptor paginationInterceptor(TenantHandler tenantHandler) {
        PaginationInterceptor paginationInterceptor = new PaginationInterceptor();
        List<ISqlParser> sqlParserList = new ArrayList<>();
        TenantSqlParser tenantSqlParser = new TenantSqlParser();
        tenantSqlParser.setTenantHandler(tenantHandler);
        sqlParserList.add(tenantSqlParser);
        paginationInterceptor.setSqlParserList(sqlParserList);
        return paginationInterceptor;
    }

}
