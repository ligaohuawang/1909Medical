package com.qianfeng.controller;

import cn.dsna.util.images.ValidateCode;
import com.qianfeng.entity.SysResult;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/check")
public class CheckCode {
    /**
     * 验证码获取
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/code")
    public void check(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ValidateCode code = new ValidateCode(120, 40, 4, 10);
        System.out.println(code);
        String strCode = code.getCode();
        System.out.println(strCode);
        request.getSession().setAttribute("chCode", strCode);
        code.write(response.getOutputStream());
    }

    /**
     * 邮箱验证码获取
     * @param session
     * @param uemail
     * @return
     */
    @RequestMapping("/emailCode")
    @ResponseBody
    public SysResult emailCheck(HttpSession session, String uemail) {
        System.out.println(uemail);
        StringBuilder sb = new StringBuilder();
        for (int i = 0 ; i < 4;i++){
sb.append((int)(Math.random()*9)+1);
        }
        String emailCode = sb.toString();
        session.setAttribute("emailCode",emailCode);
        System.out.println(emailCode);
        SysResult sysResult = new SysResult();
        try {
            HtmlEmail email = new HtmlEmail();//创建一个HtmlEmail实例对象
            email.setHostName("smtp.163.com");//邮箱的SMTP服务器，一般123邮箱的是smtp.123.com,qq邮箱为smtp.qq.com
            email.setCharset("utf-8");//设置发送的字符类型
            email.addTo(uemail);//设置收件人
            email.setFrom("abccba980908782@163.com", "aa");//发送人的邮箱为自己的，用户名可以随便填
            email.setAuthentication("abccba980908782@163.com", "123456789cba");//设置发送人到的邮箱和用户名和授权码(授权码是自己设置的)
            email.setSubject("测试");//设置发送主题
            email.setMsg(emailCode);//设置发送内容
            email.send();//进行发送

        } catch (Exception e) {
        }
        sysResult.setResult(true);
        return sysResult;
    }
}
