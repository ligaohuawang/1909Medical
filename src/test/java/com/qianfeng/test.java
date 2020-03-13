package com.qianfeng;

import org.apache.commons.mail.HtmlEmail;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext-*.xml")
public class test {
    @Test
    public void test(){
        try {
            HtmlEmail email=new HtmlEmail();//创建一个HtmlEmail实例对象
            email.setHostName("smtp.163.com");//邮箱的SMTP服务器，一般123邮箱的是smtp.123.com,qq邮箱为smtp.qq.com
            email.setCharset("utf-8");//设置发送的字符类型
            email.addTo("980908782@qq.com");//设置收件人
            email.setFrom("abccba980908782@163.com","aa");//发送人的邮箱为自己的，用户名可以随便填
            email.setAuthentication("abccba980908782@163.com","123456789cba");//设置发送人到的邮箱和用户名和授权码(授权码是自己设置的)
            email.setSubject("测试");//设置发送主题
            email.setMsg("官网10086");//设置发送内容
            email.send();//进行发送



        }catch (Exception e){}
    }
}
