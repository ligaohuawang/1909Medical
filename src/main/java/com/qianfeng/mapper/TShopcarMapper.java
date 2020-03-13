package com.qianfeng.mapper;

import com.qianfeng.dao.IBaseDao;
import com.qianfeng.entity.SysResult;
import com.qianfeng.entity.TShopcar;
import com.qianfeng.model.ShopcarModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TShopcarMapper extends IBaseDao<TShopcar>{
    int deleteByPrimaryKey(Integer sid);

    int insert(TShopcar record);

    int insertSelective(TShopcar record);

    TShopcar selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(TShopcar record);

    int updateByPrimaryKey(TShopcar record);

    List<ShopcarModel> queryShopcar(@Param("uid") Integer uid);

    int addShopcar(@Param("pid") int pid, @Param("uid") Integer uid, @Param("number") int number);

    SysResult addNumber(int sid);

    SysResult cutNumber(int sid);

    void deleteProductByUidAndPid(@Param("uid")Integer uid, @Param("pid")Integer pid);
}