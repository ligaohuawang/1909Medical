package com.qianfeng.service.impl;

import com.qianfeng.dao.IBaseDao;
import com.qianfeng.entity.*;
import com.qianfeng.mapper.TZxnewsMapper;
import com.qianfeng.service.TZxnewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ZxnewsServiceImpl extends  BaseServiceImpl<TZxnews> implements TZxnewsService {

    @Autowired
    private TZxnewsMapper tZxnewsMapper;

    @Override
    public IBaseDao<TZxnews> getDao() {
        return tZxnewsMapper;
    }

    //查询所有的咨询项目
    @Override
    public List<TItem> selItem() {

        return tZxnewsMapper.selItem();
    }

    //根据科室查询医生
    @Override
    public List<TDoctor> selDoctor(String xmname) {
        return tZxnewsMapper.selDoctor(xmname);
    }

    //插入咨询订单
    @Override
    public int insOrder(TZxorder tZxorder) {
        return tZxnewsMapper.insOrder(tZxorder);
    }

    //插入咨询信息
    @Override
    public void insmeans(TZxnews tZxnews) {
        tZxnewsMapper.insmeans(tZxnews);
    }

    //修改订单状态
    @Override
    public void updOrder(String tidings,String zxoid) {
        tZxnewsMapper.updOrder(tidings,zxoid);
    }

    /**
     * 添加历史病例
     * @param tMedicalHistory
     */
    @Override
    public void insTMedicalHistory(TMedicalHistory tMedicalHistory) {
        tZxnewsMapper.insTMedicalHistory(tMedicalHistory);
    }
}
