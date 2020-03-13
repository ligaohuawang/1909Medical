package com.qianfeng.service;

import com.qianfeng.entity.*;

import java.sql.Time;
import java.util.List;
import java.util.Timer;

public interface TZxnewsService extends IBaseService<TZxnews> {

    //查询所有的咨询项目
    List<TItem> selItem();

    //根据科室查询医生
    List<TDoctor> selDoctor(String xmname);

    //插入咨询订单
    int insOrder(TZxorder tZxorder);

    //添加咨询信息
    void insmeans(TZxnews tZxnews);

    //修改订单状态
    void updOrder(String tidings,String zxoid);

    //添加历史病例
    void insTMedicalHistory(TMedicalHistory tMedicalHistory);
}
