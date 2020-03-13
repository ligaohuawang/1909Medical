package com.qianfeng.service;

import com.qianfeng.entity.SysResult;
import com.qianfeng.entity.TProduct;
import com.qianfeng.pojo.ConfirmOrder;
import com.qianfeng.entity.TShopcar;
import com.qianfeng.model.ShopcarModel;
import org.apache.ibatis.annotations.Param;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface IProductService extends IBaseService<TProduct>{
    List<String> queryType(TProduct product);

    List<String> queryFunction(TProduct product);

    List<String> queryBrand(TProduct product);

    List<TProduct> queryProductList(TProduct product);

    List<ShopcarModel> queryShopcar(Integer uid);
    List<ConfirmOrder> selectProductFromByUidAndPid(List<Integer> idArray,Integer uid);

    TProduct queryProductById(int pid);

    SysResult addShopcar(int pid, int number, HttpSession session);

    SysResult addNumber(int sid);

    SysResult cutNumber(int sid);
}
