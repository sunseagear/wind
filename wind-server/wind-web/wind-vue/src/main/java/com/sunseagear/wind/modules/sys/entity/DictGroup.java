package com.sunseagear.wind.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.sunseagear.common.mvc.entity.DataEntity;

@TableName("sys_dict_group")
@SuppressWarnings("serial")
public class DictGroup extends DataEntity<String> {

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.UUID)
    private String id;
    /**
     * 分组名称
     */
    @TableField(value = "name")
    private String name;

    /**
     * 分组编码
     */
    @TableField(value = "code")
    private String code;


    /**
     * 获取 code
     *
     * @return: String 分组编码
     */
    public String getCode() {
        return this.code;
    }

    /**
     * 设置 code
     *
     * @param: code
     * 分组编码
     */
    public void setCode(String code) {
        this.code = code;
    }

    /**
     * 获取 id
     *
     * @return: String 主键
     */
    public String getId() {
        return this.id;
    }

    /**
     * 设置 id
     *
     * @param: id
     * 主键
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 获取 name
     *
     * @return: String 分组名称
     */
    public String getName() {
        return this.name;
    }

    /**
     * 设置 name
     *
     * @param: name
     * 分组名称
     */
    public void setName(String name) {
        this.name = name;
    }

}
