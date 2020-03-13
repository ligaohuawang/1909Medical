package com.qianfeng.mapper;

import com.qianfeng.dao.IBaseDao;
import com.qianfeng.entity.TAddress;

import java.util.List;

public interface TAddressMapper extends IBaseDao<TAddress>{

    List<TAddress> selectAddressByUid(Integer uid);

    TAddress selectAllFromAddressByAddressId(Integer addressId);

    int addAddress(TAddress address);

    TAddress toupdate(int addressId);

    int updateAddress(TAddress address);

    int deleteAddress(int addressId);
}