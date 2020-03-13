package com.qianfeng.mapper;

import com.qianfeng.dao.IBaseDao;
import com.qianfeng.entity.TProduct;
import com.qianfeng.entity.TShopcar;
import org.apache.ibatis.annotations.Param;
import com.qianfeng.pojo.ConfirmOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TProductMapper extends IBaseDao<TProduct>{

    List<String> queryType(TProduct product);

    List<String> queryFunction(TProduct product);

    List<String> queryBrand(TProduct product);

    List<TProduct> queryProductList(TProduct product);


    TProduct queryProductById(int pid);


    List<ConfirmOrder> selectProductFromByUidAndPid(@Param("idArray") List<Integer> idArray, @Param("uid") Integer uid);
}