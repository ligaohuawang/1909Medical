package com.qianfeng.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.qianfeng.entity.TUser;
import com.qianfeng.entity.TZxorder;
import com.qianfeng.service.ITZxorderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/zxorder")
public class TZxorderController {

    @Autowired
    private ITZxorderService itZxorderService;

    @RequestMapping("/selectByContent")
    public String selectByContent(Integer currentPage, Integer pageSize, Model model, HttpSession session,Integer zxos){

        //第一次分页，先赋值
        if (currentPage == null && pageSize == null) {
            currentPage = 1;
            pageSize = 4;
        }

        TUser user = (TUser)session.getAttribute("user");
        PageHelper.startPage(currentPage, pageSize);

        Integer uid = user.getUid();
        List<TZxorder> pageOrderList = itZxorderService.selectByContent(uid,zxos);

        PageInfo<TZxorder> page = new PageInfo<TZxorder>(pageOrderList);

        Gson gson = new Gson();
        Map<String,Object> paramMap = new HashMap<String,Object>();
        paramMap.put("zxos",zxos);

        model.addAttribute("params",gson.toJson(paramMap));
        model.addAttribute("page",page);
        model.addAttribute("zxos",zxos);
        model.addAttribute("url","zxorder/selectByContent");

        return "user/zxorder";

    }
}
