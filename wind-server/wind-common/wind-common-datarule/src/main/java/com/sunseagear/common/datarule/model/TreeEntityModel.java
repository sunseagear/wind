package com.sunseagear.common.datarule.model;

import lombok.Data;

/**
 * 树抽象实体基类
 */
@Data
public class TreeEntityModel {
    protected String id; // 编号
    protected String name; // 资源名称
    protected String parentId; // 父编号
    protected String parentIds; // 父编号列表

}
