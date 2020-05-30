package com.sunseagear.common.mvc.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.sunseagear.common.http.DuplicateValid;

import java.io.Serializable;
import java.util.List;

public interface ICommonService<T> extends IService<T> {

    Boolean doValid(DuplicateValid duplicateValid, Wrapper<T> wrapper);

    boolean delete(Wrapper<T> wrapper);

    T selectById(Serializable id);

    Page<T> selectPage(Page<T> page, Wrapper<T> wrapper);

    T selectOne(Wrapper<T> wrapper);

    boolean deleteById(Serializable id);

    boolean update(T entity);

    boolean insert(T entity);

    boolean insertOrUpdate(T entity);

    boolean insertOrUpdateBatch(List<T> list);

    int selectCount(Wrapper<T> wrapper);


    void insertBatch(List<T> userRoleList);

    void deleteBatchIds(List<Serializable> idList);

    List<T> selectList(Wrapper<T> wrapper);

}
