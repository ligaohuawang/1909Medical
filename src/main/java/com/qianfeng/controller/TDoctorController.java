package com.qianfeng.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.qianfeng.entity.SysResult;
import com.qianfeng.entity.TDoctor;
import com.qianfeng.service.IDoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/doctor")
public class TDoctorController {

    @Autowired
    IDoctorService doctorService;

    /**
     * 医生登录
     * @param doctor
     * @param verification
     * @return
     */
    @RequestMapping("/login")
    public String login(TDoctor doctor,String verification){
      //  TDoctor tDoctor = doctorService.login(doctor,verification);

        return "";
    }

    /**医生登录二
     *
     * @param dname
     * @param dpassword
     * @param session
     * @param map
     * @return
     */
    @RequestMapping("login2")
@ResponseBody
    public SysResult login2(@RequestParam("dname") String dname, @RequestParam("dpassword") String dpassword, HttpSession session, ModelMap map){
        TDoctor doctor = new TDoctor();
            doctor.setDname(dname);
            doctor.setDpassword(dpassword);
       // System.out.println(dname+dpassword);
      //  System.out.println(doctor);
        TDoctor tDoctor = doctorService.login2(doctor);
        //System.out.println(tDoctor);
        SysResult sysResult = new SysResult();
        if(null != tDoctor){
            session.setAttribute("doctor",tDoctor);
            sysResult.setResult(true);
            return sysResult;
        }else {
            sysResult.setResult(false);
            return sysResult;

        }

    }

    /**
     * 查找推荐医生
     * @param doctor
     * @param map
     * @param currentPage
     * @param pageSize
     * @return
     */
    @RequestMapping("queryDoctorList")
    public String queryDoctorList(TDoctor doctor,ModelMap map,int currentPage, int pageSize){
        System.out.println(doctor);
        if(currentPage == 0 || pageSize == 0){
            currentPage = 1;
            pageSize = 4;
        }
        PageHelper.startPage(currentPage,pageSize);
 List<TDoctor> list = doctorService.queryDoctorList(doctor);
        PageInfo<TDoctor> page =new PageInfo<>(list);
        System.out.println(page);
        map.put("page",page);
        map.put("dspeciality",doctor.getDspeciality());
        map.put("url","doctor/queryDoctorList");
        Gson gson = new Gson();
        Map<String,Object> paramMap = new HashMap<String,Object>();
        paramMap.put("dspeciality",doctor.getDspeciality());
        map.put("params",gson.toJson(paramMap));//把条件转换成json数据，页面进行获取
        return "doctor/doctor_recommendation";

    }

    /**
     * 查询医生详情
     * @param did
     * @param map
     * @return
     */
    @RequestMapping("querydetail")
    public  String querydetail(int did , ModelMap map ){
        TDoctor doctor = doctorService.querydetail(did);
        map.put("doctor",doctor);
        return "doctor/doctor_details";
    }
}
