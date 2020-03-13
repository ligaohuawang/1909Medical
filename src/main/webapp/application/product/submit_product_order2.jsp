<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head><base href="${pageContext.request.contextPath}/">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="Author" content="">
    <meta content="" name="design">
    <title>皓齿丹唇私人牙医</title>
    <link rel="stylesheet" type="text/css" media="all" href="css/css_whir.css"/>
    <link href="/css/amazeui.css" rel="stylesheet" type="text/css" />

    <link href="/css/H-ui.min.css" rel="stylesheet" type="text/css"/>
    <link href="/css/H-ui.admin.css" rel="stylesheet" type="text/css"/>
    <link href="/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css"/>

    <link href="/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="/css/cartstyle.css" rel="stylesheet" type="text/css" />

    <link href="/css/jsstyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="/lib/layer/1.9.3/layer.js"></script>
    <script type="text/javascript" src="/lib/laypage/1.2/laypage.js"></script>
    <script type="text/javascript" src="/lib/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/js/H-ui.js"></script>
    <script type="text/javascript" src="/js/H-ui.admin.js"></script>
    <script type="text/javascript" src="/Scripts/jquery.SuperSlide.2.1.1.js"></script>
    <!--[if lt IE 9]><script type="text/javascript" src="/scripts/html5shiv.v3.72.min.js"></script><![endif]-->
    <script  type="text/javascript"> var navid="5"</script>

</head>

<body >

<header class="Header">
    <div class="head">
        <a href="首页.html" class="logo"><img src="images/logo.jpg"/></a>
        <a href="javascript:void(0)" id="aaa"></a>
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

<aside class="Current"><em></em><a href="index.html">首页</a> > <span>支付订单</span></aside>

<section class="MemberMain Main">
    <a class="layui-laypage-refresh"
       style="line-height:1.6em;margin-top:3px;display:none"
       href="javascript:location.replace(location.href);" title="刷新"><i
            class="Hui-iconfont">&#xe68f;</i></a>
    <div class="concent">
        <!--地址 -->
        <div class="paycont">
            <div class="address">
                <h3>确认收货地址 </h3>
                <div class="control">
                    <div class="tc-btn createAddr theme-login am-btn am-btn-danger"><a href="javascript:admin_add('添加商品','application/address/address_add.jsp','800','500')"  style="color: white;">使用新地址</a></div>
                </div>
                <div class="clear"></div>
                <!-- 收货地址 -->
                <c:forEach var="address" items="${addressList }">

                    <ul class="addressChoose">
                        <input type="hidden"  value="${address.addressId }" />
                        <!-- 默认地址：class="user-addresslist defaultAddr" -->
                        <li class="user-addresslist">
                            <div class="address-left">

                                <div class="user DefaultAddr">
                                    <span class="buy-address-detail"></span>
                                    <span class="buy-user">收货人</span>
                                    <span class="buy-phone">${address.shouhuoren }</span>

                                </div>
                                <div class="user DefaultAddr">
                                    <span class="buy-address-detail"></span>
                                    <span class="buy-user">电话</span>
                                    <span class="buy-phone">${address.phone }</span>
                                </div>

                                <div class="default-address DefaultAddr">
                                    <span class="buy-line-title buy-line-title-type">收货地址：</span>
                                    <span class="buy--address-detail">${address.addressname }</span>
                                </div>

                            </div>
                            <div class="new-addr-btn">
                                <span class="new-addr-bar hidden">|</span>
                                <a href="javascript:admin_add('修改商品','address/toupdate?addressId=${address.addressId }','800','500')" >编辑</a>
                                <span class="new-addr-bar">|</span>
                                <a href="javascript:void(0);"  class="delete" >删除</a>
                                <input type="hidden" value="${address.addressId }">
                            </div>
                        </li>
                    </ul>
                </c:forEach>


                <div class="clear"></div>
            </div>

            <!--支付方式-->
            <div class="logistics">
                <h3>选择支付方式</h3>
                <ul class="pay-list" id="pay">
                    <li class="pay card"><img src="images/wangyin.jpg" />银联<span id="银联"></span></li>
                    <li class="pay qq"><img src="images/weizhifu.jpg" />微信<span id="微信"></span></li>
                    <li class="pay taobao"><img src="images/zhifubao.jpg" />支付宝<span id="支付宝"></span></li>
                </ul>
                <input type="hidden" id="payway" />
            </div>
          <div class="clear"></div>
