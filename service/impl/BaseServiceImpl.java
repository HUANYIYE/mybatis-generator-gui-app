package com.xcar.ad.push.service.impl;

import com.xcar.ad.push.dao.BaseMapper;
import com.xcar.ad.push.service.BaseService;
import lombok.extern.slf4j.Slf4j;

import java.io.Serializable;
import java.util.List;

@Slf4j
public class BaseServiceImpl<Model, PK extends Serializable, E> implements BaseService<Model, PK, E> {


    private BaseMapper<Model, PK, E> baseMapper;

    public void setBaseMapper(BaseMapper baseMapper){
        this.baseMapper = baseMapper;
    }

    @Override
    public int deleteById(PK id) {
        return baseMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int save(Model record) {
        return baseMapper.insertSelective(record);
    }

    @Override
    public List<Model> findAll(E example) {
        return baseMapper.selectByExample(example);
    }

    @Override
    public Model findById(PK id) {
        return baseMapper.selectByPrimaryKey(id);
    }

    @Override
    public int update(Model record) {
        return baseMapper.updateByPrimaryKeySelective(record);
    }
}
