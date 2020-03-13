package com.qianfeng.service.impl;

import com.qianfeng.dao.IBaseDao;
import com.qianfeng.entity.TShopcar;
import com.qianfeng.mapper.TShopcarMapper;
import com.qianfeng.service.TShopcarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShopcarServiceImpl extends BaseServiceImpl<TShopcar> implements TShopcarService{
    @Autowired
    private TShopcarMapper tShopcarMapper;
    @Override
    public IBaseDao<TShopcar> getDao() {
        return tShopcarMapper;
    }

    @Override
    public void deleteProductByUidAndPid(Integer uid, Integer pid) {
        tShopcarMapper.deleteProductByUidAndPid(uid,pid);
    }
}
