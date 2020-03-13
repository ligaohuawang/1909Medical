<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <base href="<%=request.getContextPath()+"/" %>"/>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="Author" content="">
    <meta content="" name="design">
    <title>广州一代医药科技有限公司</title>
    <link rel="stylesheet" type="text/css" media="all" href="css/css_whir.css"/>
    <link rel="stylesheet" href="layui/css/layui.css" media="all"/>
    <script type="text/javascript" src="Scripts/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="layui/lay/modules/layer.js"></script>
    <script type="text/javascript" src="Scripts/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript" src="Scripts/html5shiv.v3.72.min.js"></script>
    <script  type="text/javascript"> var navid="5"</script>
    <style type="text/css">
        .pay_img img{
            width: 120px;
            height: 75px;
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
<script type="text/javascript">
    $("#nav"+navid).addClass("active");

    //语言切换
    $(".checked-lan").click(function(){
        $(".language-menu").show();
    })
    $(".language-menu li").each(function(){
        $(this).click(function(){
            // $(".checked-lan").find("a").html()=$(this).find("a").html();
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
<section class="MemberMain Main">

    <div class="conbox">

        <div class="coutBox Dt">
            <!--收货信息start-->
            <div class="get-info">
                <p><span>收货信息</span></p>
                <table class="layui-table">
                    <colgroup>
                        <col width="150">
                        <col width="200">
                        <col>
                    </colgroup>

                    <thead>
                    <tr>
                        <th><a href="javascript:;">添加新地址</a></th>
                    </tr>
                    <tr>
                        <th></th>
                        <th>收货人</th>
                        <th>手机号</th>
                        <th>详细地址</th>
                        <th>操作</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${addressList}" var="address">
                        <tr>
                        <th><input name="address_id" type="checkbox" value="${address.id}"/></th>
                        <td>${address.shouhuoren}</td>
                        <td>${address.phone}</td>
                        <td>${address.addressName}</td>
                        <td>
                            <a href="#">删除</a>
                        </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <!--收货信息end-->

            <!--配送方式 start-->
            <div class="send-way">
                <p><span>配送方式</span></p>
                <div class="pay_img">
                    <input id="song_method_msg" type="hidden" value=""/>
                    <img onclick="song_method('圆通快递')" src="images/yt.png" />
                    <img onclick="song_method('中通快递')" src="images/zt.png" />
                    <img onclick="song_method('韵达快递')" src="images/yd.png" />
                </div>
            </div>
            <!--配送方式-->

            <!--支付方式-->
            <div class="send-way">
                <p><span>支付方式</span></p>
                <div class="pay_img">
                    <input id="pay_method_msg" type="hidden" value="">
                    <img onclick="pay_method('支付宝')" src="images/doctor_pay_icon.jpg" />
                    <img onclick="pay_method('银行卡')" src="images/yinhangka.jpg" />
                    <img onclick="pay_method('微信')" src="images/weixin.png" />
                </div>
            </div>
            <!--支付方式 end-->

            <div class="clear"></div>
<%--            <p class="check-text">请留言：您填写的收货地址所在地区无货</p>--%>
            <!--购物清单-->
            <div class="buy-box">
                <p class="left"><span>购物清单</span></p>
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
                        <c:forEach items="${productEntityList}" var="productEntity">
                            <li>
                            <!--商品id-->
                            <input type="hidden" name="get_pro_id" value="${productEntity.product.id}"/>
                                <span class="sp1">
                                  <a class="a1">${productEntity.product.productName}</a>
<%--                                  <a class="a2">收货地址所在区域的库房无货</a>--%>
                                </span>
                                        <span class="sp2">
                                   <a class="color-red">￥${productEntity.product.productPrice}</a>
                                </span>
                                        <span class="sp3"><a>${productEntity.count}</a></span>
                                        <span class="sp4"> <a>1000</a></span>
                                        <span class="sp5">
                                        <span>无</span>
                                </span>
                                        <span class="sp6"> <a class="color-red">￥${productEntity.totalMoney}</a></span>
                            </li>
                        </c:forEach>
                    </ul>
                    <!--表单结束-->
                </div>
            </div>
            <!--购物清单end-->

            <!--订单结算-->
            <hr>
            <div id="pay_money" class="box-right">
                <dl>
                    应付金额：<span>¥${totalAllMoney}</span>
                </dl>
            </div>
            <div class="table-button"><input onclick="add_order()" type="button" class="button" value="确认提交订单" /></div>
        </div>

    </div>
</section>

<script type="text/javascript">

    //点击选择配送方式
    function song_method(song_method){
        layer.msg("已选择【"+song_method+"】",{icon:1,time:1000});
        $("#song_method_msg").val(song_method);
    }

    //点击选择支付方式
    function pay_method(pay_method){
        layer.msg("已选择【"+pay_method+"】支付",{icon:1,time:1000});
        $("#pay_method_msg").val(pay_method);
    }


    //提交订单
    function add_order(){

        var param = new Object();

        if (confirm("确定支付吗？")) {
            param.orderStatus = 1;
        }
        param.uid = "${user.id}";
        //只能选择一个收货地址
        if ($("input[name='address_id']:checked").length > 1) {
            layer.msg("只能选择一个收货地址",{icon:2,time:1000});
            return;
        }
        param.addressId= $("input[name='address_id']:checked").val();
        param.payMethod = $("#pay_method_msg").val();
        param.expressMethod = $("#song_method_msg").val();

        var pids = new Array();
        $("input[name='get_pro_id']").each(function (index,item) {
            pids.push($(item).val());
        });
        param.pids = pids;

        $.post("productOrder/addProductOrder",param,function (data) {

           /* if (data.status=="SUCCESS"){
                layer.msg(data.msg,{icon:1,time:1000});
            } else {
                layer.msg(data.msg,{icon:2,time:1000});
            }*/
           location.href = "shopcar_index.jsp";
        });

    }






    $(".bookcontent ul").hide();
    $(".bookcontent ul:first").show();
    $(".templet_jobs_005 ul li").click(function(){

        $(".templet_jobs_005 ul li").removeClass("on");
        $(this).addClass("on");
        $(".bookcontent ul").hide();
        var a=$(this).index();
        $(".bookcontent ul").eq(a).show();
    })
</script>

</body>
</html>
