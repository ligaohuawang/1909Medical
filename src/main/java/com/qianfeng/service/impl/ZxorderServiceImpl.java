package com.qianfeng.service.impl;

import com.qianfeng.dao.IBaseDao;
import com.qianfeng.entity.TZxorder;
import com.qianfeng.mapper.TZxorderMapper;
import com.qianfeng.service.ITZxorderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ZxorderServiceImpl extends BaseServiceImpl<TZxorder> implements ITZxorderService{
    @Autowired
    private TZxorderMapper iZxorderMapper;
    @Override
    public IBaseDao<TZxorder> getDao() {
        return iZxorderMapper;
    }

    //分页查询
    @Override
    public List<TZxorder> selectByContent(Integer uid,Integer zxos) {
        return iZxorderMapper.selectByContent(uid,zxos);
    }
}
