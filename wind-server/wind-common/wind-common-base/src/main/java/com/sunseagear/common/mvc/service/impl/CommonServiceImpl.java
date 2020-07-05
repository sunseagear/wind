package com.sunseagear.common.mvc.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sunseagear.common.http.DuplicateValid;
import com.sunseagear.common.mvc.service.ICommonService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

@Transactional
public class CommonServiceImpl<M extends BaseMapper<T>, T> extends ServiceImpl<M, T> implements ICommonService<T> {
    protected boolean isDemo = false;

    public Page<T> selectPage(Page<T> page) {
        return (Page<T>) page(page);
    }

    @Override
    public boolean deleteById(Serializable id) {
        if (isDemo) {
            return true;
        }
        return removeById(id);
    }

    @Override
    public boolean update(T entity) {
        if (isDemo) {
            return true;
        }
        return updateById(entity);
    }

    @Override
    public boolean insert(T entity) {
        if (isDemo) {
            return true;
        }
        return save(entity);
    }

    @Override
    public boolean insertOrUpdate(T entity) {
        if (isDemo) {
            return true;
        }
        return saveOrUpdate(entity);
    }

    @Override
    public boolean insertOrUpdateBatch(List<T> list) {
        if (isDemo) {
            return true;
        }
        return saveOrUpdateBatch(list);
    }

    @Override
    public int selectCount(Wrapper<T> wrapper) {
        return count(wrapper);
    }

    @Override
    public void insertBatch(List<T> entityList) {
        if (isDemo) {
            return;
        }
        saveOrUpdateBatch(entityList);

    }

    @Override
    public boolean saveBatch(Collection<T> entityList) {
        if (isDemo) {
            return true;
        }
        return super.saveBatch(entityList);
    }

    @Override
    public void deleteBatchIds(List<Serializable> idList) {
        if (isDemo) {
            return;
        }
        removeByIds(idList);
    }

    @Override
    public boolean removeByIds(Collection<? extends Serializable> idList) {
        if (isDemo) {
            return true;
        }
        return super.removeByIds(idList);
    }

    @Override
    public List<T> selectList(Wrapper<T> wrapper) {
        return list(wrapper);
    }

    @Override
    public Boolean doValid(DuplicateValid duplicateValid, Wrapper<T> wrapper) {
        Boolean valid = Boolean.FALSE;
        String queryType = duplicateValid.getQueryType();
        if (StringUtils.isEmpty(queryType)) {
            queryType = "table";
        }
        if (queryType.equals("table")) {
            valid = validTable(duplicateValid, (QueryWrapper<T>) wrapper);
        }
        return valid;
    }

    @Override
    public boolean delete(Wrapper<T> wrapper) {
        if (isDemo) {
            return true;
        }
        return remove(wrapper);
    }

    @Override
    public boolean remove(Wrapper<T> wrapper) {
        if (isDemo) {
            return true;
        }
        return super.remove(wrapper);
    }

    @Override
    public T selectById(Serializable id) {
        return getById(id);
    }

    @Override
    public Page<T> selectPage(Page<T> page, Wrapper<T> wrapper) {
        return (Page<T>) page(page, wrapper);
    }

    @Override
    public T selectOne(Wrapper<T> wrapper) {
        return getOne(wrapper);
    }

    private Boolean validTable(DuplicateValid duplicateValid, QueryWrapper<T> wrapper) {
        Integer num = null;
        String extendName = duplicateValid.getExtendName();
        String extendParam = duplicateValid.getExtendParam();
        if (!StringUtils.isEmpty(extendParam)) {
            // [2].编辑页面校验
            wrapper.eq(duplicateValid.getName(), duplicateValid.getParam()).ne(extendName, extendParam);
            num = baseMapper.selectCount(wrapper);
        } else {
            // [1].添加页面校验
            wrapper.eq(duplicateValid.getName(), duplicateValid.getParam());
            num = baseMapper.selectCount(wrapper);
        }

        if (num == null || num == 0) {
            // 该值可用
            return true;
        } else {
            // 该值不可用
            return false;
        }
    }

}
