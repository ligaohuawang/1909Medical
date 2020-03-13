package com.qianfeng.mapper;

import com.qianfeng.dao.IBaseDao;
import com.qianfeng.entity.*;
import org.apache.ibatis.annotations.Param;

import java.sql.Time;
import java.util.List;
import java.util.Timer;

public interface TZxnewsMapper extends IBaseDao<TZxnews>{

    //查询所有的咨询项目
    List<TItem> selItem();

    //根据科室查询医生
    List<TDoctor> selDoctor(String xmname);

    //添加咨询订单
    int insOrder(TZxorder tZxorder);

    //添加咨询信息
    void insmeans(TZxnews tZxnews);

    //修改订单支付状态
    void updOrder(@Param("tidings")String tidings,@Param("zxoid") String zxoid);

    //添加历史病例
    void insTMedicalHistory(TMedicalHistory tMedicalHistory);
}