package com.sunseagear.wind.common.handler;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.sunseagear.common.mvc.constant.DataBaseConstant;
import com.sunseagear.wind.utils.UserUtils;
import org.apache.ibatis.reflection.MetaObject;

import java.util.Date;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @title: MyMetaObjectHandler.java
 * @package com.sunseagear.core.common.handler
 * @description: 填充创建时间，创建人，更新时间，更新人 * @date: 2017年7月20日 上午10:55:42
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public class BaseMetaObjectHandler implements MetaObjectHandler {
    /**
     * 删除标记
     */
    public static final String DEL_FLAG = "delFlag";
    /**
     * 创建时间
     */
    public static final String CREATE_BY = "createBy";
    /**
     * 创建时间
     */
    public static final String CREATE_DATE = "createDate";
    /**
     * 创建时间
     */
    public static final String UPDATE_BY = "updateBy";
    /**
     * 更新时间
     */
    public static final String UPDATE_DATE = "updateDate";

    public static final String TENANT_ID = "tenantId"; // 租户ID

    /**
     * 新增
     */
    public void insertFill(MetaObject metaObject) {
        // 创建用户
        Object createBy = getFieldValByName(CREATE_BY, metaObject);
        if (createBy == null) {
            setFieldValByName(CREATE_BY, UserUtils.getUser().getId(), metaObject);
        }

        // 创建时间
        Object createDate = getFieldValByName(CREATE_DATE, metaObject);
        if (createDate == null) {
            setFieldValByName(CREATE_DATE, new Date(), metaObject);
        }

        // 删除标记
        Object delFlag = getFieldValByName(DEL_FLAG, metaObject);
        if (delFlag == null) {
            setFieldValByName(DEL_FLAG, DataBaseConstant.DEL_FLAG_NORMAL, metaObject);
        }

        // 租户标记
        if (metaObject.hasGetter(TENANT_ID)) {
            Object tenantId = getFieldValByName(TENANT_ID, metaObject);
            if (tenantId == null) {
                setFieldValByName(TENANT_ID, UserUtils.getUser().getTenantId(), metaObject);
            }
        }
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        // 更新用户
        Object updateBy = getFieldValByName(UPDATE_BY, metaObject);
        if (updateBy == null) {
            setFieldValByName(UPDATE_BY, UserUtils.getUser().getId(), metaObject);
        }

        // 更新用户
        Object updateDate = getFieldValByName(UPDATE_DATE, metaObject);
        if (updateDate == null) {
            setFieldValByName(UPDATE_DATE, new Date(), metaObject);
        }
    }
}
