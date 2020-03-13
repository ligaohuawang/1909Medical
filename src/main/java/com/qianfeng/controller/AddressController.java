package com.qianfeng.controller;

import com.qianfeng.entity.SysResult;
import com.qianfeng.entity.TAddress;
import com.qianfeng.service.IAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("address")
public class AddressController {

    @Autowired
    IAddressService addressService;

    /**
     * 添加地址
     * @param address
     * @param session
     * @return
     */
    @RequestMapping("addAddress")
@ResponseBody
    public SysResult addAddress(TAddress address, HttpSession session){
return addressService.addAddress(address,session);
}

    /**
     * 修改地址
     * @param address
     * @return
     */
    @RequestMapping("updateAddress")
@ResponseBody
    public SysResult updateAddress(TAddress address){
return addressService.updateAddress(address);
}

    /**
     * 准备修改地址
     * @param map
     * @param addressId
     * @return
     */
    @RequestMapping("toupdate")
    public String toupdate(ModelMap map , int addressId){
       TAddress address = addressService.toupdate(addressId);
       map.put("address",address);
return "address/address_update";
}

    /**
     * 删除一个类型
     * @param addressId
     * @return
     */
    @RequestMapping("deleteAddress")
    @ResponseBody
    public SysResult deleteAddress(@RequestParam("addressId") int addressId){

        return  addressService.deleteAddress(addressId);
    }
}
