package com.qianfeng.mapper;

import com.qianfeng.dao.IBaseDao;
import com.qianfeng.entity.TOrderDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TOrderDetailMapper extends IBaseDao<TOrderDetail>{
    int deleteByPrimaryKey(Integer odid);

    int insert(TOrderDetail record);

    int insertSelective(TOrderDetail record);

    TOrderDetail selectByPrimaryKey(Integer odid);

    int updateByPrimaryKeySelective(TOrderDetail record);

    int updateByPrimaryKey(TOrderDetail record);

    void insertOrderDetail(TOrderDetail tOrderDetail);

    List<TOrderDetail> selectAllfromOrderDetailByOrderNumber(@Param("orderNumber") Integer orderNumber, @Param("zxos") Integer zxos);

    void deleteDeatilByorderNumber(Integer orderNumber);
}