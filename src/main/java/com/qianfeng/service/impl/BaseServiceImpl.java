package com.qianfeng.service.impl;


import com.qianfeng.dao.IBaseDao;
import com.qianfeng.service.IBaseService;

public abstract class BaseServiceImpl<T> implements IBaseService<T> {
    //定义一个抽象方法，返回的是某个mapper对象的代理对象
    public abstract IBaseDao<T> getDao();

    @Override
    public int deleteByPrimaryKey(Integer uid) {
      return getDao().deleteByPrimaryKey(uid);
    }

    @Override
    public int insert(T record) {

        return getDao().insert(record);
    }

    @Override
    public int insertSelective(T record) {

        return getDao().insertSelective(record);
    }

    @Override
    public T selectByPrimaryKey(Integer uid) {

        return (T) getDao().selectByPrimaryKey(uid);
    }

    @Override
    public int updateByPrimaryKeySelective(T record) {

        return getDao().updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(T record) {

        return getDao().updateByPrimaryKey(record);
    }
}
