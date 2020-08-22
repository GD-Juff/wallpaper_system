<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>图秀后台管理</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <!-- 引入css样式文件 -->
    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>css/admin/bootstrap.min.css" rel="stylesheet"/>
    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>css/admin/metisMenu.min.css" rel="stylesheet"/>
    <!-- DataTables CSS -->
    <link href="<%=basePath%>css/admin/dataTables.bootstrap.css" rel="stylesheet"/>
    <!-- Custom CSS -->
    <link href="<%=basePath%>css/admin/sb-admin-2.css" rel="stylesheet"/>
    <!-- Custom Fonts -->
    <link href="<%=basePath%>css/admin/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>css/admin/boot-crm.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css">
    </script>
    <
    link
    rel = "stylesheet"
    href = "${pageContext.request.contextPath}/css/index.css" ></script>
    <script>
        function myFunction(dom) {
            var str = dom.innerHTML == "解封" ? "封号" : "解封";
            dom.innerHTML = str;
        }
    </script>
</head>
<body>
<div id="wrapper">
    <!-- 导航栏部分 -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation"
         style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-brand" href="<%=basePath%>customer/list.action">图秀网后台管理系统 v2.0</a>
        </div>
        <!-- 导航栏右侧图标部分 -->
        <ul class="nav navbar-top-links navbar-right">
            <!-- 邮件通知 start -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-envelope fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-messages">
                    <li>
                        <a href="#">
                            <div>
                                <strong>张经理</strong> <span class="pull-right text-muted">
								<em>昨天</em>
							</span>
                            </div>
                            <div>今天晚上开会，讨论一下下个月工作的事...</div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>查看全部消息</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 邮件通知 end -->
            <!-- 任务通知 start -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-tasks fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-tasks">
                    <li>
                        <a href="#">
                            <div>
                                <p>
                                    <strong>任务 1</strong>
                                    <span class="pull-right text-muted">完成40%</span>
                                </p>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-success"
                                         role="progressbar" aria-valuenow="40" aria-valuemin="0"
                                         aria-valuemax="100" style="width: 40%">
                                        <span class="sr-only">完成40%</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <p>
                                    <strong>任务 2</strong>
                                    <span class="pull-right text-muted">完成20%</span>
                                </p>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-info" role="progressbar"
                                         aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
                                         style="width: 20%">
                                        <span class="sr-only">完成20%</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>查看所有任务</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 任务通知 end -->
            <!-- 消息通知 start -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-bell fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-alerts">
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-comment fa-fw"></i> 新回复
                                <span class="pull-right text-muted small">4分钟之前</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-envelope fa-fw"></i> 新消息
                                <span class="pull-right text-muted small">4分钟之前</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-tasks fa-fw"></i> 新任务
                                <span class="pull-right text-muted small">4分钟之前</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-upload fa-fw"></i> 服务器重启
                                <span class="pull-right text-muted small">4分钟之前</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>查看所有提醒</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 消息通知 end -->
            <!-- 用户信息和系统设置 start -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i>
                        用户：${USER_SESSION.user_name}
                    </a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
                    <li class="divider"></li>
                    <li>
                        <a href="${pageContext.request.contextPath }/logout.action">
                            <i class="fa fa-sign-out fa-fw"></i>退出登录
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 用户信息和系统设置结束 -->
        </ul>
        <!-- 左侧显示列表部分 start-->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="查询内容...">
                            <span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
							</button>
						</span>
                        </div>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/adminpicture/reviewPicture.action" class="active">
                            <i class="fa fa-edit fa-fw"></i> 图片审核
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/adminuser/findUser.action">
                            <i class="fa fa-dashboard fa-fw"></i> 用户管理
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 左侧显示列表部分 end-->
    </nav>
    <!-- 客户列表查询部分  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">图秀管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" method="get"
                      action="${pageContext.request.contextPath }/customer/list.action">
                    <div class="form-group">
                        <label for="customerName">客户名称</label>
                        <input type="text" class="form-control" id="customerName"
                               value="${custName }" name="custName"/>
                    </div>
                    <div class="form-group">
                        <label for="customerFrom">客户来源</label>
                        <select class="form-control" id="customerFrom" name="custSource">
                            <option value="">--请选择--</option>
                            <c:forEach items="${fromType}" var="item">
                                <option value="${item.dict_id}"
                                        <c:if test="${item.dict_id == custSource}">selected</c:if>>
                                        ${item.dict_item_name }
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="custIndustry">所属行业</label>
                        <select class="form-control" id="custIndustry" name="custIndustry">
                            <option value="">--请选择--</option>
                            <c:forEach items="${industryType}" var="item">
                                <option value="${item.dict_id}"
                                        <c:if test="${item.dict_id == custIndustry}"> selected</c:if>>
                                        ${item.dict_item_name }
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="custLevel">客户级别</label>
                        <select class="form-control" id="custLevel" name="custLevel">
                            <option value="">--请选择--</option>
                            <c:forEach items="${levelType}" var="item">
                                <option value="${item.dict_id}"
                                        <c:if test="${item.dict_id == custLevel}"> selected</c:if>>
                                        ${item.dict_item_name }
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">查询</button>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">图片审核</div>
                </div>
            </div>
            <table class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>用户账号</th>
                    <th>用户名称</th>
                    <th>用户状态</th>
                    <th>用户头像</th>
                    <th>用户级别</th>
                    <th>固定电话</th>
                    <th>手机</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${resultUser}" var="row">
                    <tr>
                        <td>${row.account}</td>
                        <td>${row.username}</td>
                        <td>${row.userstatus}</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <a class="btn btn-primary btn-xs"
                               href="javascript:void(0)"
                               onclick="lockuser('${row.account}','${row.userstatus}')">冻结/解冻</a>
                            <a href="javascript:void(0)" class="btn btn-danger btn-xs"
                               onclick="deleteUser('${row.account}')">删除</a>

                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="list-body" style="position:absolute;left:20%">
                <ul class="clearfix">
                    <c:forEach items="${Page}" var="row">
                        <li class="img_li">
                            <div class="good-image">
                                <a style="text-decoration: none; outline: none;"
                                   href="${pageContext.request.contextPath}/upload/${row.pic_src}?imageView2/1/w/500/h/500/q/100"
                                   class="without-caption image-link">
                                    <img class=""
                                         src="${pageContext.request.contextPath}/upload/${row.pic_src}?imageView2/1/w/500/h/500/q/100">
                                </a>
                            </div>
                            <span class="good-title" style="position:relative;left:-20%">${row.pic_name}</span>
                            <div class="mask" style="position:relative;top:-12% ;"><br/>
                                <p>${row.pic_content}</p></div>
                            <a href="javascript:void(0)" onclicK="passpicture(${row.pic_id},'${row.account}')"
                               style="position:absolute;left:0%;bottom:0%">通过</a>
                            <a href="javascript:void(0)" onclick="deleteuserpicture(${row.pic_id},'${row.account}')"
                               style="position:absolute;left:15%;bottom:0%">删除</a>
                            <span class="pub-time">时间</span>
                        </li>
                    </c:forEach>

                </ul>
            </div>
        </div>
    </div>
