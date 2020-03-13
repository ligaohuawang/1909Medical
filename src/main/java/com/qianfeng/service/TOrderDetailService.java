package com.qianfeng.service;

import com.qianfeng.entity.TOrderDetail;

import java.util.List;

public interface TOrderDetailService extends IBaseService<TOrderDetail>{
    void insertOrderDetail(TOrderDetail tOrderDetail);

    List<TOrderDetail> selectAllfromOrderDetailByOrderNumber(Integer orderNumber, Integer zxos);

    void deleteDeatilByorderNumber(Integer orderNumber);
}
