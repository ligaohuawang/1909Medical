package com.qianfeng.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.qianfeng.entity.TAddress;
import com.qianfeng.entity.TOrderDetail;
import com.qianfeng.entity.TProductOrder;
import com.qianfeng.entity.TUser;
import com.qianfeng.pojo.ConfirmOrder;
import com.qianfeng.service.IAddressService;
import com.qianfeng.service.TOrderDetailService;
import com.qianfeng.service.TProductOrderService;
import com.qianfeng.service.TShopcarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/productOrder")
public class ProductOrderController {

    @Autowired
    private IAddressService addressService;

    @Autowired
    private TShopcarService tShopcarService;

    @Autowired
    private TProductOrderService tProductOrderService;

    @Autowired
    private TOrderDetailService tOrderDetailService;


    @RequestMapping("addProductOrder")
    public String addProductOrder(Integer addressId, String sendMethod, String payMethod, HttpSession session){
      List<ConfirmOrder> confirmOrderList = (List<ConfirmOrder>) session.getAttribute("confirmOrderList");
        //地址id(收货人,收货人电话)
        TAddress address=addressService.selectAllFromAddressByAddressId(addressId);
        //从session拿confirmOrderList1
        List<ConfirmOrder> confirmOrderList1 = (List<ConfirmOrder>) session.getAttribute("confirmOrderList");
        //计算商品总价
        double total=0.0;
        for (ConfirmOrder confirmOrder:confirmOrderList
                ) {
            total+= confirmOrder.getPrice()*confirmOrder.getNumber();
        }

        TUser user = (TUser) session.getAttribute("user");

        TProductOrder tProductOrder = new TProductOrder();
        tProductOrder.setShouhuorenphone(address.getPhone());
        tProductOrder.setOrderPrice(total);
        tProductOrder.setCreateTime(new Date());
        tProductOrder.setOrderStatus(2);
        tProductOrder.setUid(user.getUid());
        tProductOrder.setAddressId(addressId);
        tProductOrder.setPayMethod(payMethod);
        tProductOrder.setExpressMethod(sendMethod);
        tProductOrder.setShouhuoren(address.getShouhuoren());
        //插入订单表，生成订单
        tProductOrderService.insertProductOrder(tProductOrder);

        //插入订单详情表，并且删除购物车中的商品
        for (ConfirmOrder confirmOrder:confirmOrderList
             ) {
            TOrderDetail tOrderDetail = new TOrderDetail();
            tOrderDetail.setOrderNumber(tProductOrder.getOrderNumber());//订单编号，主键回填得到
            tOrderDetail.setNumber(confirmOrder.getNumber());//商品数量
            tOrderDetail.setPid(confirmOrder.getPid());//商品id
            tOrderDetail.setOrderPrice(confirmOrder.getNumber()*confirmOrder.getPrice());//商品价格*商品
            tOrderDetail.setPname(confirmOrder.getPname());//商品名称
            tOrderDetail.setPpicture(confirmOrder.getPpicture());//商品图片
            //插入订单详情表
            tOrderDetailService.insertOrderDetail(tOrderDetail);
            //根据用户id和这个商品的id去购物车将商品删除
            tShopcarService.deleteProductByUidAndPid(user.getUid(),confirmOrder.getPid());
        }

        return "redirect:/productOrder/selectOrderFromProductOrderByUid";
    }

    /**
     * 根据订单编号查询订单信息并且分页显示
     * @param
     * @return
     */
    @RequestMapping("/selectOrderFromProductOrderByUid")
    public String selectOrderFromProductOrderByUid(Integer currentPage, Integer pageSize, Model model, HttpSession session, Integer zxos){
        //第一次分页，先赋值
        if (currentPage == null && pageSize == null) {
            currentPage = 1;
            pageSize = 4;
        }

        PageHelper.startPage(currentPage, pageSize);

       TUser user=(TUser)session.getAttribute("user");

        List<TProductOrder> pageProductOrderList = tProductOrderService.selectByContentAndUid(user.getUid(),zxos);
        PageInfo<TProductOrder> page = new PageInfo<TProductOrder>(pageProductOrderList);

        Gson gson = new Gson();
        Map<String,Object> paramMap = new HashMap<String,Object>();
        paramMap.put("zxos",zxos);

        model.addAttribute("params",gson.toJson(paramMap));
        model.addAttribute("page",page);
        model.addAttribute("zxos",zxos);
        model.addAttribute("url","productOrder/selectOrderFromProductOrderByUid");


        return "product/product_order";
    }

    /**
     * 支付
     * @return
     */
    @RequestMapping("/pay")
    public String pay(@RequestParam("orderNumber") Integer orderNumber, ModelMap map){
        List<TOrderDetail> orderDetailList = tOrderDetailService.selectAllfromOrderDetailByOrderNumber(orderNumber,null);
        map.put("orderDetailList",orderDetailList);

        //计算总价
        Double total=0.0;
        for (TOrderDetail tOrderDetail:orderDetailList
             ) {
            total+=tOrderDetail.getOrderPrice();
        }
        map.put("total",total);
        //根据订单编号orderNumber查询一条订单信息
       TProductOrder tProductOrder = tProductOrderService.selectProductOrderByorderNumber(orderNumber);
       map.put("tProductOrder",tProductOrder);
        return "product/pay";
    }

    @RequestMapping("/deleteProductOrderAndDeatilByorderNumber")
    public String deleteProductOrderAndDeatilByorderNumber(@RequestParam("orderNumber") Integer orderNumber){

        //根据订单编号删除订单
        /*不是删除，而是修改，改sql了*/
        tProductOrderService.deleteProductOrderByorderNumber(orderNumber);
        //根据订单编号删除订单详情
         /*不是删除，而是修改，改sql了*/
        /*tOrderDetailService.deleteDeatilByorderNumber(orderNumber);*/
        return "product/paySuccess";
    }



}
