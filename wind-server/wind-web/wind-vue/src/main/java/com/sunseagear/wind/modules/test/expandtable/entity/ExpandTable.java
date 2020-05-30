package com.sunseagear.wind.modules.test.expandtable.entity;

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
 * @package test.expandtable
 * @title: 商品信息控制器
 * @description: 商品信息控制器
 * @author: admin
 * @date: 2019-11-13 15:02:00
 * @copyright: www.sunseagear.com Inc. All rights reserved.
 */

@Data
@TableName("test_expand_table")
@SuppressWarnings("serial")
public class ExpandTable extends DataEntity<String> {


    @TableId(value = "id", type = IdType.UUID)
    private String id; //id
    @TableField(value = "name")
    private String name;  //商品名称
    @TableField(value = "shop")
    private String shop;  //所属店铺
    @TableField(value = "category")
    private String category;  //商品分类
    @TableField(value = "address")
    private String address;  //店铺地址
    @TableField(value = "description")
    private String description;  //商品描述
    @TableField(value = "tag")
    private String tag;  //标签
    @TableField(value = "image")
    private String image;  //图片

}
