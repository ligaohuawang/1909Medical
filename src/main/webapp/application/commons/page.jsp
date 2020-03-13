<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/3/19
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--引入layui的css--%>
    <link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
    <%--layui的js--%>
    <script src="lib/layui/layui.js"></script>
    <script>
        layui.use('laypage', function(){
            var laypage = layui.laypage;

            //执行一个laypage实例
            laypage.render({
                elem: 'page', //注意，这里的 test1 是 ID，不用加 # 号
                count: ${page.total},//数据总数，从服务端得到
                limit:${page.pageSize},    //每页显示的条数
                limits:[1,2,4,6],   //每页显示条数的选择项（下拉列表）
                curr:${page.pageNum},//当前页
                groups:5,  //连续出现的页码
                layout:['count','prev','page','next','refresh','limit','skip'],
                jump: function(obj, first){
                    //obj包含了当前分页的所有参数，比如：
                    //console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                   //console.log(obj.limit); //得到每页显示的条数
                    //首次不执行
                    if(!first){
                        //location.href="${url}?currentPage="+obj.curr+"&pageSize="+obj.limit+"&userName=${userName}";
                        $("#${param.bodyId}").load("${url}?currentPage="+obj.curr+"&pageSize="+obj.limit,${params});
                    }
                }
            });
        });
    </script>
</head>
<body>
<div id="page"></div>
</body>
</html>

