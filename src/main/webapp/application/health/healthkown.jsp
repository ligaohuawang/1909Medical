<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8" />
    <base href="<%=request.getContextPath()+"/"%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="Author" content="">
<meta content="" name="design">
<title>广州一代医药科技有限公司</title>
<link rel="stylesheet" type="text/css" media="all" href="css/css_whir.css"/>
<script type="text/javascript" src="Scripts/jquery-1.7.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.SuperSlide.2.1.1.js"></script>
<!--[if lt IE 9]><script type="text/javascript" src="scripts/html5shiv.v3.72.min.js"></script><![endif]-->
<script  type="text/javascript"> var navid="4"</script>
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
           <li><a href="user/personal" class="ona" id="nav5">用户反馈<span></span></a></li>
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
  <aside class="banner ban" style=" background:url(uploadfiles/banner_health.jpg) no-repeat top center; height:210px;">  
    <div class="banlink">
      <!--<a href="#" class="a1">会员登录</a>
      <a href="#" class="a2">名医推荐</a>
      <a href="#" class="a3">咨询客服</a>-->
    </div>
  </aside>
  <!--图片切换 End-->	
  <aside class="Current"><em></em><a href="index.html">首页</a> > <span>健康知识</span></aside>
  
  <section class="HealthMain Main">
    <ul class="cate">
      <li class="on first"><a href="#" class="a1">口腔溃疡</a></li>
      <li ><a href="#" class="a2">口臭</a></li>
      <li ><a href="#" class="a3">牙龈出血</a></li>
      <li ><a href="#" class="a4">高血压</a></li>
    </ul>
    <div class="conbox">
    <!--start-->
      <article class="NewsList">
            <ul>
                 <article class="topnews">
                         <figure class="fimg">
                            <a href="#"><img src="images/health_pic1.jpg" width="186" height="127"></a>
                         </figure>   
                            <h3 class="h3"><a href="#">春节上火口腔溃疡吃新鲜蔬菜   坚持这些饮食习惯让你更长寿</a></h3>
                            
                            <p>	生活中几乎每个人都遭遇过口腔溃疡，许多人认为口腔溃疡会自愈不用管。专家表示，这些认识有一定正确性，但也不尽如此。中南大学湘雅二院口腔科副主任医师肖立伟解释，上火的确会有引发口腔溃疡的可能。因为从..</p>
                            <a href="#" class="more">&gt;&gt; 查看更多</a>
                    </article>

                   <li><span><time pubtime="2015/03/19">2015-03-19</time></span><a href="#">春节期间喝这些茶养护肠胃选对这些下酒菜防宿醉</a></li>
                   <li><span><time pubtime="2014/11/28">2014-11-28</time></span><a href="#">为什么30岁后吃姜好处多大鱼大肉后吃猕猴桃更解腻</a></li>
                   <li><span><time pubtime="2015/03/19">2015-03-19</time></span><a href="#">春节期间喝这些茶养护肠胃选对这些下酒菜防宿醉</a></li>
                   <li><span><time pubtime="2014/11/28">2014-11-28</time></span><a href="#">为什么30岁后吃姜好处多大鱼大肉后吃猕猴桃更解腻</a></li>
                   <li><span><time pubtime="2015/03/19">2015-03-19</time></span><a href="#">春节期间喝这些茶养护肠胃选对这些下酒菜防宿醉</a></li>
                   <li><span><time pubtime="2014/11/28">2014-11-28</time></span><a href="#">为什么30岁后吃姜好处多大鱼大肉后吃猕猴桃更解腻</a></li>
                   <li><span><time pubtime="2015/03/19">2015-03-19</time></span><a href="#">春节期间喝这些茶养护肠胃选对这些下酒菜防宿醉</a></li>
                   <li><span><time pubtime="2014/11/28">2014-11-28</time></span><a href="#">为什么30岁后吃姜好处多大鱼大肉后吃猕猴桃更解腻</a></li>
                </ul>
                
               <!--*pages*-->
               <div class="Pages4">
                        <span class="p_page">
                           <a href='{$FirstPageUrl}' class='a_first'>首页</a>
                           <a href="javascript:void(0);" class="a_prev"><<</a>
                           <em class="num">
                             <a href="/yzfd201412017318/gsxw/index_28.aspx?page=1" class="a_cur" id="A1">1</a>
                           </em>
                            <a href="javascript:void(0);" class="a_next">>></a>
                            <a href='{$LastPageUrl}' class='a_end'>末页</a> 
                        </span>
                </div>
               <!--*pages*--> 
        </article>
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
    
    <script type="text/javascript">
    //整站无图处理
    jQuery.each(jQuery("img"), function (i, n) { jQuery(n).error(function () { n.src = 'uploadfiles/nopic.jpg'; }); n.src = n.src; });
		
    </script>

 <script type="text/javascript">
	 $(".p-list li").each(function (i, item) {
        if (Number(i + 1) % 3 == 0) {
            $(this).css("margin-right","0px");
        }
    });
 </script>
 
</body>
</html>