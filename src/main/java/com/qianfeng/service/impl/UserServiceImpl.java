package com.qianfeng.service.impl;

import com.qianfeng.dao.IBaseDao;
import com.qianfeng.entity.SysResult;
import com.qianfeng.entity.TMedicalHistory;
import com.qianfeng.entity.TQuestion;
import com.qianfeng.entity.TUser;
import com.qianfeng.mapper.TUserMapper;
import com.qianfeng.pojo.CasePojo;
import com.qianfeng.pojo.DiagnosisPojo;
import com.qianfeng.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl extends BaseServiceImpl<TUser> implements IUserService{
    @Autowired
    private TUserMapper tUserMapper;
    @Override
    public IBaseDao<TUser> getDao() {
        return tUserMapper;
    }

    @Override
    public List<TUser> selectAll() {
        return tUserMapper.selectAll();
    }

    @Override
    public TUser selectUserByUserNameAndPassword(TUser tUser) {
        return tUserMapper.selectUserByUserNameAndPassword(tUser);
    }

    //图片上传
    @Override
    public int changePicture(Integer uid, String sjkUrl) {
        return tUserMapper.changePicture(uid,sjkUrl);
    }

    @Override
    public Integer updateUserById(Integer usex, String uemail, String uphone, String nicknane, String uname, String ucard, String ucity, Integer uid) {
        return tUserMapper.updateUserById(usex,uemail,uphone,nicknane,uname,ucard,ucity,uid);
    }

    @Override
    public SysResult loging3(TUser user, HttpSession session, String code) {
        TUser user1 = tUserMapper.login2(user);
        String chCode = (String) session.getAttribute("chCode");
        SysResult sysResult = new SysResult();
      //  System.out.println("code:"+code +"---"+"chCode:"+chCode);
      //  System.out.println(user);
       // System.out.println(user1);
code = code.toLowerCase();
chCode = chCode.toLowerCase();
        if (!(code.equals(chCode))){
            //System.out.println("code:"+code +"---"+"chCode:"+chCode);
            sysResult.setResult(false);
            sysResult.setData("验证码错误");
        }else{
            if(null != user1){
                session.setAttribute("user",user1);
                sysResult.setResult(true);
            }else{
                sysResult.setResult(false);
                sysResult.setData("用户名与密码不匹配");
            }
        }
        return sysResult;
    }

    @Override
    public SysResult unameCheck(String uname) {
        TUser user1 = tUserMapper.unameCheck(uname);
        SysResult sysResult = new SysResult();
        if(user1 != null){
            sysResult.setResult(true);
        }
        return sysResult;
    }

    @Override
    public SysResult regist(TUser user,String birthday, String emailCode, HttpSession session) {

        DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
             date = format1.parse(birthday);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        user.setUbirthday(date);
        System.out.println(user);
        int a =0;
        a = tUserMapper.regist(user);
        String chCode = (String) session.getAttribute("emailCode");
        SysResult sysResult = new SysResult();
emailCode = emailCode.toLowerCase();
chCode = chCode.toLowerCase();
        if (!(emailCode.equals(chCode))){
            //System.out.println("code:"+code +"---"+"chCode:"+chCode);
            sysResult.setResult(false);
            sysResult.setData("验证码错误");
        }else{
            if(a != 0){
                sysResult.setResult(true);
            }else{
                sysResult.setResult(false);
                sysResult.setData("用户名注册失败");
            }
        }
        return sysResult;

    }

    @Override
    public SysResult forget(TUser user, String emailCode, HttpSession session) {
        TUser user1 = tUserMapper.forget(user);
      //  System.out.println("service:"+user1);
        String chCode = (String) session.getAttribute("emailCode");
        SysResult sysResult = new SysResult();
        emailCode = emailCode.toLowerCase();
        chCode = chCode.toLowerCase();
        if(!chCode.equals(emailCode)){
            sysResult.setResult(false);
            sysResult.setData("验证码错误");
            return sysResult;
        }
        if (user1 != null){
            user1.setUpassword(user.getUpassword());
            tUserMapper.updateUserPassword(user1);
            sysResult.setResult(true);
            return sysResult;
        }else {
            sysResult.setResult(false);
            sysResult.setData("找不到该用户");
            return sysResult;
        }
    }

    //插入用户提问
    @Override
    public void insquestions(TQuestion tQuestion) {
        tUserMapper.insquestions(tQuestion);
    }

    //查看历史提问
    @Override
    public List<TQuestion> selReply(Integer uid) {
        return tUserMapper.selReply(uid);
    }

    @Override
    public SysResult queryPassword(String upassword, Integer uid) {
        String password = tUserMapper.queryPassword(uid);
        SysResult sysResult = new SysResult();
        if(password.equals(upassword)){
sysResult.setResult(true);
        }else {
            sysResult.setResult(false);
        }
return sysResult;
    }

    @Override
    public SysResult changePassword(String upassword, Integer uid) {
        int a = tUserMapper.changePassword(upassword,uid);
        SysResult sysResult = new SysResult();
        if(a > 0){
            sysResult.setResult(true);
        }else {
            sysResult.setResult(false);
        }
        return sysResult;
    }

    //查询会诊订单
    @Override
    public List<DiagnosisPojo> selDiagnosis(Integer uid) {
        return tUserMapper.selDiagnosis(uid);
    }

    //查询历史病例
    @Override
    public List<CasePojo> selCase(Integer uid) {

        List<CasePojo> caList =tUserMapper.selCase(uid);

        //查询所有咨询用户的历史病例
        for (int i=0;i<caList.size();i++){
            caList.get(i).setTmList(tUserMapper.selTMedicalHistory(caList.get(i).getZxname()));
        }

        return caList;
    }


    @Override
    public SysResult loging2(TUser user, HttpSession session) {
        TUser user1 = tUserMapper.login2(user);
        //System.out.println(user1);
        SysResult sysResult = new SysResult();
        if (user1 != null){
            session.setAttribute("user",user1);
            sysResult.setResult(true);
        }else{
            sysResult.setResult(false);
        }
        return sysResult;
    }
}
