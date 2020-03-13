package com.qianfeng.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qianfeng.entity.*;
import com.qianfeng.pojo.CasePojo;
import com.qianfeng.pojo.DiagnosisPojo;
import com.qianfeng.service.IUserService;
import com.qianfeng.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/user")
public class TUserController {

    @Autowired
    private IUserService userService;

    /**
     * 测试环境用
     *
     * @return
     */
    @RequestMapping("/selectAll")
    public String selectAll() {
        List<TUser> userList = userService.selectAll();
        System.out.println(userList.get(0));
        return "success";
    }

    /**
     * 登陆查询
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("personal")
    public String userPersonal(HttpSession session, Model model){

        TUser user = (TUser) session.getAttribute("user");

        TUser userMany = userService.selectUserByUserNameAndPassword(user);

        model.addAttribute("user",userMany);
        return "user/personal_information";
    }

    /**
     * 添加用户图片
     * @return
     * @throws FileNotFoundException
     * @throws IOException
     */
    @RequestMapping("/uploadPicture")
    public void upload(MultipartFile file,HttpSession session,HttpServletResponse response) throws IOException {

        //创建一个相对路径，存储到数据库
        String path = "images"+File.separator+file.getOriginalFilename();
        TUser user = (TUser) session.getAttribute("user");
        Integer uid = user.getUid();
        int tips = userService.changePicture(uid,path);
        if (tips >0){
            response.getWriter().println("1");
        }else {
            response.getWriter().println("0");
        }
    }

    //图片回显
    @RequestMapping("backfill")
    public void imgBackfill(MultipartFile file, HttpServletRequest request,HttpServletResponse response) throws IOException {

        //得到 updload文件夹的路径
        String realPath = request.getServletContext().getRealPath("images");
        //构建一个上传地址
        String target = realPath+File.separator+file.getOriginalFilename();

        //io流的拷贝
        FileCopyUtils.copy(file.getInputStream(),new FileOutputStream(target));

        String path = "images"+File.separator+file.getOriginalFilename();

        //返回字符串路径给ajax
        response.getWriter().println(path);
    }

    /**
     * 首页登录
     */
    @RequestMapping("login2")
    @ResponseBody
    public SysResult loging2(TUser user, HttpSession session) {
        SysResult sysResult = userService.loging2(user, session);
        return sysResult;
    }

    /**
     * 页面登录
     * @param user
     * @param code
     * @param session
     * @return
     */
    @RequestMapping("login3")
    @ResponseBody
    public SysResult loging3(TUser user, String code, HttpSession session) {
        SysResult sysResult = userService.loging3(user, session, code);
        return sysResult;
    }

    /**
     * 重名检查
     * @param uname
     * @return
     */
    @RequestMapping("unameCheck")
    @ResponseBody
    public SysResult unameCheck(String uname) {
        SysResult sysResult = userService.unameCheck(uname);
        return sysResult;
    }

    /**
     * 用户注册
     * @param user
     * @param birthday
     * @param emailCode
     * @param session
     * @return
     */
    @RequestMapping("regist")
    @ResponseBody
    public SysResult regist(TUser user, String birthday, String emailCode, HttpSession session) {
        System.out.println(user);
        SysResult sysResult = userService.regist(user, birthday, emailCode, session);
        return sysResult;
    }

    /**
     * 忘记密码
     * @param user
     * @param emailCode
     * @param session
     * @return
     */
    @RequestMapping("forget")
    @ResponseBody
    public SysResult forget(TUser user, String emailCode, HttpSession session) {
        System.out.println("controller:" + user);
        SysResult sysResult = userService.forget(user, emailCode, session);
        return sysResult;
    }


    /**
     * 修改用户信息
     *
     * @param
     */
    @RequestMapping(value = "/updateUserById")
    @ResponseBody
    public ResultEntity updateUserById(@RequestParam("xb") Integer usex, @RequestParam("yx") String uemail, @RequestParam("sj") String uphone, @RequestParam("nc") String nicknane, @RequestParam("zsxm") String uname, @RequestParam("szz") String ucard, @RequestParam("dq") String ucity, @RequestParam("uid") Integer uid) {
        Integer result = userService.updateUserById(usex, uemail, uphone, nicknane, uname, ucard, ucity, uid);
        if (result > 0) {
            return ResultEntity.success_msg("修改成功");
        }
        return ResultEntity.failed_msg("修改失败");
    }

