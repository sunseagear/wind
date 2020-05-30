package com.sunseagear.common.utils.entity;

import java.util.Collection;
import java.util.HashMap;
import java.util.Set;

/**
 * Created by Administrator on 2017/10/11.
 */

public class RequestParams {
    HashMap<String, Object> map = new HashMap<>();

    public void put(String name, Object value) {
        map.put(name, value);
    }

    public Object get(String name) {
        return map.get(name);
    }

    public Set<String> names() {
        return map.keySet();
    }

    public Collection<Object> values() {
        return map.values();
    }
}
