package com.qianfeng.service;

import com.qianfeng.entity.SysResult;
import com.qianfeng.entity.TQuestion;
import com.qianfeng.entity.TUser;
import com.qianfeng.pojo.CasePojo;
import com.qianfeng.pojo.DiagnosisPojo;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface IUserService extends IBaseService<TUser>{

    /**
     * 测试环境用
     * @return
     */
    List<TUser> selectAll();

    /**
     * 测试用的登录
     * @param tUser
     * @return
     */
    TUser selectUserByUserNameAndPassword(TUser tUser);

    SysResult loging2(TUser user, HttpSession session);

    /**
     * 根据用户id上传用户照片
     * @param uid
     * @param sjkUrl
     * @return
     */
    int changePicture(Integer uid, String sjkUrl);

    /**
     * 修改用户信息
     * @param usex
     * @param uemail
     * @param uphone
     * @param nicknane
     * @param uname
     * @param ucard
     * @param ucity
     * @param uid
     * @return
     */
    Integer updateUserById(Integer usex, String uemail, String uphone, String nicknane, String uname, String ucard, String ucity, Integer uid);

    SysResult loging3(TUser user, HttpSession session, String code);

    SysResult unameCheck(String uname);

    SysResult regist(TUser user,String birthday, String emailCode, HttpSession session);


    SysResult forget(TUser user, String emailCode, HttpSession session);

    //插入用户提问
    void insquestions(TQuestion tQuestion);

    //查看历史提问
    List<TQuestion> selReply(Integer uid);

    SysResult queryPassword(String upassword, Integer uid);

    SysResult changePassword(String upassword, Integer uid);

    //查询会诊订单
    List<DiagnosisPojo> selDiagnosis(Integer uid);

    //查询历史病例
    List<CasePojo> selCase(Integer uid);
}
