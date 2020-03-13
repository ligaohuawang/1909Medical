<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/11/16
  Time: 9:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <base href="<%=request.getContextPath()+"/"%>">
    <title>Title</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="Author" content="">
    <meta content="" name="design">
    <title>广州一代医药科技有限公司</title>
    <link rel="stylesheet" type="text/css" media="all" href="css/css_whir.css"/>
    <script type="text/javascript" src="Scripts/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.SuperSlide.2.1.1.js"></script>
    <!--[if lt IE 9]><script type="text/javascript" src="scripts/html5shiv.v3.72.min.js"></script><![endif]-->
    <script  type="text/javascript"> var navid="5"</script>
</head>
<body id="zxorderBody">
<header class="Header">
    <div class="head">
        <a href="首页.html" class="logo"><img src="images/logo.jpg"  /></a>
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
<aside class="banner ban" style=" background:url(uploadfiles/banner_member.jpg) no-repeat top center; height:210px;">
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
                <li class="on"><a href="#" class="a1">个人资料</a></li>

                <li><a href="application/user/change_password.jsp" class="a2">密码修改</a></li>

                <li><a href="productOrder/selectOrderFromProductOrderByUid" class="a3">商品订单</a></li>

                <li><a href="zxorder/selectByContent" class="a5">咨询订单</a></li>

                <li><a href="#" class="a6">会诊订单</a></li>
                <li><a href="#" class="a7">门诊订单</a></li>
                <li><a href="#" class="a8">历史病历</a></li>
                <li><a href="user/dialogue" class="a9">在线留言回复</a></li>
            </ul>
        </div>

        <!--右边内容-->
        <div class="mainCont">

            <div class="bookBox Dt">
                <!--start-->
                <div class=" templet_jobs_004 ">
                    <nav class="Category2">
                        <ul>


                        </ul>
                    </nav>

                    <input type="hidden" value="${zxos}" id="ord">
                    <div class="bookcontent">
                        <!--全部-->
                        <ul style="display: block;">
                            <p class="status">

                                <span class="s1">订单详情id</span>
                                <span class="s3">购买的数量</span>
                                <span class="s4">小计</span>
                                <span class="s5">商品名称</span>
                                <span class="s6">商品图片</span>
                                <span class="s7">操作</span>

                            </p>
                            <div class="clear"></div>
                            <!--从这里循环-->
                            <c:forEach items="${page.list}" var="orderDetail">
                           <%-- <li>
                                <div class="carbox">
                                    <div class="sp6">
                                        <div class="sp3"><span></span></div>
                                        <div class="sp2"><span>${orderDetail.pname}</span></div>
                                    <div class="sp3"><span>￥${orderDetail.orderPrice}</span></div>
                                    <div class="sp2"><span>${orderDetail.number}</span></div>
                                    <div class="sp0"><span>${orderDetail.odid}</span></div>
                                        <div class="sp0"><span><a href="#">取消</a></span></div>
                                </div>
                            </li>--%>

                                <li>
                                    <div class="carbox">
                                        <div class="sp6"><span><a href="javascript:history.back()">返回</a></span> </div><%--直接拿到金额？--%>
                                        <div class="sp5"><img src="${orderDetail.ppicture}" width="101" height="55"></div>
                                        <div class="sp4"><span>${orderDetail.pname}</span></div>
                                        <div class="sp3"><span>￥${orderDetail.orderPrice}</span></div>
                                        <div class="sp2"><span>${orderDetail.number}</span></div>
                                        <div class="sp0"><span>${orderDetail.odid}</span></div>
                                    </div>
                                </li>
                            </c:forEach>
                            <!--从这里循环end-->

                        </ul>
                        <!--全部 end-->

                        <%--引入分页的导航条--%>
                        <jsp:include page="/application/commons/page.jsp">
                            <jsp:param name="bodyId" value="zxorderBody"></jsp:param>
                        </jsp:include>
                    </div>
                </div>
                <!--end-->
            </div>

        </div>
        <!--右边内容 end-->
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
    jQuery.each(jQuery("img"), function (i, n) { jQuery(n).error(function () { n.src = 'uploadfiles/nopic.jpg'; }); n.src = n.src; });

</script>

<script type="text/javascript">
    $(".bookcontent ul").hide();
    $(".bookcontent ul:first").show();
    $(".templet_jobs_004 ul li").click(function(){

        $(".templet_jobs_004 ul li").removeClass("on");
        $(this).addClass("on");
        $(".bookcontent ul").hide();
        var a=$(this).index();
        $(".bookcontent ul").eq(a).show();
    })


    //样式
    $(function () {
        var ord = $("#ord").val();
        if (ord == 1){
            $(".lion").removeClass("on");
            var lions = $(".lion");
            for (i=0;i<lions.length;i++){
                if (lions[i].value == 1){
                    lions[i].setAttribute("class","on");

                }
            }
        }else if(ord == 2){
            $(".lion").removeClass("on");
            var lions = $(".lion");
            for (i=0;i<lions.length;i++){
                if (lions[i].value == 2){
                    lions[i].setAttribute("class","on");

                }
            }
        }else if (ord == "") {
            $(".lion").removeClass("on");
            var lions = $(".lion");
            for (i = 0; i < lions.length; i++) {
                if (lions[i].value == "") {
                    lions[i].setAttribute("class", "on");

                }
            }
        }

    });

    //条件查询
    $(".lion").click(function () {

        var zxos = $(this).val();

        $("#zxorderBody").load("${url}",{"zxos":zxos});
    });
</script>

</body>
</html>
