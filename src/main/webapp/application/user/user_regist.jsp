<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="zh-cn">
<head>
    <base href="<%=request.getContextPath()+"/"%>">
    <%--layui--%>
   <%-- <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />--%>
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
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="Author" content="">
<meta content="" name="design">
<title>广州一代医药科技有限公司</title>
<link rel="stylesheet" type="text/css" media="all" href="css/css_whir.css"/>
<script type="text/javascript" src="Scripts/jquery-1.7.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript" src="js/jsAddress.js"></script>
<!--[if lt IE 9]><script type="text/javascript" src="scripts/html5shiv.v3.72.min.js"></script><![endif]-->
<script  type="text/javascript"> var navid="2"</script>
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
  <aside class="banner ban" style=" background:url(uploadfiles/banner_dl.jpg) no-repeat top center; height:210px;">  
  </aside>
  <!--图片切换 End-->	
 
  
  <section class="DoctorMain Main">
     <div class="dl-title"><a href="index.html">注册</a></div>
      <div class="zc-bg" style="height: 600px">
          <form method="user/regist" action="post" >
         <table class="">
               <tr>
                   <td><span>昵称:</span><input type="text" class="text" name="nickname"/></td>
               </tr><tr>
                   <td><span>用户名:</span><input type="text" class="text" name="uname"/></td>
               </tr>
               <tr>
                  <td><span>邮箱:</span><input type="text" class="text" name="uemail"/></td>
               </tr>
              <tr> 
                <td><span>手机:</span>
                  <input type="text" class="text " name="uphone"/>

                </td>
              </tr>
             <tr>
                 <td><span>身份证:</span><input type="text" class="text" name="ucard"/></td>
             </tr>

             <tr>
                    <div style="position: relative">
                 <td ><span>生日：</span>
                     <select node-type="birthday_year" name="birthday_y" id="birthday_y" style="position: absolute ;left: 100px; top: 10px">
                         <option value=""></option>
                     </select><span>年</span>

                     <select node-type="birthday_month" name="birthday_m" id="birthday_m" style="position: absolute ;left: 200px; top: 10px" >
                         <option value=""></option>
                     </select><span>月</span>

                     <select node-type="birthday_month" name="birthday_d" id="birthday_d" style="position: absolute ;left: 300px;top: 10px">
                         <option value=""></option>
                     </select><span>日</span>
                 </td>
                 <input type="hidden" name="birth" id="birth" value="2016/2/12">
</div>

             </tr>


             <tr>
                 <div style="position: relative">
                 <td><span>性别:</span>
                     <select name="usex" style="position: absolute;top: 10px">
                         <option value="1">男</option>
                         <option value="0">女</option>
                     </select>
                 </td>
                 </div>
             </tr>


              <tr>
                  <td><span>密码:</span><input type="text" class="text" name="upassword"/></td>
               </tr>
               <tr>
                  <td><span>确认密码:</span><input type="text" class="text" name="upassword2"/></td>
               </tr>
               <tr>
                   <td><span>邮箱验证码:</span><input type="text" class="text text3" name="emailCode"/><a id="button1" href="javascript:void(0)" >获得验证码</a> </td>
               </tr>
             <tr>
                 <td>
                     <span>地址：</span> <input type="text" class="text" name="address"><br>
                     <span>所在地：</span><select id="Select1" class="select1"></select>省
                     <select id="Select2" class="select1"></select>市
                     <select id="Select3" class="select1"></select>区
                 </td>
             </tr>





              <tr>
                <td><input type="button" class="button1" id="button2" value="确定"/><input type="button" class="button2" value="重置"/></td>
              </tr>
          </table>
          </form>
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

    /*$("input[name=uname]").blur(function () {
        var uname = $("input[name='uname']").val();
        $.ajax({
            type:"GET",
            URL:"user/unameCheck",
            data:"uname="+uname,
            success:function (data) {
                if(data.result){
                    $("span[name='nameErr']").html("名字已存在");
                }
            }
        })
    })*/

$("input[name=upassword2]").blur(function () {
        var upassword2 = $("input[name='upassword2']").val();
        var upassword = $("input[name='upassword']").val();

        if(''==upassword2){
            layer.msg("请确认密码",{icon:5,time:1000});
            return
        }
if(upassword2 != upassword){
    layer.msg("密码不一致",{icon:5,time:1000});
    return
}
    })


    $("input[name=upassword]").blur(function () {
        var upassword = $("input[name='upassword']").val();
        if(''==upassword){
            layer.msg("请输入密码",{icon:5,time:1000});
            return
        }

    })

