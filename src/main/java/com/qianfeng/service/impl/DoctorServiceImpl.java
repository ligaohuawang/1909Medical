package com.qianfeng.service.impl;

import com.qianfeng.dao.IBaseDao;
import com.qianfeng.entity.TDoctor;
import com.qianfeng.mapper.TDoctorMapper;
import com.qianfeng.service.IDoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DoctorServiceImpl extends BaseServiceImpl<TDoctor> implements IDoctorService {
    @Autowired
    private  TDoctorMapper tDoctorMapper;
    @Override
    public IBaseDao<TDoctor> getDao() {
        return tDoctorMapper;
    }

    @Override
    public TDoctor login2(TDoctor doctor) {

        return tDoctorMapper.login2(doctor);
    }

    @Override
    public List<TDoctor> queryDoctorList(TDoctor doctor) {
        return tDoctorMapper.queryDoctorList(doctor);
    }

    @Override
    public TDoctor querydetail(int did) {
        return tDoctorMapper.querydetail( did);
    }
}
