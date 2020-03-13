<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/11/14
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="<%=request.getContextPath()+"/"%>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="Author" content="">
    <meta content="" name="design">
    <title>广州一代医药科技有限公司</title>

    <%--layui--%>
  <%--  <link href="css/H-ui.min.css" rel="stylesheet" type="text/css"/>--%>
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css"/>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" type="text/css" media="all" href="css/css_whir.css"/>
    <script type="text/javascript" src="Scripts/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.SuperSlide.2.1.1.js"></script>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="scripts/html5shiv.v3.72.min.js"></script><![endif]-->
    <script type="text/javascript"> var navid = "3"</script>

    <%--layui--%> <%--ajax文件上传的js--%>
    <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
    <script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
    <script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="js/H-ui.js"></script>
    <script type="text/javascript" src="js/H-ui.admin.js"></script>
    <script>
        function test(name, Content) {
            var html = "<img src=" + name + " />";
            $(".videoBig").html(html);
            document.getElementById("picTile").innerHTML = Content;
        }
    </script>
</head>
<body id="product-list" >
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
<aside class="banner ban" style=" background:url(uploadfiles/banner_product.jpg) no-repeat top center; height:210px;">
    <div class="banlink">
        <!--<a href="#" class="a1">会员登录</a>
        <a href="#" class="a2">名医推荐</a>
        <a href="#" class="a3">咨询客服</a>-->
    </div>
</aside>
<!--图片切换 End-->
<aside class="Current"><em></em><a href="index.html">首页</a> > <span>产品目录</span></aside>

