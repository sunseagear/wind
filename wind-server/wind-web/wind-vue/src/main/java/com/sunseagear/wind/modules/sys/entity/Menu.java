package com.sunseagear.wind.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.sunseagear.common.mvc.entity.TreeEntity;
import lombok.Data;

@Data
@TableName("sys_menu")
@SuppressWarnings("serial")
public class Menu extends TreeEntity<String> {

    public static final String CATALOG = "1";
    public static final String MENU = "2";
    public static final String BUTTON = "3";

    @TableField(value = "permission")
    private String permission;
    /**资源路径*/
    /**
     * 菜单类型
     */
    @TableField(value = "type")
    private String type;
    /**
     * 路径编码
     */
    @TableField(value = "path")
    private String path;
    /**
     * 访问路由
     */
    @TableField(value = "url")
    private String url;
    /**
     * 是否显示
     */
    @TableField(value = "enabled")
    private Short enabled;
    /**
     * 排序
     */
    @TableField(value = "sort")
    private Integer sort;
    /**
     * 图标
     */
    @TableField(value = "icon")
    private String icon;
    /**
     * 跳转URL
     */
    @TableField(value = "redirect")
    private String redirect;
    /**
     * 是否缓存
     */
    @TableField(value = "cacheable")
    private Boolean cacheable;
    /**
     * 是否需要认证
     */
    @TableField(value = "require_auth")
    private Boolean requireAuth;
    /**
     * 前端资源路径
     */
    @TableField(value = "component")
    private String component;


    public Boolean isEnable(){
        return enabled == 1;
    }

}
