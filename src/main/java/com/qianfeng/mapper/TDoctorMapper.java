package com.qianfeng.mapper;

import com.qianfeng.dao.IBaseDao;
import com.qianfeng.entity.TDoctor;

import java.util.List;

public interface TDoctorMapper extends IBaseDao<TDoctor>{

    TDoctor login2(TDoctor doctor);

    List<TDoctor> queryDoctorList(TDoctor doctor);

    TDoctor querydetail(int did);
}