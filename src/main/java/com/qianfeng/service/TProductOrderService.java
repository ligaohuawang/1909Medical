package com.qianfeng.service;

import com.qianfeng.entity.TProductOrder;

import java.util.List;

public interface TProductOrderService extends IBaseService<TProductOrder>{
    void insertProductOrder(TProductOrder tProductOrder);



    List<TProductOrder> selectByContentAndUid(Integer uid, Integer zxos);

    TProductOrder selectProductOrderByorderNumber(Integer orderNumber);

    void deleteProductOrderByorderNumber(Integer orderNumber);
}
