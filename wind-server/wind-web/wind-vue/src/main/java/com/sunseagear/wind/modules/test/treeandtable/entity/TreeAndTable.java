package com.sunseagear.wind.modules.test.treeandtable.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.sunseagear.common.mvc.entity.DataEntity;
import lombok.Data;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package test.treeandtable
 * @title: 左树右表控制器
 * @description: 左树右表控制器
 * @author: admin
 * @date: 2019-11-13 21:24:49
 * @copyright: www.sunseagear.com Inc. All rights reserved.
 */

@Data
@TableName("test_tree_and_table")
@SuppressWarnings("serial")
public class TreeAndTable extends DataEntity<String> {


    @TableId(value = "id", type = IdType.UUID)
    private String id; //id
    @TableField(value = "name")
    private String name;  //部门名称
    @TableField(value = "type")
    private String type;  //类型
    @TableField(value = "tag")
    private String tag;  //标签
    @TableField(value = "area_id")
    private String areaId;  //区域

}
