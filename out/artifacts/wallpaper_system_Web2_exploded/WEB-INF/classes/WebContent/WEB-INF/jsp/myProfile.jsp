<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
</head>
<body>
<div class="list-body">
    <ul class="clearfix">
        <c:forEach items="${myPicture}" var="row">
            <li class="img_li">
                <a class="good-image">
                    <img class=""
                         src="${pageContext.request.contextPath}/upload/${row.pic_src}?imageView2/1/w/500/h/500/q/100">

                </a>
                <span class="good-title">${row.pic_name}</span>
                <p>${row.pic_content}</p>
                <a href="#" class="good-price1">修改</a>
                <a href="#" class="good-price">删除</a>
                <span class="pub-time">时间</span>
            </li>
        </c:forEach>

    </ul>
</div>
</body>
</html>