package com.qianfeng.service.impl;

import com.qianfeng.dao.IBaseDao;
import com.qianfeng.entity.TProductOrder;
import com.qianfeng.mapper.TProductOrderMapper;
import com.qianfeng.service.TProductOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductOrderServiceImpl extends BaseServiceImpl<TProductOrder> implements TProductOrderService {
    @Autowired
    private TProductOrderMapper tProductOrderMapper;
    @Override
    public IBaseDao<TProductOrder> getDao() {
        return tProductOrderMapper;
    }

    @Override
    public void insertProductOrder(TProductOrder tProductOrder) {
        tProductOrderMapper.insertProductOrder(tProductOrder);
    }

    @Override
    public List<TProductOrder> selectByContentAndUid(Integer uid, Integer zxos) {
        return tProductOrderMapper.selectByContentAndUid(uid,zxos);
    }

    @Override
    public TProductOrder selectProductOrderByorderNumber(Integer orderNumber) {
        return tProductOrderMapper.selectProductOrderByorderNumber(orderNumber);
    }

    @Override
    public void deleteProductOrderByorderNumber(Integer orderNumber) {
        tProductOrderMapper.deleteProductOrderByorderNumber(orderNumber);
    }


}
