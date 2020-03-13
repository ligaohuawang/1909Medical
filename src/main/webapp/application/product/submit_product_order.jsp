<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/11/15
  Time: 8:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <base href="<%=request.getContextPath()+"/"%>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="Author" content="">
    <meta content="" name="design">

    <%--layui--%>
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />

    <title>广州一代医药科技有限公司</title>
    <link rel="stylesheet" type="text/css" media="all" href="css/css_whir.css"/>
    <script type="text/javascript" src="Scripts/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.SuperSlide.2.1.1.js"></script>
    <!--[if lt IE 9]><script type="text/javascript" src="scripts/html5shiv.v3.72.min.js"></script><![endif]-->
    <script  type="text/javascript"> var navid="5"</script>

    <%--layui--%>
    <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
    <script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
    <script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="js/H-ui.js"></script>
    <script type="text/javascript" src="js/H-ui.admin.js"></script>

    <style type="text/css">
        .pay_img input{
            width: 30px;
            height: 30px;
            margin-left: 45px;
        }
        .pay_img2 input{
            width: 30px;
            height: 30px;
            margin-left: 45px;
        }

        #pay_money {
            color: red;
            font-size: 20px;
            position: relative;
        }
    </style>
</head>
<body >
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

        <div class="coutBox Dt">
            <!--收货信息start-->
            <div class="get-info">
                <p><span>收货信息</span></p>
                <div class="info-table">
                    <table>
                        <thead>
                        <tr>
                            <th></th>
                            <th>收货人</th>
                            <th>手机号</th>
                            <th>详细地址</th>
                            <th>操作</th>
                        </tr>
                        <tr>
                            <th><a href="javascript:;">添加新地址</a></th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${addressList}" var="address">
                            <tr>
                                <th><input name="lgh" class="radio1" type="checkbox"  value="${address.addressId}"/></th>
                                <td>${address.shouhuoren}</td>
                                <td>${address.phone}</td>
                                <td>${address.addressname}</td>
                                <td>
                                    <a href="#">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>

                        <tr>
                            <td>
                                <input type="button" class="button1" onclick="comfirmAddress()" value="确认收货地址"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <!--收货信息end-->

            <!--配送方式 start-->
            <div class="send-way">
                <p><span>配送方式</span></p>
                <div class="pay_img2">
                    <input name="wlm" type="checkbox" value="中通快递" class="sendMethod"/>中通快递
                    <span><img src="/images/zt.png" width="50px" height="50px"></span>
                    <input name="wlm" type="checkbox" value="申通快递" class="sendMethod"/>申通快递
                    <span><img src="/images/st.jpg" width="50px" height="50px"></span>
                    <input name="wlm" type="checkbox" value="顺风快递" class="sendMethod"/>顺风快递
                    <span><img src="/images/sf.jpg" width="60px" height="50px"></span>
                    <input name="wlm" type="checkbox" value="邮政快递" class="sendMethod"/>邮政快递
                    <span><img src="/images/yz.jpg" width="50px" height="50px"></span>
                </div>
                <!--支付方式 end-->
                <!--发票信息-->
                <div class="card-info">
                    <%--<p><span>发票信息</span></p>--%>
                    <div class="card-box">
                        <table>
                            <tr>
                                <td>
                                    <input type="button" onclick="comfirmAddress3()" class="button1" value="确认邮寄方式"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <!--配送方式-->
            <!--支付方式-->
            <div class="send-way">
                <p><span>支付方式</span></p>
                <div class="pay_img">
                    <input name="lgh" type="checkbox" value="微信" class="payMethod"/>微信
                    <span><img src="/images/微信.png" width="60px" height="50px"></span>
                    <input name="lgh" type="checkbox" value="支付宝" class="payMethod"/>支付宝
                    <span><img src="/images/zfb_pic1.jpg" width="90px" height="50px"></span>
                    <input name="lgh" type="checkbox" value="银行卡" class="payMethod"/>银行卡
                    <span><img src="/images/yinhangka.jpg" width="50px" height="50px"></span>
                </div>
                <!--支付方式 end-->
                <!--发票信息-->
                <div class="card-info">
                    <%--<p><span>发票信息</span></p>--%>
                    <div class="card-box">
                        <table>
                            <tr>
                                <td>
                                    <input type="button" class="button1" onclick="comfirmAddress2()" value="确认支付方式"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>


            <!--发票信息 end-->

            <div class="clear"></div>
            <p class="check-text">请留言：您填写的收货地址所在地区无货</p>
            <!--购物清单-->
            <div class="buy-box">
                <p class="left"><span>购物清单</span><a href="#">更改</a></p>
                <div class="buy-list">
                    <!--表单开始-->
                    <p>
                        <span class="sp1">购物车中的商品</span>
                        <span class="sp2">价格</span>
                        <span class="sp3">数量</span>
                        <span class="sp4">送积分</span>
                        <span class="sp5">优惠</span>
                        <span class="sp6">合计 </span>
                    </p>
                    <div class="clear"></div>

                    <ul>
                        <<input type="hidden" name="" id="lghwlm" value="${idlist}">
                    <c:forEach items="${confirmOrderList}" var="confirmOrder">
                        <li>
                    <span class="sp1">
                      <a class="a1">${confirmOrder.pname}</a>
                    </span>
                            <span class="sp2">
                       <a class="color-red">${confirmOrder.price}</a>
                    </span>
                            <span class="sp3"><a>${confirmOrder.number}</a></span>
                            <span class="sp4"> <a>1000</a></span>
                            <span class="sp5">
                     <a>0</a>
                    </span>
                            <span class="sp6"> <a class="color-red">${confirmOrder.price*confirmOrder.number}</a></span>

                        </li>
                    </c:forEach>
                    </ul>
                    <!--表单结束-->
                </div>
            </div>


            <!--购物清单end-->

            <!--订单结算-->
            <!--订单结算-->
            <hr>
            <div id="pay_money" class="box-right">
                <dl>
                    总计：<span>¥ ${total}</span><br>
                </dl>
            </div>
            <div class="table-button"><input type="button"  onclick="submitOrder()" class="button" value="确认提交订单" /></div>
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
    jQuery.each(jQuery("img"), function (i, n) { jQuery(n).error(function () { n.src = 'uploadfiles/nopic.jpg'; }); n.src = n.src; });

