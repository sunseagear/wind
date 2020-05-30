package com.sunseagear.common.mvc.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.sunseagear.common.mvc.entity.tree.TreeNode;
import com.sunseagear.common.utils.StringUtils;
import lombok.Data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 树抽象实体基类
 */
@Data
public abstract class TreeEntity<T> extends AbstractEntity<T> implements TreeNode<T>, java.io.Serializable {
    @TableId(value = "id", type = IdType.UUID)
    protected T id; // 编号
    @TableField(value = "name")
    protected String name; // 资源名称
    @TableField(value = "parent_id", strategy = FieldStrategy.IGNORED)
    protected T parentId; // 父编号
    @TableField(value = "parent_ids", strategy = FieldStrategy.IGNORED)
    protected String parentIds; // 父编号列表

    @TableField(value = "remarks")
    protected String remarks;
    @TableField(value = "create_by", fill = FieldFill.INSERT)
    protected String createBy; // 创建者
    @TableField(value = "create_date", fill = FieldFill.INSERT)
    protected Date createDate; // 创建日期
    @TableField(value = "update_by", fill = FieldFill.UPDATE)
    protected String updateBy; // 更新者
    @TableField(value = "update_date", fill = FieldFill.UPDATE)
    protected Date updateDate; // 更新日期
    @TableField(value = "del_flag", fill = FieldFill.INSERT)
    protected String delFlag = "0"; // 删除标记（0：正常；1：删除 ）


    @TableField(exist = false)
    protected Boolean expanded = Boolean.FALSE;
    @TableField(exist = false)
    protected Boolean loaded = Boolean.TRUE;

    @TableField(exist = false)
    List<TreeEntity> children = new ArrayList<>();

    /**
     * 是否有叶子节点
     */
    @TableField(exist = false)
    protected boolean hasChildren;


    @Override
    public boolean isRoot() {
        if (getParentId() == null || getParentId().equals("0") || getParentId().equals("")) {
            return true;
        }
        return false;
    }


    @Override
    public Long getLevel() {
        if (parentIds == null) {
            return (long) 0;
        }
        String[] parentIdArr = parentIds.split("/");
        List<String> idsList = new ArrayList<>();
        for (String id : parentIdArr) {
            if (!StringUtils.isEmpty(id)) {
                idsList.add(id);
            }
        }
        return (long) (idsList.size());
    }

    @Override
    public Boolean isLeaf() {
        if (isHasChildren()) {
            return Boolean.FALSE;
        }

        return Boolean.TRUE;
    }

    @Override
    public String makeSelfAsNewParentIds() {
        if (StringUtils.isEmpty(getParentIds())) {
            return getId() + getSeparator();
        }
        return getParentIds() + getId() + getSeparator();
    }

    @Override
    public String getSeparator() {
        return "/";
    }

    @Override
    public String[] makeTags() {
        return new String[0];
    }
}
