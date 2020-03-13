package com.qianfeng.mapper;

import com.github.pagehelper.Page;
import com.qianfeng.dao.IBaseDao;
import com.qianfeng.entity.*;
import com.qianfeng.pojo.CasePojo;
import com.qianfeng.pojo.DiagnosisPojo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TUserMapper extends IBaseDao<TUser>{
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

    /*根据用户id上传用户照片*/
    int changePicture(@Param("uid") Integer uid, @Param("sjkUrl") String sjkUrl);

    TUser login2(TUser user);

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
    Integer updateUserById(@Param("usex")Integer usex, @Param("uemail")String uemail, @Param("uphone")String uphone, @Param("nicknane")String nicknane, @Param("uname")String uname, @Param("ucard")String ucard, @Param("ucity")String ucity, @Param("uid")Integer uid);

    TUser unameCheck(@Param("uname") String uname);

    int regist(TUser user);


    TUser forget(TUser user);

    void updateUserPassword(TUser user1);

    //插入用户提问
    void insquestions(TQuestion tQuestion);

    //查看历史提问
    List<TQuestion> selReply(Integer uid);

    String queryPassword( @Param("uid") Integer uid);

     int changePassword(@Param("upassword") String upassword, @Param("uid") Integer uid);

     //查询会诊订单
    List<DiagnosisPojo> selDiagnosis(Integer uid);

    //查询历史病例
    List<CasePojo> selCase(Integer uid);

    //查询所有咨询用户的历史病例
    List<TMedicalHistory> selTMedicalHistory(String zxname);
}