</script>

<script type="text/javascript">
    $(".bookcontent ul").hide();
    $(".bookcontent ul:first").show();
    $(".templet_jobs_005 ul li").click(function(){

        $(".templet_jobs_005 ul li").removeClass("on");
        $(this).addClass("on");
        $(".bookcontent ul").hide();
        var a=$(this).index();
        $(".bookcontent ul").eq(a).show();
    })

    /*确认收货地址*/
    function comfirmAddress() {
        var selChecked = $(".radio1:checked")
        if(selChecked.length>1){
            layer.msg("地址只能选择一个",{icon: 2, time: 1000,})
        }else if(selChecked.length==1){
            layer.msg("收货地址已保存",{icon: 1, time: 1000,})
        }else {
            layer.msg("请选择收货地址",{icon: 2, time: 1000,})
        }
    }

    /*确认支付方式*/
    function comfirmAddress2() {
        var selChecked = $(".payMethod:checked")
        if(selChecked.length>1){
            layer.msg("支付方式只能选择一个",{icon: 2, time: 1000,})
        }else if(selChecked.length==1){
            layer.msg("支付方式已保存",{icon: 1, time: 1000,})
        }else {
            layer.msg("请选择支付方式",{icon: 2, time: 1000,})
        }
    }

    /*确认配送方式*/
    function comfirmAddress3() {
        var selChecked = $(".sendMethod:checked")
        if(selChecked.length>1){
            layer.msg("配送方式只能选择一个",{icon: 2, time: 1000,})
        }else if(selChecked.length==1){
            layer.msg("配送方式已保存",{icon: 1, time: 1000,})
        }else {
            layer.msg("请选择配送方式",{icon: 2, time: 1000,})
        }
    }


function submitOrder(){


      var addressId =  $(".radio1:checked").val();//地址id(收货人,收货人电话)


    var sendMethod =  $(".sendMethod:checked").val();//邮寄方式


    var payMethod =  $(".payMethod:checked").val();//支付方式

    if( (addressId==null)||(sendMethod==null) ||(payMethod==null)){
        layer.msg("请输入完整信息",{icon: 2, time: 1000,})
    }

    location.href="productOrder/addProductOrder?addressId="+addressId+"&sendMethod="+sendMethod+"&payMethod="+payMethod;
}



</script>

</body>
</html>
