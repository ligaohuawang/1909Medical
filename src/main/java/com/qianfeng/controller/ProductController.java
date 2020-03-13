package com.qianfeng.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.qianfeng.entity.SysResult;
import com.qianfeng.entity.TAddress;
import com.qianfeng.entity.TProduct;
import com.qianfeng.entity.TUser;
import com.qianfeng.model.ShopcarModel;
import com.qianfeng.pojo.ConfirmOrder;
import com.qianfeng.service.IAddressService;
import com.qianfeng.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    IProductService productservice;
    @Autowired
    IAddressService addressService;

    /**
     * 查找商品
     * @param map
     * @param product

     * @return
     */
    @RequestMapping("queryProductList")
    public String queryProductList(HttpSession session ,ModelMap map, TProduct product, int currentPage, int pageSize) {
       System.out.println(product);
        List<String> typeList = productservice.queryType(product);
        List<String> functionList = productservice.queryFunction(product);
        List<String> brandList = productservice.queryBrand(product);
        PageHelper.startPage(currentPage, pageSize);
        List<TProduct> list = productservice.queryProductList(product);
        PageInfo<TProduct> page = new PageInfo<>(list);
        Gson gson = new Gson();
        Map<String,Object> paramMap = new HashMap<String,Object>();
        paramMap.put("pptype",product.getPptype());
        paramMap.put("ptype",product.getPtype());
        paramMap.put("pfunction",product.getPfunction());
        paramMap.put("pbrand",product.getPbrand());
        map.put("params",gson.toJson(paramMap));//把条件转换成json数据，页面进行获取
        map.put("page", page);
        map.put("typeList", typeList);
        map.put("functionList", functionList);
        map.put("brandList", brandList);
        session.setAttribute("productData", product);
        map.put("url","product/queryProductList");
        return "product/product_list";
    }

    /**
     * 根据用户和商品id查询购物车及商品信息
     * @param idArray
     * @param session
     * @param map
     * @return
     */
    @RequestMapping("/selectProductFromByUidAndPid")
public String selectProductFromByUidAndPid(@RequestParam("idArray") List<Integer> idArray,HttpSession session, ModelMap map ){
       TUser user =(TUser) session.getAttribute("user");
       //查询购物车中商品
    List<ConfirmOrder> confirmOrderList = productservice.selectProductFromByUidAndPid(idArray,user.getUid());
    //计算商品总价
    double total=0.0;
        for (ConfirmOrder confirmOrder:confirmOrderList
             ) {
           total+= confirmOrder.getPrice()*confirmOrder.getNumber();
        }
        map.put("total",total);
    map.put("confirmOrderList",confirmOrderList);

    //存session
    session.setAttribute("confirmOrderList",confirmOrderList);

    //查询用户地址
       List<TAddress> addressList = addressService.selectAddressByUid(user.getUid());
       map.put("addressList",addressList);
        return "product/submit_product_order2";
}

    /**
     * 查询购物车
     * @param curr
     * @param num
     * @param session
     * @param map
     * @return
     */
    @RequestMapping("queryShopcar")
    public String queryShopcar(int curr, int num, HttpSession session, ModelMap map) {
        TUser user = (TUser) session.getAttribute("user");
        List<ShopcarModel> shopcarList = productservice.queryShopcar(user.getUid());
        map.put("shopcarList", shopcarList);
        for (ShopcarModel shop : shopcarList
                ) {
            System.out.println(shop);
        }
        return "product/confirm_order";
    }

    /**
     * 进入商品详情
     */
    @RequestMapping("todetail")
    public String todetail(int pid, ModelMap map) {
        TProduct product = productservice.queryProductById(pid);
        map.put("product", product);
        return "product/product_details";
    }

    /**
     * 加入购物车
     *
     * @param pid
     * @param number
     * @return
     */
    @RequestMapping("addShopcar")
    @ResponseBody
    public SysResult addShopcar(int pid, int number,HttpSession session) {
       return productservice.addShopcar(pid, number,session);
    }

    /*TODO 加减商品数量*/
    /**
     * 添加购物车数量
     */
    @RequestMapping("addNumber")
    @ResponseBody
    public SysResult addNumber(int sid){
        return  productservice.addNumber(sid);
    }

    /**
     * 减购物车数量
     */
    @RequestMapping("cutNumber")
    @ResponseBody
    public SysResult cutNumber(int sid){
        return  productservice.cutNumber(sid);
    }




}
