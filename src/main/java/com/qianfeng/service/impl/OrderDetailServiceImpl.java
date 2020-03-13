package com.qianfeng.service.impl;

import com.qianfeng.dao.IBaseDao;
import com.qianfeng.entity.TOrderDetail;
import com.qianfeng.mapper.TOrderDetailMapper;
import com.qianfeng.service.TOrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderDetailServiceImpl extends BaseServiceImpl<TOrderDetail> implements TOrderDetailService{

    @Autowired
    private TOrderDetailMapper tOrderDetailMapper;
    @Override
    public IBaseDao<TOrderDetail> getDao() {
        return tOrderDetailMapper;
    }

    @Override
    public void insertOrderDetail(TOrderDetail tOrderDetail) {
        tOrderDetailMapper.insertOrderDetail(tOrderDetail);
    }

    @Override
    public List<TOrderDetail> selectAllfromOrderDetailByOrderNumber(Integer orderNumber, Integer zxos) {
        return tOrderDetailMapper.selectAllfromOrderDetailByOrderNumber(orderNumber,zxos);
    }

    @Override
    public void deleteDeatilByorderNumber(Integer orderNumber) {
        tOrderDetailMapper.deleteDeatilByorderNumber(orderNumber);
    }
}
