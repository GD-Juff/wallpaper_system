<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>注册成功账号</title>
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/demo.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/rigister.js"></script>
</head>
<body>
<div class="login">
    <div style="text-align:center;">
        你的账号为：${account.account}<br>
        <P style="color:red; text-align:center;font-size:20px;">请务必记住</P><br>
        <form action="${pageContext.request.contextPath}/user/login.action" method="post">

            <input name="account" id="account" value="${account.account}" maxlength="16" type='text' autocomplete="off"
                   style="opacity:0"/>
            <input name="password" id="password" value="${account.password}" maxlength="16" type='password'
                   autocomplete="off" style="opacity:0"/>
            <div class='login_fields__submit'>
                <input type='submit' value='登录'/>
            </div>
        </form>
    </div>
</div>
</body>
</html>