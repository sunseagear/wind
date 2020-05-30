package com.sunseagear.common.http;

import java.io.Serializable;
import java.util.LinkedHashMap;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.common.http
 * @title:
 * @description: 数据请求实体 * @date: 2018/6/24 21:41
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public class Request extends LinkedHashMap<String, Object> implements Serializable {
    private static final long serialVersionUID = 1L;

   /* public Page getPage() {
        Integer page=0;
        Integer limit=10;
        //分页参数
        if(this.get("page") != null){
            page = (Integer) this.get("page");
        }
        if(this.get("limit") != null){
            page = (Integer) this.get("limit");
        }

        //防止SQL注入（因为sidx、order是通过拼接SQL实现排序的，会有SQL注入风险）
        String sidx = (String) this.get("sidx");
        String order = (String) this.get("order");
        this.put("sidx", sidx);
        this.put("order", order);

        //mybatis-plus分页
        Page pageBean = new Page(page, limit);

        //排序
        if(StringUtils.isNotBlank(sidx) && StringUtils.isNotBlank(order)){
            pageBean.setOrderByField(sidx);
            pageBean.setAsc("ASC".equalsIgnoreCase(order));
        }
        return pageBean;
    }*/

    @Override
    public Object get(Object key) {
        Object value = super.get(key);
        if (value != null && value instanceof String) {
            value = ((String) value).trim();
        }
        return value;
    }

    public String getString(Object key) {
        String value = (String) get(key);
        return value;
    }
}
