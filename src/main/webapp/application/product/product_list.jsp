<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
<meta charset="UTF-8" />
    <base href="<%=request.getContextPath()+"/"%>">
    <%--layui--%>
    <!--<link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />-->
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />

    <%--layui--%>
    <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
    <script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
    <script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="js/H-ui.js"></script>
    <script type="text/javascript" src="js/H-ui.admin.js"></script>
    <style type="text/css">
                .second{
                         color: red;
                     }
             </style>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="Author" content="">
<meta content="" name="design">
<title>广州一代医药科技有限公司</title>
<link rel="stylesheet" type="text/css" media="all" href="css/css_whir.css"/>
<script type="text/javascript" src="Scripts/jquery-1.7.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.SuperSlide.2.1.1.js"></script>
<!--[if lt IE 9]><script type="text/javascript" src="scripts/html5shiv.v3.72.min.js"></script><![endif]-->
<script  type="text/javascript"> var navid="3"</script>
</head>

<body id="product-list">
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
      <li  class="licla <c:if test="${productData.pptype == 1 || pptype == 0}">on first</c:if> " value="1"><a href="javascript:void(0)" class="a1">口腔护理</a></li>
      <li class="licla  <c:if test="${productData.pptype == 2}">on first</c:if> " value="2"><a href="javascript:void(0)" class="a2">康复软件</a></li>
      <li class="licla <c:if test="${productData.pptype == 3}">on first</c:if> " value="3"><a href="javascript:void(0)" class="a3">康复训练</a></li>
      <li class="licla <c:if test="${productData.pptype == 4}">on first</c:if> " value="4"><a href="javascript:void(0)" class="a4">康复器材</a></li>
    </ul>
    <div class="conbox">
    <!--start-->
       <div class="product-box">

           <div class="p-menu">
              <ul>
                <li>
                  <div>
                    <span class="first">类别</span>

                      <c:forEach items="${typeList}" var="type">
                          <span><a href="javascript:void(0)" name="type" class=" <c:if test="${productData.ptype == type}">second</c:if> " >${type}</a></span>
                   </c:forEach>

                  </div>
                </li>
                
                <li>
                  <div>
                    <span class="first">品牌</span>
                      <c:forEach items="${brandList}" var="brand">
                          <span><a href="javascript:void(0)" name="bran" class=" <c:if test="${productData.pbrand == brand}">second</c:if> " >${brand}</a></span>
                      </c:forEach>
                  </div>
                </li>
                
                <li>
                  <div>
                    <span class="first">功能</span>
                      <c:forEach items="${functionList}" var="function">
                          <span><a href="javascript:void(0)" name="function" class=" <c:if test="${productData.pfunction == function}">second</c:if> " >${function}</a></span>
                      </c:forEach>
                  </div>
                </li>
                  <li>
                  <div>
                    <span class="find"><a>查找</a></span>
                    <span class="reset"><a>重置</a></span>
                  </div>
                </li>
              </ul>
           </div>
           <!--列表 start-->
            <div class="p-list">
               <ul>
                   <c:forEach items="${page.list}" var="product">
                 <li>
                    <div>
                      <a class="img" href="product/todetail?pid=${product.pid}"><img src="${product.ppicture}" width="311" height="108" /></a>
                      <h3><a class="title" href="#">${product.pname}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${product.pspecification}</a></h3>
                      <p>${product.pintroduction}</p>
                    </div>
                 </li>
                   </c:forEach>

               </ul>
            </div>

           <!--列表 end-->
           <div class="clear"></div>
           <jsp:include page="/application/commons/page.jsp">
               <jsp:param name="bodyId" value="product-list"></jsp:param>
           </jsp:include>
       </div>
    <!--end-->
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
    
   <%-- <script type="text/javascript">
    //整站无图处理
    jQuery.each(jQuery("img"), function (i, n) { jQuery(n).error(function () { n.src = 'uploadfiles/nopic.jpg'; }); n.src = n.src; });
		
    </script>--%>

 <script type="text/javascript">

     $(".licla").click(function () {

         $(".licla").removeClass("on first");
         $(this).addClass("on first");
        var pptype = $(this).val();
         $("#product-list").load( "product/queryProductList?currentPage=1&pageSize=6&pptype="+pptype);


     })
	 $(".p-list li").each(function (i, item) {
        if (Number(i + 1) % 3 == 0) {
            $(this).css("margin-right","0px");
        }
    });

     $("a[name='type']").click(function () {
         $("a[name='type']").removeClass("second");
         $(this).addClass("second");
     })
     $("a[name='function']").click(function () {
         $("a[name='function']").removeClass("second ");
         $(this).addClass("second");
     })
     $("a[name='bran']").click(function () {
         $("a[name='bran']").removeClass("second");
         $(this).addClass("second");
     })


     $(".reset").click(function () {
         $("a[name='bran']").removeClass("second");
         $("a[name='function']").removeClass("second ");
         $("a[name='type']").removeClass("second");
     })

     $(".find").click(function () {
         var type = $(".second[name='type']").text();
         var bran = $(".second[name='bran']").text();
         var functions = $(".second[name='function']").text();

         var a = $(".second").length;
         var pptype = $(".on ").val();
         $("#product-list").load( "product/queryProductList?currentPage=1&pageSize=6&pptype="+pptype+"&ptype="+type+"&pbrand="+bran+"&pfunction="+functions);
     })
 </script>
 
</body>
</html>