    /**
     * 检查登录
     */
    @RequestMapping("dectionLogin")
    @ResponseBody
    public SysResult dectionLogin(HttpSession session) {

        TUser user = (TUser) session.getAttribute("user");
        System.out.println(user);
        SysResult sysResult = new SysResult();
        if (null != user) {
            sysResult.setResult(true);

        } else {

sysResult.setResult(false);
sysResult.setData("请先登录");
        }
        return  sysResult;
    }

    //用户在线提问
    @RequestMapping("dialogue")
    public String userDialogue(HttpSession session,Model model){

        TUser user = (TUser) session.getAttribute("user");
        if (user == null){
            return "user/user_login";
        }

        TUser userdialogue = userService.selectUserByUserNameAndPassword(user);

        model.addAttribute("user",userdialogue);

        return "user/user_dialogue";
    }

    //插入用户提问表
    @RequestMapping("questions")
    public String insquestions(TQuestion tQuestion,Model model){

        userService.insquestions(tQuestion);

        model.addAttribute("msg","1");
        return "user/user_dialogue";
    }

    //查看历史提问
    @RequestMapping("reply")
    public String selReply(Integer currentPage, Integer pageSize,HttpSession session,Model model){

        //第一次分页，先赋值
        if (currentPage == null && pageSize == null) {
            currentPage = 1;
            pageSize = 4;
        }

        PageHelper.startPage(currentPage, pageSize);
        TUser user = (TUser) session.getAttribute("user");

        List<TQuestion> tqList = userService.selReply(user.getUid());

        PageInfo<TQuestion> page = new PageInfo<>(tqList);

        model.addAttribute("url","user/reply");
        model.addAttribute("page",page);
        return "user/user_history";
    }
    /**
     * 查找密码
     */
    @RequestMapping("queryPassword")
    @ResponseBody
    public SysResult queryPassword(String upassword,HttpSession session){
        TUser user = (TUser) session.getAttribute("user");
return userService.queryPassword(upassword,user.getUid());
    }
    /**
     * 修改密码
     */
    @RequestMapping("changePassword")
    @ResponseBody
    public SysResult changePassword(String upassword,HttpSession session){
        TUser user = (TUser) session.getAttribute("user");
return userService.changePassword(upassword,user.getUid());
    }

    //查询会诊订单
    @RequestMapping("selDiagnosis")
    public String selDiagnosis(Integer currentPage, Integer pageSize,Model model,HttpSession session){

        //第一次分页，先赋值
        if (currentPage == null && pageSize == null) {
            currentPage = 1;
            pageSize = 2;
        }

        TUser user = (TUser) session.getAttribute("user");
        Integer uid = user.getUid();

        PageHelper.startPage(currentPage,pageSize);
        List<DiagnosisPojo> diList = userService.selDiagnosis(uid);
        PageInfo<DiagnosisPojo> page = new PageInfo<>(diList);


        model.addAttribute("page",page);
        model.addAttribute("url","user/selDiagnosis");

        return "user/diagnosis";
    }

    /**
     * 查询历史病例
     * @return
     */
    @RequestMapping("selCase")
    public String selCase(Integer currentPage, Integer pageSize,Model model,HttpSession session){

        //第一次分页，先赋值
        if (currentPage == null && pageSize == null) {
            currentPage = 1;
            pageSize = 1;
        }

        TUser user = (TUser) session.getAttribute("user");
        Integer uid = user.getUid();

        PageHelper.startPage(currentPage,pageSize);
        List<CasePojo> caList = userService.selCase(uid);



        PageInfo<CasePojo> page = new PageInfo<>(caList);

        model.addAttribute("page",page);
        model.addAttribute("url","user/selCase");

        return "user/user_case";
    }
}



