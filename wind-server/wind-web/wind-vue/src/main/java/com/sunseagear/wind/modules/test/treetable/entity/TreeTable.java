package com.sunseagear.wind.modules.test.treetable.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.sunseagear.common.mvc.entity.TreeEntity;
import lombok.Data;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package test.treetable
 * @title: 树形结构表控制器
 * @description: 树形结构表控制器
 * @author: admin
 * @date: 2019-11-13 21:38:33
 * @copyright: www.sunseagear.com Inc. All rights reserved.
 */

@Data
@TableName("test_tree_table")
@SuppressWarnings("serial")
public class TreeTable extends TreeEntity<String> {


    @TableField(value = "geocoding")
    private String geocoding;  //地理编码
    @TableField(value = "postal_code")
    private String postalCode;  //邮政编码

}
