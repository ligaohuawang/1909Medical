package com.qianfeng.service;

import com.qianfeng.entity.TZxorder;

import java.util.List;

public interface ITZxorderService extends IBaseService<TZxorder>{


    //分页查询
    List<TZxorder> selectByContent(Integer uid,Integer zxos);
}
