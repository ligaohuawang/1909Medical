package com.qianfeng.service.impl;

import com.qianfeng.dao.IBaseDao;
import com.qianfeng.entity.SysResult;
import com.qianfeng.entity.TAddress;
import com.qianfeng.entity.TUser;
import com.qianfeng.mapper.TAddressMapper;
import com.qianfeng.service.IAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class AddressServiceImpl extends BaseServiceImpl<TAddress> implements IAddressService{
    @Autowired
    private TAddressMapper tAddressMapper;
    @Override
    public IBaseDao<TAddress> getDao() {
        return tAddressMapper;
    }

    @Override
    public List<TAddress> selectAddressByUid(Integer uid) {
        return tAddressMapper.selectAddressByUid(uid);
    }

    @Override
    public TAddress selectAllFromAddressByAddressId(Integer addressId) {
        return tAddressMapper.selectAllFromAddressByAddressId(addressId);
    }

    @Override
    public SysResult addAddress(TAddress address, HttpSession session) {
        SysResult sysResult = new SysResult();
       TUser user = (TUser) session.getAttribute("user");
       address.setUid(user.getUid());
       int a =  tAddressMapper.addAddress(address);
       if(a > 0){
           sysResult.setResult(true);
           return sysResult;
       }else {
           sysResult.setResult(false);
           return sysResult;
       }
    }

    @Override
    public TAddress toupdate(int addressId) {
        return tAddressMapper.toupdate(addressId);
    }

    @Override
    public SysResult updateAddress(TAddress address) {
        SysResult sysResult = new SysResult();
        int a =  tAddressMapper.updateAddress(address);
        if(a > 0){
            sysResult.setResult(true);
            return sysResult;
        }else {
            sysResult.setResult(false);
            return sysResult;
        }
    }

    @Override
    public SysResult deleteAddress(int addressId) {
        SysResult sysResult = new SysResult();
        int a =  tAddressMapper.deleteAddress(addressId);
        if(a > 0){
            sysResult.setResult(true);
            return sysResult;
        }else {
            sysResult.setResult(false);
            return sysResult;
        }
    }
}
