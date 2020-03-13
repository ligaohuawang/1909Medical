package com.qianfeng.service;

import com.qianfeng.entity.SysResult;
import com.qianfeng.entity.TDoctor;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface IDoctorService extends IBaseService<TDoctor> {
    TDoctor login2(TDoctor doctor);

    List<TDoctor> queryDoctorList(TDoctor doctor);

    TDoctor querydetail(int did);
}
