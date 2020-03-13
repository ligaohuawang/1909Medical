<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
<meta charset="UTF-8" />
    <base href="<%=request.getContextPath()+"/"%>">
    <%--layui--%>
    <%--<link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />--%>
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
           <li><a href="application/health/healthkown.jsp" class="ona" id="nav4">健康知识<span></span></a></li>
           <li><a href="user/personal" class="ona" id="nav5">用户反馈<span></span></a></li>
           <li><a href="application/about/about_us.jsp" class="ona" id="nav6">关于我们<span></span></a></li>
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
  <aside class="banner ban" style=" background:url(uploadfiles/banner_famous.jpg) no-repeat top center; height:210px;">  
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
    <div class="siderFamous">
      <ul>
          <li class="<c:if test="${doctor.dspeciality == '会诊医生'}" > on </c:if> " ><a href="#" class="a1">会诊医生</a></li>
       
        <li class=" <c:if test="${doctor.dspeciality == '保健医生'}" > on </c:if> "><a href="#" class="a2">保健医生</a></li>

        <li class=" <c:if test="${doctor.dspeciality == '专科医生'}" > on </c:if> "><a href="#" class="a3">专科医生</a></li>
   
        <li class=" <c:if test="${doctor.dspeciality == '专家医生'}" > on </c:if> "><a href="#" class="a4">专家医生</a></li>
      </ul>
    </div>
    
    <!--右边内容-->
    <div class="mainCont">
    
     <div class="famousBox2 Dt">
     <!--start-->
      <div class="famous-title">
        <h3><span>保健医生</span></h3>
      </div>
      <div class="doctor-list2">
        <ul>
              <li>
                <a class="imgBox"><img src="${doctor.dpicture}"></a>
                <p class="p2"><span>姓名:</span>${doctor.dname}</p>
                <p class="p2"><span>职务:</span>${doctor.dspeciality}</p>
                <p class="p2"><span>职称:</span>${doctor.dintroduction}</p>
                <p class="p2"><span>科室:</span>${doctor.droom}</p>
                <p class="p2"><span>电话:</span>${doctor.dphone}</p>
              </li>
              <div class="clear"></div>
              
             
         </ul>
          <div class="detail">三丸医疗中心研究生导师,享受国务院特殊津贴专家。主持完成省级科研项目2项，参与完成省、市
              级科研项目5项，现有20余篇学术论文发表于国内外专业期刊，擅长先心病介入治疗、球囊
              瓣膜成形术、干细胞移植术及全身各部位放射介入治疗。
         </div>
          
         <div class="getback">
           <p><a href="javascript:history.back(-1)">返回</a></p>

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
	 $(".doctor-list li").each(function (i, item) {
        if (Number(i + 1) % 2 == 0) {
            $(this).css("margin-right","0px");
        }
    });
 </script>
</body>
</html>