<section class="ProductMain Main">
    <ul class="cate">
        <li  class="licla" value="1"><a href="javascript:void(0)" class="a1">口腔护理</a></li>
        <li class="licla" value="2"><a href="javascript:void(0)" class="a2">康复软件</a></li>
        <li class="licla" value="3"><a href="javascript:void(0)" class="a3">康复训练</a></li>
        <li class="licla" value="4"><a href="javascript:void(0)" class="a4">康复器材</a></li>
    </ul>
    <div class="conbox">
        <!--start-->
        <div class="product-box">

            <!--主体-->

            <div class="templet_video_001">

                <div class="videoBig">
                    <img src="${product.ppicture}"/>
                </div>
                <div class="videoList">
                    <div class="prev"></div>
                    <div class="listBox" id="marqueeDemo2">
                        <ul class="listImg">
                            <li onclick="test('images/product-Bpic1.jpg','内容1')">
                                <div class="pic"><img alt='佳洁1士' src="${product.ppicture}"/></div>
                            </li>

                            <li onclick="test('images/product-Bpic1.jpg','内容2')">
                                <div class="pic"><img alt='佳洁士2' src="${product.ppicture}"/></div>
                            </li>

                            <li onclick="test('images/product-Bpic1.jpg','内容3')">
                                <div class="pic"><img alt='佳洁士3' src="${product.ppicture}"/></div>
                            </li>

                            <li onclick="test('images/product-Bpic1.jpg','内容4')">
                                <div class="pic"><img alt='佳洁士4' src="${product.ppicture}"/></div>
                            </li>
                        </ul>
                    </div>
                    <div class="next"></div>
                </div>
                <script type="text/javascript" src="/Scripts/jquery.SuperSlide.2.1.1.js"></script>
                <script type="text/javascript">
                    $(function () {
                        $(".templet_video_001 .listImg li").click(function () {
                            var _txt = $(this).find("img").attr("alt");
                            $(".tanj_right .tan_yywz").html(_txt);
                        })
                    });
                    jQuery(".videoList").slide({
                        mainCell: ".listBox ul",
                        autoPage: true,
                        effect: "left",
                        titOnClassName: "on",
                        vis: 3
                    });
                </script>
            </div>

            <div class="tanj_right">
                <div class="tan_yywz">

                    ${product.pname}

                </div>
                <div class="tynbgh" id="picTile">
                    <div class="neir">
                        <p>类别：${product.ptype}</p>
                        <p>价格：${product.price}</p>
                        <p><span>规格</span><a href="javascript:void(0);">${product.pspecification}</a></p>
                    </div>
                    <a style="display:inline;" class="button1" href="javascript:void(0);">购买</a>
                    <a style="display:inline;" class="button1" href="javascript:void(0);"
                       onclick="addToShopCar()">添加购物车</a>
                    <a class="cut" style="font-size: 30px">-</a>
                    <input type="text" class="num" name="number" value="1"
                           style="width:50px;height:30px;border-color: black;border-style: solid;border-width:1px "/>
                    <a class="add" style="font-size: 30px">+</a>

                </div>
                <div class="kangh"></div>

                <!--主体-->
                <div class="clear"></div>
                <!--商品详情-->
                <div class="product-detail">
                    <P class="line"><a class="on" href="javascript:void(0);">产品详情</a><a
                            href="javascript:void(0);">产品评论</a><a href="javascript:void(0);">好评率</a></P>

                    <ul>
                        <li>
                            <h3 style="font-size:30px; color:#5b5b5b;">医疗康复软件设备</h3>
                            <p style=" text-indent:2em; font-size:12px;">医院信息系统(EU-HIS
                                V5.0系统)是全面升级的最新版本，以"患者"为中心，以"人、财、物"为重点的开发理念，基本解决了医院手工作业"三长一短"的问题。系统实现医院"一卡通"管理和医生电子处方功能，医院自己可个性化灵活设置所需各种窗体、财务报表，以满足各医院不同需求...</p>
                            <p style=" text-indent:2em; font-size:12px; margin-top:20px;">
                                益友系统基于HL7标准进行系统研发，具有技术成熟、功能全面、安全性高、管理集中后台、无缝连接技术，能够满足系统在未来行业应用领域和功能方面的扩展。可根据医院实际需求快速重新设计流程及个性化修改的系统，能满足不同医院需求。</p>
                        </li>

                        <li>
                            <h3 style="font-size:30px; color:#5b5b5b;">医疗康复软件设备2</h3>
                            <p style=" text-indent:2em; font-size:12px;">医院信息系统(EU-HIS
                                V5.0系统)是全面升级的最新版本，以"患者"为中心，以"人、财、物"为重点的开发理念，基本解决了医院手工作业"三长一短"的问题。系统实现医院"一卡通"管理和医生电子处方功能，医院自己可个性化灵活设置所需各种窗体、财务报表，以满足各医院不同需求...</p>
                            <p style=" text-indent:2em; font-size:12px; margin-top:20px;">
                                益友系统基于HL7标准进行系统研发，具有技术成熟、功能全面、安全性高、管理集中后台、无缝连接技术，能够满足系统在未来行业应用领域和功能方面的扩展。可根据医院实际需求快速重新设计流程及个性化修改的系统，能满足不同医院需求。</p>
                        </li>

                        <li>
                            <h3 style="font-size:30px; color:#5b5b5b;">医疗康复软件设备3</h3>
                            <p style=" text-indent:2em; font-size:12px;">医院信息系统(EU-HIS
                                V5.0系统)是全面升级的最新版本，以"患者"为中心，以"人、财、物"为重点的开发理念，基本解决了医院手工作业"三长一短"的问题。系统实现医院"一卡通"管理和医生电子处方功能，医院自己可个性化灵活设置所需各种窗体、财务报表，以满足各医院不同需求...</p>
                            <p style=" text-indent:2em; font-size:12px; margin-top:20px;">
                                益友系统基于HL7标准进行系统研发，具有技术成熟、功能全面、安全性高、管理集中后台、无缝连接技术，能够满足系统在未来行业应用领域和功能方面的扩展。可根据医院实际需求快速重新设计流程及个性化修改的系统，能满足不同医院需求。</p>
                        </li>
                    </ul>
                </div>
                <!--商品详情 end-->

            </div>
            <!--end-->
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
    $(".p-list li").each(function (i, item) {
        if (Number(i + 1) % 3 == 0) {
            $(this).css("margin-right", "0px");
        }
    });

    $(".product-detail ul li").hide();
    $(".product-detail ul li:first").show();
    $(".product-detail .line a").click(function () {
        var a = $(this).index();
        $(".product-detail .line a").removeClass("on");
        $(this).addClass("on");

        $(".product-detail ul li").hide();
        $(".product-detail ul li").eq(a).show();
    })

    function addToShopCar() {
        var number = $("input[name=number]").val();
        var pid = ${product.pid}
            $.ajax({
                type: "GET",
                url: "product/addShopcar",
                data: "pid=" + pid + "&number=" + number,
                success: function (data) {
                    if (data.result) {
                        layer.msg("添加购物车成功！", {icon: 1, time: 1000})
                    } else {
                        layer.msg(data.data, {icon: 2, time: 1000},function () {
                            location.href = "application/user/user_login.jsp";
                        })

                    }
                }
            })

    }

    $(".cut").click(function () {
        $("input[name=number]").val($("input[name=number]").val() - 1);
    })

    /*TODO 添加数量*/
    $(".add").click(function () {
        $("input[name=number]").val($("input[name=number]").val() - 0 + 1);
    })


    $(".licla").click(function () {

        $(".licla").removeClass("on first");
        $(this).addClass("on first");
        var pptype = $(this).val();

        $("#product-list").load( "product/queryProductList?currentPage=1&pageSize=6&pptype="+pptype);


    })


</script>

</body>
</html>
