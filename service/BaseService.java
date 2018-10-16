package com.xcar.ad.push.service;

import java.io.Serializable;
import java.util.List;

public interface BaseService <Model, PK extends Serializable, E> {

    /**
     * 删除指定 id 的数据
     * @param id
     * @return
     */
    int deleteById(PK id);

    /**
     * 添加数据
     * @param record
     * @return
     */
    int save(Model record);

    /**
     * 按条件查询
     * @param example
     * @return
     */
    List<Model> findAll(E example);

    /**
     * 查询指定 id 数据
     * @param id
     * @return
     */
    Model findById(PK id);

    /**
     * 修改数据
     * @param record
     * @return
     */
    int update(Model record);
}
