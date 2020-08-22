<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>成图秀</title>
    <meta name="keywords" content="">
    <meta name="description" content="">


    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css?v=0.1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css?v=1.1">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/page.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
</head>
<body>
<div id="header">
    <div class="header-wrap">
        <a class="logo fl">
            <span style="font-size:30px;color:white;">图秀壁纸网</span><br>
        </a>
        <div class="nav-right fr">
            <span id="username" class="username">${currentUser.username}</span>
            <img src="${pageContext.request.contextPath}/head_pic/${currentUser.head_src}" class="headpic" alt=""
                 onerror="this.src='../img/default.jpg'">
            <div class="dropdown-content">
                <ul class="submenu">
                    <li>
                        <center><p>${currentUser.account}在线</p></center>
                        <br></li>
                    <li><a href="${pageContext.request.contextPath}/picture/tomyIndex.action" target="_blank">我的主页</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/user/logout.action?user=${currentUser.account}">退出登陆</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div id="header-bottom">
    <div class="header-bottom-wrap clearfix">
        <form action="${pageContext.request.contextPath}/picture/findpicture.action" method="get">
            <div class="search-wrap fl">
                <div class="search">
                    <input type="text" name="pic_type" class="keywords" placeholder="请输入关键词">
                    <input type="submit" class="search-btn search-normal-btn" value="搜索">
                </div>
            </div>
        </form>
        <div class="publish fr">
            <a href="${pageContext.request.contextPath}/picture/toUpload.action" class="publish-btn"><i
                    class="icon"></i>上传壁纸</a>
        </div>
    </div>
</div>

<div id="main" class="clearfix">
    <div class="category fl">
        <ul>
            <li>
                <a href="../picture/findpicture.action?pic_type=">全部<i class="icon">&#xe600;</i></a>
            </li>

            <li>
                <a href="../picture/findpicture.action?pic_type=风景  ">风景<i class="icon">&#xe600;</i></a>
            </li>

            <li>
                <a href="../picture/findpicture.action?pic_type=明星">明星<i class="icon">&#xe600;</i></a>
            </li>

            <li>
                <a href="../picture/findpicture.action?pic_type=卡通">卡通<i class="icon">&#xe600;</i></a>
            </li>

            <li>
                <a href="../picture/findpicture.action?pic_type=动物">动物<i class="icon">&#xe600;</i></a>
            </li>

            <li>
                <a href="../picture/findpicture.action?pic_type=影视 ">影视<i class="icon">&#xe600;</i></a>
            </li>

            <li>
                <a href="../picture/findpicture.action?pic_type=游戏">游戏<i class="icon">&#xe600;</i></a>
            </li>

            <li>
                <a href="../picture/findpicture.action?pic_type=名车">名车<i class="icon">&#xe600;</i></a>
            </li>
        </ul>
    </div>
    <div class="main-box fl">
        <div class="index-list">
            <div class="list-body">
                <ul class="clearfix">
                    <c:forEach items="${page}" var="row">
                        <li class="img_li">
                            <div class="good-image">
                                <a class="without-caption image-link" style="text-decoration: none; outline: none;"
                                   href="${pageContext.request.contextPath}/upload/${row.pic_src}?imageView2/1/w/500/h/500/q/100">
                                    <img src="${pageContext.request.contextPath}/upload/${row.pic_src}?imageView2/1/w/500/h/500/q/100">
                                </a>
                                <span class="good-title">${row.pic_name}</span>
                                <div class="mask"><br/><br/>
                                    <p>${row.pic_content}</p>
                                </div>
                                <a href="../picture/download.action?filename=${row.pic_src}" class="good-price">下载</a>
                                <span class="pub-time time">时间</span>
                            </div>
                        </li>
                    </c:forEach>

                </ul>
            </div>
            <div id="page"></div>
        </div>
    </div>
</div>
<div id="footer">
    <div class="footer-bottom-wrap">
        <div class="footer-bottom">
            <a class="back-to-top" href="#top" id="btn">
                <img src="../img/timg.gif;" style="width:100px;heigth:100px;border-radius:100%;"></a>
            <p class="column">
                <a href="/service/about">关于我们</a>
                <a href="/service/problem">常见问题</a>
                <a href="/user/help">意见反馈</a>
                <a href="/service/protocol">服务协议</a>
                <a href="/service/contect">联系我们</a>
            </p>
            <p class="tips"></p>
            <p class="right">
                <span></span>　
                <a target="_blank" href=""></a>
                <a class="beian" target="_blank" href="" style="display:inline-block;height:20px;line-height:20px;"></a>
            </p>
        </div>
    </div>
</div>
<script src='${pageContext.request.contextPath}/js/jquery.min.js'></script>
<script src='${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js'></script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
</body>
</html>