<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/11/15
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <base href="<%=request.getContextPath()+"/"%>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="Author" content="">
    <meta content="" name="design">

    <%--layui--%>
   <%-- <link href="css/H-ui.min.css" rel="stylesheet" type="text/css"/>--%>
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css"/>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css"/>

    <title>广州一代医药科技有限公司</title>
    <link rel="stylesheet" type="text/css" media="all" href="css/css_whir.css"/>
    <script type="text/javascript" src="Scripts/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.SuperSlide.2.1.1.js"></script>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="scripts/html5shiv.v3.72.min.js"></script><![endif]-->
    <script type="text/javascript"> var navid = "5"</script>

    <%--layui--%>
    <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
    <script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
    <script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="js/H-ui.js"></script>
    <script type="text/javascript" src="js/H-ui.admin.js"></script>
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
                <li><a href="user/personal" class="a1">个人资料</a></li>
                <li><a href="application/user/change_password.jsp" class="a2">密码修改</a></li>
                <li><a href="productOrder/selectOrderFromProductOrderByUid" class="a3">商品订单</a></li>
                <li class="on"><a href="product/queryShopcar?curr=1&num=4" class="a4">我的购物车</a></li>
                <li><a href="zxorder/selectByContent" class="a5">咨询订单</a></li>
                <li><a href="user/dialogue" class="a9">在线留言回复</a></li>
                <li><a href="user/selDiagnosis" class="a6">会诊订单</a></li>
                <li><a href="/user/selCase" class="a8">历史病历</a></li>
            </ul>
        </div>

        <!--右边内容-->
        <div class="mainCont">

            <div class="bookBox Dt">
                <!--start-->
                <div class=" templet_jobs_006 ">
                    <ul>
                        <p class="status">
                            <span class="s1"><input type="checkbox" class="checkallbox"/>全部</span>
                            <span class="s2">订单商品</span>

                            <span class="s4">商品价格</span>
                            <span class="s5">数量</span>
                            <span class="s6">小计</span>
                            <span class="s7">操作</span>
                        </p>
                        <div class="clear"></div>
                        <!--从这里循环-->

                        <c:forEach items="${shopcarList}" var="shopcar">
                        <li id="${shopcar.pid}" value="${shopcar.price * shopcar.number}">
                            <div class="carbox">
                                <div class="sp6">
                                    <a href="#" style=" cursor:pointer;">删除</a>
                                </div>
                                <div class="sp5"><span>${shopcar.price * shopcar.number}</span></div>
                                <div class="sp4">
                                    <%--TODO 加减商品--%>
                                    <a class="cut">-</a>
                                    <input type="text" class="num" name="number" value="${shopcar.number}"/>
                                    <a class="add">+</a>
                                </div>
                                <div class="sp3">
                                    <span>${shopcar.price}</span>
                                </div>

                                <div class="sp1">
                                    <a href="#"><img src="${shopcar.ppicture}" width="101" height="55"></a>
                                    <h6 class="h6"><a href="#">${shopcar.pname}</a></h6>

                                </div>
                                <div class="sp0"><span><input type="checkbox" class="user_id_batch checkbox"
                                                              value="${shopcar.pid}"/>

                                <input type="hidden" value="${shopcar.price * shopcar.number}"></span></div>
                            </div>
                        </li>
                        </c:forEach>

                        <!--列表 end-->
                        <div class="clear"></div>
                        <jsp:include page="/application/commons/page.jsp">
                            <jsp:param name="bodyId" value="product-list"></jsp:param>
                        </jsp:include>
                </div>

                <!--从这里循环end-->
                </ul>
                <div class="clear"></div>
                <p class="pay-total">

                    <span class="sp2">应付总额<span id="lghh"></span></span>
                    <span class="sp1">已选<span id="wlmm"></span>件商品</span>
                </p>
            </div>
            <!--end-->
        </div>
        <div class="last-submit"><a onclick="selectProductFromByUidAndPid()">提交订单</a></div>
    </div>
    <!--右边内容 end-->
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

</script>

<script type="text/javascript">
    $(".bookcontent ul").hide();
    $(".bookcontent ul:first").show();
    $(".templet_jobs_005 ul li").click(function () {

        $(".templet_jobs_005 ul li").removeClass("on");
        $(this).addClass("on");
        $(".bookcontent ul").hide();
        var a = $(this).index();
        $(".bookcontent ul").eq(a).show();
    })


    function selectProductFromByUidAndPid() {
        // 1.定义一个数组用来存储id
        var idArray = new Array();
        //2.获取用户选择的id
        var selChecked = $(".user_id_batch:checked")

        //3.判断非空
        if (selChecked.length == 0) {
            layer.msg("请选择要结算的商品", {icon: 2, time: 1000,});
            return
        }
        //4.遍历
        selChecked.each(function (index, item) {
            idArray.push($(item).val());
        });
        //5.发送请求
        location.href = "product/selectProductFromByUidAndPid?idArray=" + idArray;
    }

/*TODO 获得所有复选框并计算总价*/
    $(".checkallbox").click(function () {
        $(".checkbox").prop("checked", $(".checkallbox").prop("checked"))
        //获得class为user_id_batch的所有选择框
       var selChecked = $(".user_id_batch:checked")
        $("#wlmm").html(selChecked.length);
        var selChecked2=[];
        //遍历这个selChecked将每一个xiaoji放入selChecked2
        for(var i=0;i<selChecked.length;i++){
            selChecked2.push($(".user_id_batch:checked")[i].value)
        }
        var total =0;
        //循环selChecked2并求和
        for(var i =0;i<selChecked2.length;i++){
            var str = "#"+selChecked2[i];
            var a= $(str).val();
            var b =a-0;
            total+=b
        }
        $("#lghh").html(total);
    })

    $(".checkbox").click(function () {
        if ($(".checkbox:checked").length == $(".checkbox").length) {
            $(".checkallbox").prop("checked", true)
        } else {
            $(".checkallbox").prop("checked", false)
        }
        var selChecked = $(".user_id_batch:checked")
        $("#wlmm").html(selChecked.length)

        var selChecked2=[];
        for(var i=0;i<selChecked.length;i++){
            selChecked2.push($(".user_id_batch:checked")[i].value)
        }
        var total =0;

        for(var i =0;i<selChecked2.length;i++){
           var str = "#"+selChecked2[i];
          var a= $(str).val();
          var b =a-0;
          total+=b
        }
        $("#lghh").html(total);


      /*  id = $(".user_id_batch:checked").val()
        total=0;
        for(var i=0;i<id.length;i++){
            alert(id.length)
            var str = "#" + id;
            var str2="#"+id[i];

            var a = $(str2).val()-0;
            total+=a;
        }*/
    })


    $(".cut").click(function () {
        if ($(this).next().val() > 1) {
            alert(${item.pid})
            var sid = ${item.sid}
            $.ajax({
                type: "GET",
                url: "product/cutNumber",
                data: "sid=" + sid,
                success: function (data) {
                    if (data.result) {
                        $(this).next().val($(this).next().val() - 1);
                    }
                }
            })
        }
    })

    /*TODO addNumber*/
    $(".add").click(function () {
        var sid = ${item.sid}
        $.ajax({
            type: "GET",
            url: "product/addNumber",
            data: "sid=" + sid,
            success: function (data) {
                if (data.result) {
                    $(this).prev().val($(this).prev().val() - 0 + 1);
                }
            }
        })


    })

</script>

</body>
</html>
