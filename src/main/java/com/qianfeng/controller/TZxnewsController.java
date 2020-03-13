package com.qianfeng.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qianfeng.entity.*;
import com.qianfeng.service.TZxnewsService;
import com.sun.tools.internal.xjc.reader.xmlschema.bindinfo.BIConversion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/advice")
public class TZxnewsController {

    @Autowired
    private TZxnewsService tZxnewsService;

    //查询所有咨询项目
    @RequestMapping("item")
    public String selitem(Model model){

       List<TItem> timerList = tZxnewsService.selItem();

       model.addAttribute("timerList",timerList);
        return "news/seek_project";
    }

    //根据咨询项目查询医生
    @RequestMapping("doctr")
    public String selDoctor(Integer currentPage, Integer pageSize, TItem tItem, HttpSession session, Model model){

        //第一次分页，先赋值
        if (currentPage == null && pageSize == null) {
            currentPage = 1;
            pageSize = 2;
        }

        PageHelper.startPage(currentPage, pageSize);
        List<TDoctor> doctorList = null;

        //有些请求会从Page.jsp发出，从session中取值
        if (tItem.getXmname() == null){

            tItem = (TItem) session.getAttribute("tItem");
            doctorList = tZxnewsService.selDoctor(tItem.getXmname());

        }else{
            session.setAttribute("tItem",tItem);
            doctorList = tZxnewsService.selDoctor(tItem.getXmname());
        }

        PageInfo<TDoctor> page = new PageInfo<TDoctor>(doctorList);
        model.addAttribute("page", page);
        model.addAttribute("url","/advice/doctr");
        return "news/seek_doctor";
    }

    //跳转咨询信息页面，并保存选择医生的名字
    @RequestMapping("information/{dname}")
    public String information(@PathVariable("dname") String dname, HttpSession session){

        session.setAttribute("dname",dname);

        return "news/seek_information";
    }

    //生成咨询信息和咨询订单
    @RequestMapping("generate")
    public String generate(TZxnews tZxnews,TMedicalHistory tMedicalHistory,HttpSession session, Model model){

        TZxorder tZxorder = new TZxorder();
        //从session中取出咨询项目的值
        TItem tItem = (TItem) session.getAttribute("tItem");
        tZxorder.setXmname(tItem.getXmname());//咨询项目
        tZxorder.setXmprice(tItem.getXmprice());//咨询价格

        //从session中获得登陆用户的ID
        TUser user = (TUser) session.getAttribute("user");
        tZxorder.setUid(user.getUid());
        tMedicalHistory.setUid(user.getUid());

        //从session中取出选择的医生名字
        String dname = (String) session.getAttribute("dname");
        tZxorder.setDname(dname);

        //创建订单时间，和支付状态,是否有效
        tZxorder.setCreatetime(new Date());
        tZxorder.setOstate(2);
        tZxorder.setCancel(1);

        int oid = tZxnewsService.insOrder(tZxorder);

        //添加咨询信息
        if (oid >0){
            //获得订单ID
            tZxnews.setZxoid(tZxorder.getZxoid());

            tZxnewsService.insmeans(tZxnews);

            //添加历史病例
            tZxnewsService.insTMedicalHistory(tMedicalHistory);
        }

        model.addAttribute("tZxorder",tZxorder);
        return "news/seek_payment";
    }

    /**
     *
     * @return
     */
    @RequestMapping("payment")
    public String payment(TZxorder tZxorder,Model model){

        model.addAttribute("tZxorder",tZxorder);

        return "news/seek_payment";
    }

    //修改订单状态
    @RequestMapping("order")
    public String updOrder(String tidings,String zxoid){


        tZxnewsService.updOrder(tidings,zxoid);


        if ("confirm".equals(tidings)){

            return "news/seek_complete";
        }

        return "news/seek_cancel";
    }
}
