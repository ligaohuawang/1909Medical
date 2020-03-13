<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/11/12
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="<%=request.getContextPath()+"/"%>">
    <title>Title</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="Author" content="">
    <meta content="" name="design">
    <title>广州一代医药科技有限公司</title>

    <%--layui--%>
    <%--<link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />--%>
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" type="text/css" media="all" href="../../css/css_whir.css"/>
    <script type="text/javascript" src="../../Scripts/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="../../Scripts/jquery.SuperSlide.2.1.1.js"></script>
    <!--[if lt IE 9]><script type="text/javascript" src="../../scripts/html5shiv.v3.72.min.js"></script><![endif]-->
    <script  type="text/javascript"> var navid="5"</script>

    <%--layui--%> <%--ajax文件上传的js--%>
    <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
    <script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
    <script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="js/H-ui.js"></script>
    <script type="text/javascript" src="js/H-ui.admin.js"></script>
</head>
<body >
<header class="Header">
    <div class="head">
        <a href="首页.html" class="logo"><img src="../../images/logo.jpg"  /></a>
        <div class="head-Right">
            <a href="#" class="add-site">收藏本站</a>
            <div class="language-select">
                <span class="checked-lan"><a >ENGLISH</a><em></em></span>
                <ul class="language-menu">
                    <li><a href="#">ENGLISH</a></li>
                    <li><a href="#">中文版</a></li>
                </ul>
            </div>
            <div class="Searchbox">
                <input name="" type="text" class="search_ipu" id="key" value="输入要搜素的信息" onblur="if(this.value=='')this.value='输入要搜素的信息';" onfocus="if(this.value=='输入要搜素的信息')this.value='';" onkeydown="entersearch()"/>
                <input name="" type="button" class="search_btn" value="" onclick="return GoSearchUrl();" />

                <div class="clear"></div>

            </div>
        </div>
        <div class="clear"></div>
    </div>
    <nav class="Mainnav">
        <ul class="menuone">
            <li><a href="index.jsp" class="ona" id="nav1">首 页<span></span></a></li>
            <li><a href="advice/item" class="ona" id="nav2">会诊医生<span></span></a></li>
            <li><a href="product/queryProductList?currentPage=1&pageSize=6&pptype=1" class="ona" id="nav3">产品目录<span></span></a></li>
            <li><a href="健康知识.html" class="ona" id="nav4">健康知识<span></span></a></li>
            <li><a href="用户反馈.html" class="ona" id="nav5">用户反馈<span></span></a></li>
            <li><a href="关于我们.html" class="ona" id="nav6">关于我们<span></span></a></li>
            <li><a href="#" class="ona" id="nav7">联系我们<span></span></a></li>
            <div class="clear"></div>
        </ul>
    </nav>
</header>
<script type="text/javascript">
    $("#nav"+navid).addClass("active");

    //语言切换
    $(".checked-lan").click(function(){
        $(".language-menu").show();
    })
    $(".language-menu li").each(function(){
        $(this).click(function(){
            $(".checked-lan").find("a").html()=$(this).find("a").html();
            //$(".checked-lan").find("a").attr("href")=$(this).find("a").attr("href");
        })
    })
    $(".language-select").hover(function(){
    },function(){
        $(this).find(".language-menu").hide();
    })



</script>
<script type="text/javascript">
    //this function do not use jquery for honner page?
    function GoSearchUrl() {
        var searchinput = document.getElementById("key");
        if (searchinput.value == ""  || searchinput.value == "输入要搜素的信息") {
            alert("请输入关键字！");
            searchinput.focus();
            return false;
        }
        if (searchinput.value.length > 50) {
            alert("输入的关键字字数不要过多！");
            searchinput.focus();
            return false;
        }
        CheckString(searchinput.value);
    }

    function GoSreach(rs) {
        window.location = "{$syspath}search/search.aspx?key=" + escape(rs);
        return true;
    }

    function entersearch(){
        //alert(dd);
        var event = window.event || arguments.callee.caller.arguments[0];
        if (event.keyCode == 13)
        {
            GoSearchUrl();
        }
    }

    function CheckString(s) {
        // alert(s)
        var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）—|{}【】'；：“”'。，、？]")
        if (pattern.test(s)) {
            alert("不能输入特殊字符！");
            $(".sreach_ipu").focus();
            $(".sreach_ipu").val("");
            return false;
        }
        else {
            GoSreach(s);
        }
    }