</div>
<script src='${pageContext.request.contextPath}/js/jquery.min.js'></script>
<script src='${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js'></script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
</body>
<script>
    //删除用户
    function deleteUser(account) {
        if (confirm("确定删除该用户吗?")) {
            $.post("${pageContext.request.contextPath}/adminuser/deleteUser.action", {"account": account}, function (data) {
                if (data == "OK") {
                    //alert("用户删除成功！");
                    window.location.reload();
                } else {
                    alert("用户删除失败！");
                    window.location.reload();
                }
            });
        } else {
            return false;
        }
    }
</script>
<script>
    //封锁用户
    function lockuser(account, userstatus) {
        if (userstatus == "正常") {
            userstatus1 = "1";
        } else {
            userstatus1 = "0";
        }
        $.post("${pageContext.request.contextPath}/adminuser/userManagement.action", {
            "userstatus": userstatus1,
            "account": account
        }, function (data) {
            if (data == "OK") {
                //alert("封锁成功！");
                window.location.reload();

            } else {
                alert("操作失败！");
                window.location.reload();
            }
        });
    }
</script>
<script>
    //通过用户的图片
    function passpicture(pic_id, account) {
        $.post("${pageContext.request.contextPath}/adminpicture/setPic_status.action", {
            "pic_id": pic_id,
            "account": account
        }, function (data) {
            if (data == "OK") {
                //alert("图片删除成功！");
                window.location.reload();
            } else {
                alert("图片通过失败！");
                window.location.reload();
            }
        });
    }
</script>
<script>
    //删除用户的图片
    function deleteuserpicture(pic_id, account) {
        $.post("${pageContext.request.contextPath}/adminpicture/deleteUserPicture.action", {
            "pic_id": pic_id,
            "account": account
        }, function (data) {
            if (data == "OK") {
                //alert("图片删除成功！");
                window.location.reload();
            } else {
                alert("图片删除失败！");
                window.location.reload();
            }
        });
    }
</script>
</html>