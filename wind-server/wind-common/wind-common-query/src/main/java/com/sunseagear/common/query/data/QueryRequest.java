package com.sunseagear.common.query.data;

import com.sunseagear.common.query.exception.InvlidOperatorException;
import com.sunseagear.common.query.exception.QueryException;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

import java.util.List;

public class QueryRequest implements Queryable {
    private Pageable pageable; // 分页
    private Sort sort;// 排序
    private Condition condition;// 条件
    // 查询参数分隔符
    public static final String separator = "||";

    private boolean converted;

    public QueryRequest() {

    }

    public static Queryable newQueryable() {
        return new QueryRequest();
    }

    public Pageable getPageable() {
        return pageable;
    }

    public void setPageable(Pageable pageable) {
        this.pageable = pageable;
    }

    public Sort getSort() {
        return sort;
    }

    /**
     * 添加排序
     */
    public void addSort(Sort sort) {

    }

    public Condition getCondition() {
        return condition;
    }

    public void setCondition(Condition condition) {
        this.condition = condition;
    }

    @Override
    public Object getValue(String property) {
        if (this.getCondition() != null && this.getCondition().getFilterFor(property) != null) {
            return this.getCondition().getFilterFor(property).getValue();
        }
        return null;
    }

    @Override
    public Queryable addCondition(String property, Object value) {
        Assert.notNull(property, "Condition key must not null");

        String[] searchs = StringUtils.split(property, "||");

        if (searchs.length == 0) {
            throw new QueryException("Condition key format must be : property or property_op");
        }

        property = searchs[0];

        Condition.Operator operator = null;
        if (searchs.length == 1) {
            operator = Condition.Operator.eq;
        } else {
            try {
                operator = Condition.Operator.fromString(searchs[1]);
            } catch (IllegalArgumentException e) {
                throw new InvlidOperatorException(property, searchs[1]);
            }
        }

        boolean allowBlankValue = Condition.Operator.isAllowBlankValue(operator);
        boolean isValueBlank = (value == null);
        isValueBlank = isValueBlank || (value instanceof String && StringUtils.isEmpty((String) value));
        isValueBlank = isValueBlank || (value instanceof List && ((List<?>) value).size() == 0);
        // 过滤掉空值，即不参与查询
        if (!allowBlankValue && isValueBlank) {
            return null;
        }
        if (condition == null) {
            Condition.Filter filter = new Condition.Filter(operator, property, value);
            condition = new Condition(filter);
        } else {
            condition.and(operator, property, value);
        }
        return this;
    }

    @Override
    public boolean isConverted() {
        return converted;
    }

    @Override
    public void removeCondition(String property) {
        this.getCondition().remove(property);
    }

}
