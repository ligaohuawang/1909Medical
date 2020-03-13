<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2019/10/11
  Time: 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>地址添加</title>
    <base href="<%=request.getContextPath()+"/"%>">
   <%-- <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />--%>
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">

   <%-- <link href="/css/backstyle.css" rel="stylesheet" type="text/css"/>--%>
    <link href="/uploadifive/uploadifive.css"  type="text/css"/>
    <script type="text/javascript" src="js/jsAddress.js"></script>

</head>
<body>
<div class="pd-20">
    <form action="" method="post" class="form form-horizontal" id="form-menu-add">
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>收货人：</label>
            <div class="formControls col-5">
                <input type="hidden" class="input-text" name="addressId" value="${address.addressId}" >
                <input type="text" class="input-text" name="shouhuoren" value="${address.shouhuoren}" >
            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>电话：</label>
            <div class="formControls col-5">
                <input type="text" class="input-text" name="phone" value="${address.phone}" >
            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>地址：</label>
            <div class="formControls col-5">
                 <input type="text" class="input-text" name="addressname" value="${address.addressname}"><br>
                <select id="Select1" class="select1"></select>省
                <select id="Select2" class="select1"></select>市
                <select id="Select3" class="select1"></select>区

            </div>
            <div class="col-4"> </div>
        </div>

        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>详细地址：</label>
            <div class="formControls col-5">
                <input type="text" class="input-text" name="addressdetail"  >
            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl">
            <div class="col-9 col-offset-3">
                <input id="button" class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript" src="lib/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<%--<script type="text/javascript" src="js/form_utils.js"></script>--%>
<script type="text/javascript" src="lib/zTree/v3/js/jquery.ztree.core-3.5.js"></script>
<%--<script type="text/javascript" src="js/menuTree.js"></script>--%>
<script type="text/javascript" src="uploadifive/jquery.uploadifive.js"></script>

<script type="text/javascript">

    $("select[name='pptype']").change(function () {
        alert(1)
        $.ajax({
            type:"GET",
            url:"product/queryPtype",
            data:"pptype="+$(this).val(),
            success:function (data) {
                var res = JSON.parse(data);
                alert(res)
                var json = '';
                var id = $()
                debugger
                res.forEach(function(items) {

                    json += '<option value="'+items.ptname+'">'
                        + items.ptname
                        + '</option>'

                })
                $("select[name='ptype']").html(json);
            }

        })
    })

   /* $("#pic").uploadifive({
        'removeCompleted': true,
        'uploadScript': 'upImg/upImg',
        'onUploadComplete': function (file, data) {
            $("#img").attr("src", "images/" + data);
            $("#img").css({
                "width": "150px",
                "height": "150px"
            });
            $(".ppicture").attr("value", data);
        }
    });*/
    $("#pic").change(function () {

        /*获取文件*/
        var file = $("#pic").get(0).files[0];
        var formData = new FormData();
        formData.append("file",file);
        $.ajax({
            url:"upImg/upPic",
            type:'post',
            data:formData,
            cache:false,
            contentType: false,
            processData: false,
            success:function (result) {
                $("#img").attr("src",result);
                $("input[name='ppicture']").attr("value", result);
            }
        });

    });
$("#button").click(function () {

    $.ajax({
        type:"GET",
        url:"address/updateAddress",
        data:$("form").serialize(),
        success:function (data) {
            if(data.result){
                layer.msg('修改成功', {icon: 6, time: 2000},function () {
                    parent.$("#aaa").click();

                })
            }else {
                layer.msg('修改失败', {icon: 5, time: 2000})
            }
        }
    })
})
    $(function(){
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        $("#form-menu-add").Validform({
            tiptype:2,
            callback:function(form){ // 表单全部验证通过后调用
                submit("menu/updateMenu",form);
                return false; // 不让表单自动提交
            }
        });
    });

</script>

<script type="text/javascript">
    addressInit('Select1', 'Select2', 'Select3'); //必须写，不然如法实现

    $("#Select3").change(function () {
        var a = $("#Select1 option:selected").val();
        var b = $("#Select2 option:selected").val();
        var c = $("#Select3 option:selected").val();
        var d = $("input[name='addressdetail']").val()
        var e = $("input[name='addressname']").val();
        if (e == null || e == '') {

        $("input[name='addressname']").val(a + b + c + d);
    }
    })
    $("input[name='addressdetail']").blur(function () {
        var a =$("input[name='addressname']").val();
        var e = $("#Select1 option:selected").val();
        var b = $("#Select2 option:selected").val();
        var c = $("#Select3 option:selected").val();
        var d = $("input[name='addressdetail']").val()
        if(a == null || a == '' ){
            layer.msg('请填写地址', {icon: 5, time: 2000})
        }else{
            $("input[name='addressname']").val(e+b+c+d);
        }
    })
</script>
</body>
</html>
