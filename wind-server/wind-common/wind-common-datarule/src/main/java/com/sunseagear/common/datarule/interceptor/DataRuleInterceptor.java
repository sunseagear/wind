package com.sunseagear.common.datarule.interceptor;

import com.baomidou.mybatisplus.extension.handlers.AbstractSqlParserHandler;
import com.sunseagear.common.datarule.handler.DataRuleHandler;
import com.sunseagear.common.datarule.handler.DataRuleSqlHandler;
import com.sunseagear.common.datarule.model.DataRuleModel;
import com.sunseagear.common.utils.Reflections;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.common.utils.UserUtils;
import com.sunseagear.common.utils.entity.Principal;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlSource;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;

import java.util.Properties;


@Slf4j
@RequiredArgsConstructor
@Intercepts({@Signature(type = Executor.class, method = "query", args = {MappedStatement.class, Object.class, RowBounds.class, ResultHandler.class})})
public class DataRuleInterceptor extends AbstractSqlParserHandler implements Interceptor {

    private final DataRuleSqlHandler dataRuleSqlHandler;
    private final DataRuleHandler dataRuleHandler;

    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        //未取到用户则放行
        Principal principal = UserUtils.getPrincipal();
        if (principal == null) {
            return invocation.proceed();
        }

        final MappedStatement mappedStatement = (MappedStatement) invocation.getArgs()[0];
        //注解为空并且数据权限方法名未匹配到,则放行
        String mapperId = mappedStatement.getId();
        DataRuleModel dataScope = dataRuleHandler.getDataRuleModel(mapperId);
        if (dataScope != null) {
            dataScope = dataRuleHandler.getDataRule(mapperId, principal.getRoleId());
        }
        if (dataScope == null) {
            return invocation.proceed();
        }

        Object parameter = invocation.getArgs()[1];
        BoundSql boundSql = mappedStatement.getBoundSql(parameter);
        String originalSql = boundSql.getSql();


        //获取数据权限规则对应的筛选Sql
        String sqlCondition = dataRuleSqlHandler.sqlCondition(dataScope, principal, originalSql);
        if (StringUtils.isBlank(sqlCondition)) {
            return invocation.proceed();
        } else {
            BoundSql newBoundSql = new BoundSql(mappedStatement.getConfiguration(), sqlCondition, boundSql.getParameterMappings(), boundSql.getParameterObject());
            //解决MyBatis 分页foreach 参数失效 start
            if (Reflections.getFieldValue(boundSql, "metaParameters") != null) {
                MetaObject mo = (MetaObject) Reflections.getFieldValue(boundSql, "metaParameters");
                Reflections.setFieldValue(newBoundSql, "metaParameters", mo);
            }
            //解决MyBatis 分页foreach 参数失效 end
            MappedStatement newMs = copyFromMappedStatement(mappedStatement, new BoundSqlSqlSource(newBoundSql));

            invocation.getArgs()[0] = newMs;
            return invocation.proceed();
        }
    }


    private MappedStatement copyFromMappedStatement(MappedStatement ms,
                                                    SqlSource newSqlSource) {
        MappedStatement.Builder builder = new MappedStatement.Builder(ms.getConfiguration(),
                ms.getId(), newSqlSource, ms.getSqlCommandType());
        builder.resource(ms.getResource());
        builder.fetchSize(ms.getFetchSize());
        builder.statementType(ms.getStatementType());
        builder.keyGenerator(ms.getKeyGenerator());
        if (ms.getKeyProperties() != null) {
            for (String keyProperty : ms.getKeyProperties()) {
                builder.keyProperty(keyProperty);
            }
        }
        builder.timeout(ms.getTimeout());
        builder.parameterMap(ms.getParameterMap());
        builder.resultMaps(ms.getResultMaps());
        builder.cache(ms.getCache());
        return builder.build();
    }

    public static class BoundSqlSqlSource implements SqlSource {
        BoundSql boundSql;

        public BoundSqlSqlSource(BoundSql boundSql) {
            this.boundSql = boundSql;
        }

        public BoundSql getBoundSql(Object parameterObject) {
            return boundSql;
        }
    }

    /**
     * 生成拦截对象的代理
     *
     * @param target 目标对象
     * @return 代理对象
     */
    @Override
    public Object plugin(Object target) {
        return Plugin.wrap(target, this);
    }

    /**
     * mybatis配置的属性
     *
     * @param properties mybatis配置的属性
     */
    @Override
    public void setProperties(Properties properties) {

    }


}
