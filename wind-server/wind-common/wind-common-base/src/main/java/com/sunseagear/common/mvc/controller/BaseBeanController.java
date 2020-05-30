package com.sunseagear.common.mvc.controller;

import com.sunseagear.common.mvc.exception.ValidationException;
import com.sunseagear.common.utils.MessageUtils;
import com.sunseagear.common.utils.ReflectionUtils;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.common.utils.convert.DateConvertEditor;
import com.sunseagear.common.utils.convert.StringConvertEditor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public abstract class BaseBeanController<Entity extends Serializable> {

    /**
     * 实体类型
     */
    protected final Class<Entity> entityClass;
    /**
     * 日志对象
     */
    protected Logger logger = LoggerFactory.getLogger(getClass());

    protected BaseBeanController() {
        this.entityClass = ReflectionUtils.getSuperGenericType(getClass());
    }


    /**
     * 初始化数据绑定
     *
     * @param binder
     */
    @InitBinder
    void initBinder(ServletRequestDataBinder binder) {
        // 将所有传递进来的String进行HTML编码，防止XSS攻击
        // 这个会导致数据库数据
        binder.registerCustomEditor(String.class, new StringConvertEditor());
        // 日期格式
        binder.registerCustomEditor(Date.class, new DateConvertEditor());
    }

    /**
     * 共享的验证规则 验证失败返回true
     *
     * @param entity
     * @param result
     * @return
     */
    protected boolean hasError(Entity entity, BindingResult result) {
        Assert.notNull(entity);
        return result.hasErrors();
    }

    protected void checkError(Entity entity, BindingResult result) {
        if (hasError(entity, result)) {
            // 错误提示
            String errorMsg = errorMsg(result);
            if (!StringUtils.isEmpty(errorMsg)) {
                throw new ValidationException(errorMsg);
            } else {
                throw new ValidationException("验证失败");
            }
        }
    }

    /**
     * @param result
     * @return
     * @title: errorMsg
     * @description: 错误信息组装
     * @return: String
     */
    protected String errorMsg(BindingResult result) {
        String errorMsg = "";
        if (result.getErrorCount() > 0) {
            List<ObjectError> objectErrorList = result.getAllErrors();
            for (ObjectError objectError : objectErrorList) {
                String message = MessageUtils.getMessage(objectError.getCode(), objectError.getDefaultMessage(),
                        objectError.getArguments());
                if (!StringUtils.isEmpty(message)) {
                    errorMsg = errorMsg + message + "<br />";
                }
            }
        }
        return errorMsg;
    }
}
