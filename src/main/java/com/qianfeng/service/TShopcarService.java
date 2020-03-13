package com.qianfeng.service;

import com.qianfeng.entity.TShopcar;

public interface TShopcarService extends IBaseService<TShopcar>{
    void deleteProductByUidAndPid(Integer uid, Integer pid);
}