$("#button1").click(function () {
    var uemail = $("input[name='uemail']").val();
    if(uemail == ""){
        layer.msg("请先输入邮箱",{icon:5,time:1000});
        return
    }
    $.ajax({
        url:"check/emailCode",
        type:"GET",
        data:"uemail="+uemail,
        success:function(data){
           if(data.result){
               layer.msg("获得验证码成功",{icon:6,time:1000});
           }else{
               layer.msg("获得验证码失败",{icon:5,time:1000});
           }
        }
    })
})

$("#button2").click(function () {
    var uname = $("input[name='uname']").val();
    var nickname = $("input[name='nickname']").val();
    var uemail = $("input[name='uemail']").val();
    var uphone = $("input[name='uphone']").val();
    var upassword = $("input[name='upassword']").val();
    var upassword2 = $("input[name='upassword2']").val();
    var emailCode = $("input[name='emailCode']").val();
    var ucard = $("input[name='ucard']").val();
    var usex = $("select[name='usex']").val();
    var ucity = $("input[name='address']").val();
    var birthday = $("#birthday_y").val()+"-"+$("#birthday_m").val()+"-"+$("#birthday_d").val();


    if(nickname ==""||uname ==""|| uemail==""  || uphone =="" || upassword =="" || upassword2 =="" || emailCode ==""|| ucard == "" || ucity==""){
    layer.msg("信息不全",{icon:5,time:1000});
    return
}
    $.ajax({
        url:"user/regist",
        type:"GET",
        data:"ucard="+ucard+"uname="+uname+"&nicknane="+nickname+"&upassword="+upassword+"&emailCode="+emailCode+"&uemail="+uemail+"&uphone="+uphone+"&usex="+usex+"&birthday="+birthday+"&ucity="+ucity,
        success:function(data){
            if(data.result){
                layer.msg('注册成功!',{icon:6,time:1000});
                window.location="application/user/user_login.jsp";
            }else{
                layer.msg(data.data,{icon:5,time:1000});
            }
        }

    })

})




    var date=new Date();
    var year=date.getFullYear();
    for(var i=year;i>=1900;i--){
        $("#birthday_y").append("<option value="+i+" label="+i+">"+i+"</option>");
    }




    $('#birthday_y').change(function(){
        var birth_year=$('#birthday_y').val();
        if(birth_year!=""){
            var birth_month=$('#birthday_m').val();
            if(birth_month!=""){
                if(birth_month=="2"){
                    if((birth_year%4==0 && birth_year%100!=0) || (birth_year%400==0)){
                        $("#birthday_d").append("<option value=" + 29 + " label=" + 29 + ">" + 29 + "</option>");
                    }else{
                        $("#birthday_d option[value='29']").remove();
                    }
                }
            }else {
                for (var i = 1; i <= 12; i++) {
                    $("#birthday_m").append("<option value=" + i + " label=" + i + ">" + i + "</option>");
                }
            }
        }else{
            $("#birthday_m").html("<option value=''></option>");
            $("#birthday_d").html("<option value=''></option>");
        }
        checkBirthday();
    });
    $('#birthday_m').change(function(){
        var birth_year=$('#birthday_y').val();
        var birth_month=this.value;
        var birth_day=$('#birthday_d').val();
        if(birth_month!=""){
            switch (birth_month){
                case "1":case "3":case "5":case "7":case "8":case "10":case "12":
                if(birth_day=="") {
                    $("#birthday_d").empty();
                    $("#birthday_d").append("<option value='' ></option>");
                    for (var i = 1; i <= 31; i++) {
                        $("#birthday_d").append("<option value=" + i + " label=" + i + ">" + i + "</option>");
                    }
                }else {
                    switch ($("#birthday_d option:last").attr("value")){
                        case "28":$("#birthday_d").append("<option value=" + 29 + " >" + 29 + "</option>");
                        case "29":$("#birthday_d").append("<option value=" + 30 + " >" + 30 + "</option>");
                            $("#birthday_d").append("<option value=" + 31 + " >" + 31 + "</option>");break;
                        case "30":$("#birthday_d").append("<option value=" + 31 + " >" + 31 + "</option>");
                            break;
                        default :break;

                    }
                }
                break;
                case "4":case "6":case "9": case "11":
                if(birth_day=="") {
                    $("#birthday_d").empty();
                    $("#birthday_d").append("<option value='' ></option>");
                    for (var i = 1; i <= 30; i++) {
                        $("#birthday_d").append("<option value=" + i + " label=" + i + ">" + i + "</option>");
                    }
                }else{
                    switch ($("#birthday_d option:last").attr("value")){
                        case "28":$("#birthday_d").append("<option value=" + 29 + " >" + 29 + "</option>");
                        case "29":$("#birthday_d").append("<option value=" + 30 + " >" + 30 + "</option>");
                        case "31":$("#birthday_d option[value='31']").remove();
                            break;
                        default :break;

                    }
                }
                break;
                case "2":
                    if(birth_day==""){
                        if((birth_year%4==0 && birth_year%100!=0) || (birth_year%400==0)){
                            for(var i=1;i<=29;i++){
                                $("#birthday_d").append("<option value="+i+" label="+i+">"+i+"</option>");
                            }
                        }else{
                            for(var i=1;i<=28;i++){
                                $("#birthday_d").append("<option value="+i+" label="+i+">"+i+"</option>");
                            }
                        }}else{
                        $("#birthday_d option[value='31']").remove();
                        $("#birthday_d option[value='30']").remove();
                        if((birth_year%4==0 && birth_year%100!=0) || (birth_year%400==0)){

                        }else{
                            $("#birthday_d option[value='29']").remove();
                        }
                    }
                    break;
                default :break;
            }


        }
        checkBirthday();
    });

    $('#birthday_d').change(function() {
            checkBirthday();
        }
    );
    $('#birthday_d').focus(
        function(){
            if($('#birthday_m').val()==""){
                $("#birthday_d").empty();
                $("#birthday_d").append("<option value='' ></option>");
            }
        }
    );

    //根据后台提供的数据，填充用户的值
    var birth_value=$('#birth').val();
    if(birth_value!="") {
        var date1 = new Date(birth_value);
        var b_year=date1.getFullYear();
        var b_month=date1.getMonth()+1;
        var b_day=date1.getDate();
        $("#birthday_y").find("option[value='"+b_year+"']").attr("selected","selected");
        if($('#birthday_y').val()!="") {
            for (var i = 1; i <= 12; i++) {
                $("#birthday_m").append("<option value=" + i + " label=" + i + ">" + i + "</option>");
            }
        }
        $("#birthday_m").find("option[value='"+b_month+"']").attr("selected","selected");
        switch (b_month){
            case 1:case 3:case 5:case 7:case 8:case 10:case 12:
            for (var i = 1; i <= 31; i++) {
                $("#birthday_d").append("<option value=" + i + " label=" + i + ">" + i + "</option>");
            }
            break;
            case 4:case 6:case 9: case 11:

            $("#birthday_d").append("<option value='' ></option>");
            for (var i = 1; i <= 30; i++) {
                $("#birthday_d").append("<option value=" + i + " label=" + i + ">" + i + "</option>");
            }
            break;
            case 2:
                if((b_year%4==0 && b_year%100!=0) || (b_year%400==0)){
                    for(var i=1;i<=29;i++){
                        $("#birthday_d").append("<option value="+i+" label="+i+">"+i+"</option>");
                    }
                }else{
                    for(var i=1;i<=28;i++){
                        $("#birthday_d").append("<option value="+i+" label="+i+">"+i+"</option>");
                    }
                }
                break;
            default :break;
        }
        $("#birthday_d").find("option[value='"+b_day+"']").attr("selected","selected");
    }

    //验证生日是否输入完整
    function checkBirthday(){
        var b_year= $('#birthday_y').val();
        var b_month=$('#birthday_m').val();
        var b_day=$('#birthday_d').val();
        if(b_year!=""&&b_month!=""&&b_day!=""){
            $('#birth').val(b_year+"-"+b_month+"-"+b_day);
            $('#birth_error_info').addClass("hidden");
        }else{
            $('#birth').val("");
            $('#birth_error_info').removeClass("hidden");
        }
    }



    </script>
  <script type="text/javascript">
      addressInit('Select1', 'Select2', 'Select3'); //必须写，不然如法实现

      $("#Select3").change(function () {
          var a = $("#Select1 option:selected").val();
          var b = $("#Select2 option:selected").val();
          var c = $("#Select3 option:selected").val();
          $("input[name='address']").val(a + b + c);
      })
  </script>
</body>
</html>