<div class="logistics">
                <h3>选择邮寄方式</h3>
                <ul class="pay-list" id="post">
                    <li class="pay card"><img src="/images/zt.png" />中通<span id="中通"></span></li>
                    <li class="pay qq"><img src="/images/st.jpg" />申通<span id="申通"></span></li>
                    <li class="pay taobao"><img src="/images/sf.jpg" />顺风<span id="顺风"></span></li>
                    <li class="pay taobao"><img src="/images/yz.jpg" />邮政<span id="邮政"></span></li>
                </ul>
                <input type="hidden" id="postway" />
            </div>
            <div class="clear"></div>

            <!--订单 -->
            <div class="concent">
                <div id="payTable">

                    <h3>确认订单信息</h3>
                    <div class="cart-table-th">
                        <div class="wp">
                            <div class="th th-item">
                                <div class="td-inner">商品信息</div>
                            </div>
                            <div class="th th-price">
                                <div class="td-inner">单价</div>
                            </div>
                            <div class="th th-amount">
                                <div class="td-inner">数量</div>
                            </div>
                            <div class="th th-sum">
                                <div class="td-inner">金额</div>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>

                    <c:forEach items="${confirmOrderList}" var="confirmOrder">
                        <!-- 购物车 -->
                        <tr class="item-list">
                            <div class="bundle  bundle-last">
                                <div class="bundle-main">
                                    <ul class="item-content clearfix">
                                        <div class="pay-phone">
                                            <li class="td td-item">
                                                <div class="item-pic">
                                                </div>
                                                <div class="item-info">
                                                    <div class="item-basic-info">
                                                        <a href="#" class="item-title J_MakePoint" data-point="tbcart.8.11">${confirmOrder.pname}</a>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="td td-price">
                                                <div class="item-price price-promo-promo">
                                                    <div class="price-content">
                                                        <div class="price-line">
                                                            <em class="price-original">${confirmOrder.price}</em>
                                                        </div>
                                                        <div class="price-line">
                                                            <em class="J_Price price-now" id="priceNow" tabindex="0">${confirmOrder.price}</em>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </div>
                                        <li class="td td-amount">
                                            <div class="amount-wrapper ">
                                                <div class="item-amount ">
                                                    <span class="phone-title">购买数量</span>
                                                    <div class="sl">
                                                        <input class="min am-btn" name="" type="button" value="-" id="jian"/>
                                                        <input class="text_box" id="count" type="text" value="${confirmOrder.number}"
                                                               style="width: 30px; text-align: center;"/>
                                                        <input class="add am-btn" name="" type="button" value="+"  id="jia"/>
                                                        <input type="hidden"  value="goodsId">
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="td td-sum">
                                            <div class="td-inner">
                                                <em tabindex="0" class="J_ItemSum number" id="singlePrice"><fmt:formatNumber type="number" value="${confirmOrder.number*confirmOrder.price}" maxFractionDigits="1"/>${confirmOrder.number*confirmOrder.price}</em>
                                            </div>
                                        </li>

                                    </ul>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </tr>
                    </c:forEach>

                    <div class="clear"></div>
                </div>


                <!--信息 -->
                <div class="order-go clearfix">
                    <div class="pay-confirm clearfix">
                        <div class="box">
                            <div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：${total}</em>
                                <span class="price g_price ">
                                    <span id="money"></span> <em class="style-large-bold-red " id="J_ActualFee">${sum}</em>
											</span>
                            </div>

                            <div id="holyshit268" class="pay-address">

                                <p class="buy-footer-address">
                                    <span class="buy-line-title buy-line-title-type">寄送至：</span>
                                    <span class="buy--address-detail" id="send">

												</span>
                                </p>
                                <p class="buy-footer-address">
                                    <span class="buy-line-title"></span>
                                    <span class="buy-address-detail">
                                         <span class="buy-user" id="person">艾迪 </span>
												<span class="buy-phone" id="tel">15871145629</span>
												</span>
                                </p>
                            </div>
                        </div>

                        <div id="holyshit269" class="submitOrder">
                            <div class="go-btn-wrap">
                                <a id="go" class="btn-go" tabindex="0" title="点击此按钮，提交订单">提交订单</a>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="clear"></div>
        </div>
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
<script type="text/javascript">
    $(function() {
        $("ul[class='addressChoose'] li").each(function () {
            $(this).unbind();
            $(this).click(function () {
                $("ul[class='addressChoose'] li").removeClass("defaultAddr");
                $(this).addClass("defaultAddr");
                var shouhuoren = $("li[class='user-addresslist defaultAddr'] span[class='buy-user']").html();
                var rid = $("li[class='user-addresslist defaultAddr'] input").val();

                var dianhua = $("li[class='user-addresslist defaultAddr'] span[class='buy-phone']").html();
                var dizhi = $("li[class='user-addresslist defaultAddr'] span[class='buy--address-detail']").html();
                $("#rid").val(rid);


                $("#send").html(dizhi);
                $("#person").html(shouhuoren);
                $("#tel").html(dianhua);
            })
        });

        $("ul[class='op_express_delivery_hot'] li").each(function () {
            $(this).unbind();
            $(this).click(function () {
                var express = $(this).children("span").attr("id");

                $("#express").val(express);
                $("ul[class='op_express_delivery_hot'] li").removeClass("selected");
                $(this).addClass("selected");
            })
        });

        $("#pay li").each(function () {
            $(this).unbind();
            $(this).click(function () {
                var paytype = $(this).children("span").attr("id");

                $('#payway').val(paytype);
                $("#paytype").val(paytype);
                $("#pay li").removeClass("selected");
                $(this).addClass("selected");
            });
        });
        $("#post li").each(function () {
            $(this).unbind();
            $(this).click(function () {
                var paytype = $(this).children("span").attr("id");

                $('#postway').val(paytype);
                $("#paytype").val(paytype);
                $("#post li").removeClass("selected");
                $(this).addClass("selected");
            });
        });
    });
    function admin_add(title, url, w, h) {
        layer_show(title, url, w, h);
    }

    $('#go').click(function () {



            var addressId =  $('.user-addresslist.defaultAddr').prev().val();


            var sendMethod =  $('#postway').val();//邮寄方式


            var payMethod =  $('#payway').val();//支付方式

            if( (addressId==null)||(sendMethod==null||sendMethod=='') ||(payMethod==null||payMethod=='')){
                layer.msg("请输入完整信息",{icon: 2, time: 1000,})
                return
            }

            location.href="productOrder/addProductOrder?addressId="+addressId+"&sendMethod="+sendMethod+"&payMethod="+payMethod;
        })

$(".delete").click(function () {
var id = $(this).next().val();
    $.ajax({
        type:"GET",
        url:"address/deleteAddress",
        data:"addressId="+id,
        success:function (data) {
            if(data.result){
                layer.msg('删除成功', {icon: 6, time: 2000},function () {
                    window.location.reload();
                })
            }else {
                layer.msg('删除失败', {icon: 5, time: 2000})
            }
        }
    })
})

    $("#aaa").click(function () {
        location.reload()
    })
</script>
</body>
</html>