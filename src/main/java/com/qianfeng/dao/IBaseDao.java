package com.qianfeng.dao;



public interface IBaseDao<T>{
    int deleteByPrimaryKey(Integer uid);

    int insert(T record);

    int insertSelective(T record);

    T selectByPrimaryKey(Integer uid);

    int updateByPrimaryKeySelective(T record);

    int updateByPrimaryKey(T record);



}
