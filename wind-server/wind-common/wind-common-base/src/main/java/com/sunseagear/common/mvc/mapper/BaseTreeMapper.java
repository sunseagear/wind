package com.sunseagear.common.mvc.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.io.Serializable;
import java.util.List;

public interface BaseTreeMapper<T> extends BaseMapper<T> {
    /**
     * @param id
     * @return
     * @title: selectByPrimaryKey
     * @description: 查找主键
     * @return: Menu
     */
    T selectByTreeId(Serializable id);

    /**
     * @param wrapper
     * @return
     * @title: selectTreeList
     * @description: 查找列表
     * @return: List<T>
     */
    List<T> selectTreeList(@Param("ew") Wrapper<T> wrapper);

    /**
     * @param newParentIds
     * @param oldParentIds
     * @title: updateSunTreeParentId
     * @description: 更新ParentIds
     * @return: void
     */
    void updateSunTreeParentIds(@Param("newParentIds") String newParentIds, @Param("oldParentIds") String oldParentIds);

    /**
     * @param parentIds
     * @return
     * @title: selectTreeList
     * @description: 查找列表
     * @return: List<T>
     */
    void deleteSunTree(String parentIds);

}