</script>

<!--图片切换-->
<aside class="banner ban" style=" background:url(../../uploadfiles/banner_member.jpg) no-repeat top center; height:210px;">
    <div class="banlink">
        <!--<a href="#" class="a1">会员登录</a>
        <a href="#" class="a2">名医推荐</a>
        <a href="#" class="a3">咨询客服</a>-->
    </div>
</aside>
<!--图片切换 End-->
<aside class="Current"><em></em><a href="index.html">首页</a> > <span>会员中心</span></aside>

<section class="MemberMain Main">

    <div class="conbox">
        <div class="siderMem">
            <ul>
                <li class="on"><a href="user/personal" class="a1">个人资料</a></li>
                <li><a href="application/user/change_password.jsp" class="a2">密码修改</a></li>
                <li><a href="productOrder/selectOrderFromProductOrderByUid" class="a3">商品订单</a></li>
                <li><a href="product/queryShopcar?curr=1&num=4" class="a4">我的购物车</a></li>
                <li><a href="zxorder/selectByContent" class="a5">咨询订单</a></li>
                <li><a href="user/dialogue" class="a9">在线留言回复</a></li>
                <li><a href="user/selDiagnosis" class="a6">会诊订单</a></li>
                <li><a href="/user/selCase" class="a8">历史病历</a></li>
            </ul>
        </div>

        <div class="mainCont">
            <!--start-->
            <div class="infor-box">
                <div class="table-box box1">
                    <h3><span>个人资料修改</span></h3>
                    <table>
                        <tr>
                            <td><span>邮箱:</span><input type="text" class="text" value="${user.uemail}" id="yx"/></td>
                        </tr>
                        <tr>
                            <td><span>手机号码:</span><input type="text" class="text" value="${user.uphone}" id="sj"/></td>
                        </tr>

                        <tr>
                            <td><span>昵称:</span><input type="text" class="text" value="${user.nicknane}" id="nc"/></td>
                        </tr>

                        <tr>
                            <td><span>真实姓名:</span><input type="text" class="text" value="${user.uname}" id="zsxm"/></td>
                        </tr>
                        <tr>
                            <td><span>身份证号码:</span><input type="text" class="text" value="${user.ucard}" id="szz"/></td>
                        </tr>
                        <tr>
                            <td><span>所在地:</span><input type="text" class="text" value="${user.ucity}" id="dq"/></td>
                        </tr>
                        <tr>
                            <td><span >性别：</span>
                                    <input type="radio" value="男" name="lgh"  ${user.usex==1?'checked':''}/>男
                                    <input type="radio" value="女" name="lgh"  ${user.usex==0?'checked':''}/>女
                            </td>
                        </tr>




                    </table>
                </div>
                <!--头像-->
                <form action="" method="post" enctype="multipart/form-data">
                <div class="table-box box2">
                    <h3><span>个人资料修改</span></h3>

                    <p class="p1"><a class="img"><img id="echo"
                            <c:choose>
                        <c:when test="${user.upicture !=  ''}">src="${user.upicture}"</c:when>
                        <c:otherwise>src="images\member_pic1.jpg"</c:otherwise>
                            </c:choose> />
                    </a></p>
                    <div class="p2">
                        <!--上传文件start-->
                        <div class="FileBox demo2">
                            <div class="uploadBox">
                                <input name="file" type="file" class="file" id="personalFile" onchange="UploadFile(this);" />
                                <span class="Btn">上传文件</span>
                            </div>
                            <input name="" class="text" type="text" id="FileName" />
                            <div class="clear"></div>
                            <p>限JPG格式</p>
                            <input type="button" class="button" id="determine" value="确定上传" />
                            <div class="clear"></div>
                        </div>
                    </div>

                    <p class="button1"><a></a></p>
                </div>
                </form>
                <!--头像end-->
            </div>
            <!--end-->
            <p class="member-change"><a class="button1" id="lgh">修改</a></p>
        </div>
    </div>
