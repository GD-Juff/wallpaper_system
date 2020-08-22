<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <title>登录界面</title>
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/demo.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/page.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <!-- 判断非空 -->
    <script type="text/javascript">
        function check() {
            var account = document.getElementById("account").value;
            var password = document.getElementById("password").value;
            if (account == "") {
                alert("请填写账号");
                return false;
            }
            if (password == "") {
                alert("请填写密码");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div style="position: absolute;z-index: 1;">
    <canvas id="canvas_app" class="first"></canvas>
</div>
<div class='login' style="position: absolute;z-index: 10;">
    <div class='login_title'>
        <span><center><h3>用户登录</h3></center></span>
        <font color="red">${errormsg}</font>
    </div>
    <div class='login_fields'>
        <div class='icon'>
            <img alt="" src='${pageContext.request.contextPath}/img/user_icon_copy.png'>
        </div>
        <form action="${pageContext.request.contextPath}/user/login.action" method="post" onsubmit="return check()">

            <input name="account" id="account" placeholder='账号' maxlength="16" type='text' autocomplete="off"/>
            <div class='validation'>
                <img alt="" src='${pageContext.request.contextPath}/img/tick.png'>
            </div>

            <div class='login_fields__password'>
                <div class='icon'>
                    <img alt="" src='${pageContext.request.contextPath}/img/lock_icon_copy.png'>
                </div>
                <input name="password" id="password" placeholder='密码' maxlength="16" type='password'
                       autocomplete="off"/>
                <div class='validation'>
                    <img alt="" src='${pageContext.request.contextPath}/img/tick.png'>
                </div>
            </div>
            <div class='login_fields__submit'>
                <input type='submit' value='登录'>
                <input type="button" value="注册 " style="position:relative;left:28px;"
                       onclick="window.location.href='${pageContext.request.contextPath}/rigister.jsp'">
                <a href="${pageContext.request.contextPath}/adminLogin.jsp"
                   style="position:relative;left:-30%;top:30px">管理员登录</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>