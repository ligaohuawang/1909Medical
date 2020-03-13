package com.qianfeng.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.qianfeng.entity.TOrderDetail;
import com.qianfeng.entity.TProductOrder;
import com.qianfeng.service.TOrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/orderDetail")
public class TOrderDetailController {
    @Autowired
    private TOrderDetailService tOrderDetailService;

    @RequestMapping("/selectAllfromOrderDetailByOrderNumber")
    public String selectAllfromOrderDetailByOrderNumber(@RequestParam("orderNumber") Integer orderNumber, Integer currentPage, Integer pageSize, Model model, HttpSession session, Integer zxos){
        //第一次分页，先赋值
        if (currentPage == null && pageSize == null) {
            currentPage = 1;
            pageSize = 4;
        }
        PageHelper.startPage(currentPage, pageSize);
        List<TOrderDetail> orderDetailList = tOrderDetailService.selectAllfromOrderDetailByOrderNumber(orderNumber,zxos);
        PageInfo<TOrderDetail> page = new PageInfo<TOrderDetail>(orderDetailList);

        Gson gson = new Gson();
        Map<String,Object> paramMap = new HashMap<String,Object>();
        paramMap.put("zxos",zxos);

        model.addAttribute("params",gson.toJson(paramMap));
        model.addAttribute("page",page);
        model.addAttribute("zxos",zxos);
        model.addAttribute("url","productOrder/selectAllfromOrderDetailByOrderNumber");

        return "product/order_detail";
    }
}
