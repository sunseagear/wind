package com.sunseagear.common.mvc.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.sunseagear.common.http.DuplicateValid;

import java.io.Serializable;
import java.util.List;

public interface ICommonService<T> extends IService<T> {

    Boolean doValid(DuplicateValid duplicateValid, Wrapper<T> wrapper);

    boolean insert(T entity);

    void insertBatch(List<T> userRoleList);

    boolean insertOrUpdate(T entity);

    boolean insertOrUpdateBatch(List<T> list);

    boolean deleteById(Serializable id);

    boolean delete(Wrapper<T> wrapper);

    void deleteBatchIds(List<Serializable> idList);

    boolean update(T entity);

    T selectById(Serializable id);

    T selectOne(Wrapper<T> wrapper);

    Page<T> selectPage(Page<T> page, Wrapper<T> wrapper);

    int selectCount(Wrapper<T> wrapper);

    List<T> selectList(Wrapper<T> wrapper);


}
