package com.sunseagear.wind.modules.sys.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sunseagear.wind.modules.sys.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserMapper extends BaseMapper<User> {

    /**
     * @param wrapper
     * @return
     * @title: selectUserList
     * @description: 查找用户列表
     * @return: List<User>
     */
    List<User> selectUserList(Page page, @Param("ew") Wrapper<User> wrapper);
}
