package com.qianfeng.mapper;

import com.qianfeng.dao.IBaseDao;
import com.qianfeng.entity.TProductOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TProductOrderMapper extends IBaseDao<TProductOrder>{

    void insertProductOrder(TProductOrder tProductOrder);

    List<TProductOrder> selectByContentAndUid(@Param("uid") Integer uid,  @Param("zxos") Integer zxos);

    TProductOrder selectProductOrderByorderNumber(Integer orderNumber);

    void deleteProductOrderByorderNumber(Integer orderNumber);
}