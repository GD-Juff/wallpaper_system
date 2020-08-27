<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/page.js"></script>
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/demo.css" rel="stylesheet" type="text/css"/>
    <style>
        .stage {
            position: absolute;
            left: 0%;
            top: 0%;
            width: 1920px;
            height: 1024px;
            background: black;
            opacity: 0.5
        }
    </style>
    <title>管理员登录</title>
    <!-- 判断非空用户 -->
    <script type="text/javascript">
        function check() {
            var account = document.getElementById("adminname").value;
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
<canvas class="stage"></canvas>
<div style="position: absolute;z-index: 1;">
    <canvas id="canvas_app" class="first"></canvas>
</div>
<form action="${pageContext.request.contextPath}/adminuser/adminlogin.action"
      method="post" id="registform" onsubmit="return check()">
    <div class='login' style="position: absolute;z-index: 10;">
        <div class='login_title'>
            <span><h3>管理员登录</h3></span>
            <font color="red">${errormsg}</font>
        </div>

        <div class='login_fields'>
            <div class='icon'></div>
            <table>
                <tr>

                    <td style="position:relative;top:10px">
                        <img alt="" src='${pageContext.request.contextPath}/img/user_icon_copy.svg'
                             style="position:relative;top:-5px ;left:33px">
                        <input type="text" name="adminname" id="adminname" placeholder='账号'
                               style="position:relative;top:-34px ;left:-3px">
                        <span id="username_span"></span>
                    </td>
                </tr>
                <div class='validation'>
                    <img alt="" src='${pageContext.request.contextPath}/img/tick.png'>
                </div>
                <div class="login_fields__password">
                    <div class="icon"></div>
                    <tr>
                        <td>
                            <img alt="" src='${pageContext.request.contextPath}/img/lock_icon_copy.svg'
                                 style="position:relative;bottom:20px ;left:33px">
                            <input type="password" name="password" id="password" placeholder='密码'
                                   style="position:relative;bottom:49px ;left:-3px">
                        </td>
                    </tr>
                </div>
            </table>
            <div class='login_fields__submit' style="position:relative;top:-35px ;left:-5px">
                <input type='submit' value='登录'>
                <a href="${pageContext.request.contextPath}/index.jsp">用户登录</a>
            </div>
        </div>
    </div>
</form>
</body>


<!-- 这里canvas绘画盒子需要先设置在前，然后script设置在后，位置不可变换！ -->
<script>
    (function (win, el) {
        var cvs = document.querySelector(el),
            ctx = cvs.getContext("2d"),
            width,
            height,
            mouse = {},
            scale = 1,
            min_scale = 1,
            max_scale = 2.5,
            isMouseDown = false,
            radius = 50,
            circlesNum = 10,
            circles = [];

        Function.prototype.method = function (k, v) {
            return this.prototype[k] = v, this;
        };

        function Circle(x, y, center, radius) {
            this.x = x;
            this.y = y;
            this.curX = x;
            this.curY = y;
            this.center = center;
            this.speed = 0.01 + Math.random() * 0.04;
            this.angle = 0;
            this.color = "hsl(" + Math.random() * 360 + ",100%,50%)";
            this.lineWidth = 1;
            this.targetWidth = 5;
            this.radius = radius;
        }

        Circle.method("draw", function (ctx, zoom) {
            var x = this.x, y = this.y;
            this.angle += this.speed;

            this.curX += (this.center.x - this.curX) * this.speed;
            this.curY += (this.center.y - this.curY) * this.speed;


            this.x = this.curX + Math.cos(this.angle) * this.radius * zoom;
            this.y = this.curY + Math.sin(this.angle) * this.radius * zoom;
            this.lineWidth += (this.targetWidth - this.lineWidth) * 0.05;

            if (Math.abs(this.targetWidth - this.lineWidth) < 0.5) {
                this.targetWidth = 1 + Math.random() * 6;
            }

            ctx.strokeStyle = this.color;
            ctx.lineWidth = this.lineWidth;


            ctx.beginPath();
            ctx.moveTo(x, y)
            ctx.lineTo(this.x, this.y);

            ctx.stroke();

        });

        function init() {
            var bound = cvs.getBoundingClientRect(), i = circlesNum, segment = i * 10;
            cvs.width = width = bound.width;
            cvs.height = height = bound.height;

            ctx.fillStyle = "rgba(0,0,0,.05)";
            ctx.lineCap = "round";

            mouse.x = width / 2;
            mouse.y = height / 2;

            while (i--)
                circles[i] = new Circle(0, 0, mouse, radius + Math.random() * segment);

            cvs.addEventListener("mousemove", function (e) {
                mouse.x = e.clientX;
                mouse.y = e.clientY;
            }, false);

            cvs.addEventListener("mousedown", function () {
                isMouseDown = true;
            }, false);

            cvs.addEventListener("mouseup", function () {
                isMouseDown = false;
            }, false);
            cvs.addEventListener("mouseout", function () {
                isMouseDown = false;
            }, false);

            render();
        }

        function render() {
            var i = circlesNum;
            scale += isMouseDown ? (max_scale - scale) * 0.05 : (min_scale - scale) * 0.05;
            ctx.fillRect(0, 0, width, height);

            while (i--)
                circles[i].draw(ctx, scale);

            requestAnimationFrame(render);

        }

        init();

    })(this, ".stage");
</script>
</html>