</section>


<footer class="BottomBox">
    <div class="bottom">
        <div class="fbox1">
            <div class="f-address">地址：</div>
            <nav class="f-nav"><a href="#">流量统计</a> | <a href="#">网站地图</a> | <a href="#">法律声明</a> | <a href="#">友情链接</a></nav>
        </div>
        <div class="fbox2">
            <div class="f-copyright">Copyright © 2015 广州一代医药科技有限公司. All Rights Reserved
            </div>
            <div class="f-record">粤ICP备123456789号  Designed by <a href="#">我的虚拟世界店铺</a>.
            </div>
        </div>
    </div>
</footer>

<script type="text/javascript">
    //整站无图处理
    //jQuery.each(jQuery("img"), function (i, n) { jQuery(n).error(function () { n.src = '../../uploadfiles/nopic.jpg'; }); n.src = n.src; });

</script>

<script type="text/javascript">
    $(".p-list li").each(function (i, item) {
        if (Number(i + 1) % 3 == 0) {
            $(this).css("margin-right","0px");
        }
    });
</script>

<script type="text/javascript">


    //图片上传
    $("#determine").click(function () {

        /*获取文件*/
        var file = $("#personalFile").get(0).files[0];
        var formData = new FormData();
        formData.append("file",file);
        $.ajax({
            url:"user/uploadPicture",
            type:'post',
            data:formData,
            cache:false,
            contentType: false,
            processData: false,
            success:function (result) {
                if (result == 1 ){
                    layer.msg('修改头像成功!',{icon:6,time:2000});
                }else {
                    layer.msg('系统异常,请重新操作!',{icon:5,time:2000});
                }
            }
        });
    });

    //图片回显
    $("#personalFile").change(function () {

        /*获取文件*/
        var file = $("#personalFile").get(0).files[0];
        var formData = new FormData();
        formData.append("file",file);
        $.ajax({
            url:"user/backfill",
            type:'post',
            data:formData,
            cache:false,
            contentType: false,
            processData: false,
            success:function (result) {
                $("#echo").attr("src",result);
            }
        });
    });

    //获取file的值显示在右边框
    function UploadFile(n){
        var UpFile = $(n).val();
        //alert(UpFile)
        $(n).parents(".uploadBox").next().val(UpFile);
    }
    
   $("#lgh").click(function () {
       var xb = $('input[name="lgh"]:checked').val();
       var yx =$("#yx").val();
       var sj =$("#sj").val();
       var nc =$("#nc").val();
       var zsxm =$("#zsxm").val();
       var szz =$("#szz").val();
       var dq =$("#dq").val();

       if(xb=="男"){

           zsxb=1;
       }else{

        zsxb=0;
       }

       var uid=${user.uid};
       var data ={
           "xb" : zsxb,
           "yx": yx,
           "sj" : sj,
           "nc" : nc,
           "zsxm" :zsxm,
           "szz" : szz,
           "dq" : dq,
           "uid":uid,
       };

       $.ajax({
           url:"user/updateUserById",
           data:data,
           type:"post",
           success:function (json) {
               if (json.state == "SUCCESS") {
                   layer.msg(json.msg, {icon: 1, time: 1000,});
               }else {
                   layer.msg(json.msg, {icon: 1, time: 1000,});
               }
           }
       })


   })


</script>
</body>
</html>
