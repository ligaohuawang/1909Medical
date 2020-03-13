package com.qianfeng.service;

import com.qianfeng.entity.SysResult;
import com.qianfeng.entity.TAddress;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface IAddressService extends IBaseService<TAddress>{
    List<TAddress> selectAddressByUid(Integer uid);

    TAddress selectAllFromAddressByAddressId(Integer addressId);

    SysResult addAddress(TAddress address, HttpSession session);

    TAddress toupdate(int addressId);

    SysResult updateAddress(TAddress address);

    SysResult deleteAddress(int addressId);
}
