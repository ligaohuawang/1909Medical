<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/11/13
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="<%=request.getContextPath()+"/"%>">
    <title>Title</title>
</head>
<body>
<form method="post" action="user/login">
    昵称<input type="text" name="nicknane"><br>
    密码：<input type="password" name="upassword"><br>
    <input type="submit" value="登录">
</form>
</body>
</html>
