<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/demo.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/rigister.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/page.js"></script>
    <script>
        function checkname() {
            var username1 = $("#username").val();
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/user/isExistUserName.action",
                data: {"username": username1},
                dataType: "json",
                //contentType:"application/json;charset=utf-8",
                success: function (data) {
                    if ("inexistence" == data.msg) {
                        //alert("抱歉，该用户已被注册，请更换！");
                        $("#remind").html("<font color='red' size='1.5px'>抱歉，该用户已被注册，请更换！</font>");
                    }
                    if ("exist" == data.msg) {
                        $("#remind").html("");
                    }
                }
            });
        }
    </script>
    <script>
        function picType(file) {
            let fileTypes = [".jpg", ".jpeg", ".png"];
            let filePath = file.value;
            if (filePath) {
                let isNext = false;
                let fileEnd = filePath.substring(filePath.indexOf("."));
                for (let i = 0; i < fileTypes.length; i++) {
                    if (fileTypes[i] == fileEnd) {
                        isNext = true;
                        break;
                    }
                }
                if (!isNext) {
                    alert('你上传的是' + fileEnd + '类型的文件,只接受".jpg", ".jpeg", ".png"类型的图片文件');
                    file.value = "";
                    return false;
                }
            } else {
                return false;
            }
        }
    </script>
    <title>注册</title>
</head>
<body>
<div style="position: absolute;z-index: 1;">
    <canvas id="canvas_app" class="first"></canvas>
</div>
<div class='login' style="position: absolute;z-index: 10;">
    <form action="${pageContext.request.contextPath }/user/rigister.action"
          method="post" enctype="multipart/form-data" onsubmit="return check1()">
        <div class='login_title'>
            <img src="" id="img2" class="headpic"
                 alt="" onerror="this.src='${pageContext.request.contextPath}/img/default.jpg'"><br/>

            <span class="uploadbutton">
	    			<span style="font-size:10px;color:white">更换头像</span>
	    			<input id="uploadfile" type="file" name="uploadfile" onchange="picType(this)">
                <!-- <input id="uploadfile" type="file" name="uploadfile"  multiple="multiple"> -->
	    	</span>

        </div>
        <br/>
        <span id="remind"></span>
        <div class='login_fields'>
            <div class='icon'>
                <img alt="" src='${pageContext.request.contextPath}/img/user_icon_copy.png'>
            </div>
            <input name="username" id="username" placeholder='用户名' maxlength="16" type='text'
                   Onblur="checkname()" autocomplete="off"/>

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

                <div class='login_fields__password'>
                    <div class='icon'>
                        <img alt="" src='${pageContext.request.contextPath}/img/lock_icon_copy.png'>
                    </div>
                    <input name="password2" id="password2" placeholder='确认密码' maxlength="16" type='password'
                           autocomplete="off"/>
                    <span id="error"></span>
                </div>

                <div class='login_fields__submit'>

                    <input type='submit' value='注册'>

                    <a href="${pageContext.request.contextPath}/index.jsp">返回登录</a>
                </div>

            </div>
        </div>
    </form>
</div>
</body>
</html>