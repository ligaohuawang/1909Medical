<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="zh-cn">
<head>
    <base href="<%=request.getContextPath()+"/"%>">
    <%--layui--%>
   <%-- <link href="css/H-ui.min.css" rel="stylesheet" type="text/css"/>--%>
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css"/>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css"/>

    <%--layui--%>
    <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
    <script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
    <script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="js/H-ui.js"></script>
    <script type="text/javascript" src="js/H-ui.admin.js"></script>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="Author" content="">
    <meta content="" name="design">
    <title>广州一代医药科技有限公司</title>
    <link rel="stylesheet" type="text/css" media="all" href="css/css_whir.css"/>
    <script type="text/javascript" src="Scripts/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.SuperSlide.2.1.1.js"></script>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="scripts/html5shiv.v3.72.min.js"></script><![endif]-->
    <script type="text/javascript"> var navid = "2"</script>
</head>

<body>
<header class="Header">
    <div class="head">
        <a href="首页.html" class="logo"><img src="images/logo.jpg"/></a>
        <div class="head-Right">
            <a href="#" class="add-site">收藏本站</a>
            <div class="language-select">
                <span class="checked-lan"><a>ENGLISH</a><em></em></span>
                <ul class="language-menu">
                    <li><a href="#">ENGLISH</a></li>
                    <li><a href="#">中文版</a></li>
                </ul>
            </div>
            <div class="Searchbox">
                <input name="" type="text" class="search_ipu" id="key" value="输入要搜素的信息"
                       onblur="if(this.value=='')this.value='输入要搜素的信息';"
                       onfocus="if(this.value=='输入要搜素的信息')this.value='';" onkeydown="entersearch()"/>
                <input name="" type="button" class="search_btn" value="" onclick="return GoSearchUrl();"/>

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
    $("#nav" + navid).addClass("active");

    //语言切换
    $(".checked-lan").click(function () {
        $(".language-menu").show();
    })
    $(".language-menu li").each(function () {
        $(this).click(function () {
            $(".checked-lan").find("a").html() = $(this).find("a").html();
            //$(".checked-lan").find("a").attr("href")=$(this).find("a").attr("href");
        })
    })
    $(".language-select").hover(function () {
    }, function () {
        $(this).find(".language-menu").hide();
    })


</script>
<script type="text/javascript">
    //this function do not use jquery for honner page?
    function GoSearchUrl() {
        var searchinput = document.getElementById("key");
        if (searchinput.value == "" || searchinput.value == "输入要搜素的信息") {
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

    function entersearch() {
        //alert(dd);
        var event = window.event || arguments.callee.caller.arguments[0];
        if (event.keyCode == 13) {
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
<aside class="banner ban" style=" background:url(uploadfiles/banner_dl.jpg) no-repeat top center; height:210px;">
</aside>
<!--图片切换 End-->


<section class="DoctorMain Main">
    <div class="dl-title"><a href="index.html">忘记密码</a></div>
    <div class="mima-bg">
        <table class="">
            <tr>
                <td><span>用户名:</span><input type="text" class="text" name="nicknane"/></td>
            </tr>
            <tr>
                <td><span>邮箱:</span><input type="text" class="text" name="uemail"/></td>
            </tr>
            <tr>
                <td><span>新密码:</span><input type="text" class="text" name="upassword"/></td>
            </tr>
            <tr>
                <td><span>确认密码:</span><input type="text" class="text" name="upassword2"/></td>
            </tr>
            <tr>
                <td><span>验证码:</span><input type="text" class="text text2" name="emailCode"/><a id="button1"
                                                                                                href="javascript:void(0)">获得验证码</a>
                </td>
            </tr>

            <tr>
                <td><input type="button" class="button1" value="确定"/></td>
            </tr>
        </table>
    </div>
</section>


<footer class="BottomBox">
    <div class="bottom">
        <div class="fbox1">
            <div class="f-address">地址：</div>
            <nav class="f-nav"><a href="#">流量统计</a> | <a href="#">网站地图</a> | <a href="#">法律声明</a> | <a href="#">友情链接</a>
            </nav>
        </div>
        <div class="fbox2">
            <div class="f-copyright">Copyright © 2015 广州一代医药科技有限公司. All Rights Reserved
            </div>
            <div class="f-record">粤ICP备123456789号 Designed by <a href="#">我的虚拟世界店铺</a>.
            </div>
        </div>
    </div>
</footer>

<script type="text/javascript">
    //整站无图处理
    jQuery.each(jQuery("img"), function (i, n) {
        jQuery(n).error(function () {
            n.src = 'uploadfiles/nopic.jpg';
        });
        n.src = n.src;
    });


    $("#button1").click(function () {
        var uemail = $("input[name='uemail']").val();
        if (uemail == "") {
            layer.msg("请先输入邮箱", {icon: 5, time: 1000});
            return
        }
        $.ajax({
            url: "check/emailCode",
            type: "GET",
            data: "uemail=" + uemail,
            success: function (data) {
                if (data.result) {
                    layer.msg("获得验证码成功", {icon: 6, time: 1000});
                } else {
                    layer.msg("获得验证码失败", {icon: 5, time: 1000});
                }
            }
        })
    })

    $(".button1").click(function () {

        var nicknane = $("input[name='nicknane']").val();
        var emailCode = $("input[name='emailCode']").val();
        var uemail = $("input[name='uemail']").val();
        var upassword = $("input[name='upassword']").val();
        if (nicknane == "" || emailCode == "" || uemail == "" || upassword =="") {
            layer.msg("信息不全", {icon: 5, time: 1000});
            return
        }
        $.ajax({
            url:"user/forget",
            type:"GET",
            data:"nicknane="+nicknane+"&upassword="+upassword+"&emailCode="+emailCode+"&uemail="+uemail,
            success:function(data){
                if(data.result){
                    layer.msg('修改密码成功!',{icon:6,time:1000},function () {
                        window.location="index.jsp";
                    });
                }else{
                    layer.msg(data.data,{icon:5,time:1000});
                }
            }

        })


    })

    $("input[name=upassword2]").blur(function () {
        var upassword2 = $("input[name='upassword2']").val();
        var upassword = $("input[name='upassword']").val();

        if ('' == upassword2) {
            layer.msg("请确认密码", {icon: 5, time: 1000});
            return
        }
        if (upassword2 != upassword) {
            layer.msg("密码不一致", {icon: 5, time: 1000});
            return
        }
    })

    $("input[name=upassword]").blur(function () {
        var upassword = $("input[name='upassword']").val();
        if ('' == upassword) {
            layer.msg("请输入密码", {icon: 5, time: 1000});
            return
        }

    })


</script>

</body>
</html>