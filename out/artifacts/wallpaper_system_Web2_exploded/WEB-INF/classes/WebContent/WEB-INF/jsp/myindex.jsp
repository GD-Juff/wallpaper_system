<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${currentUser.username}的个人主页</title>
    <link type="text/css" rel="stylesheet" href="../css/myindex.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/myindex.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <!-- ajax轮询 -->
    <script>
        setInterval("test()", 1000);

        function test() {
            $.ajax({
                url: '${pageContext.request.contextPath}/UserMessage/receiveMessage.action',
                async: true,
                type: 'get',
                success: function (data) {
                    if (data == "PASS") {
                        alert("你有新的审核通过！请查看我的上传记录");
                        window.location.reload();
                    }
                    //if(data == "DELETE")
                }
            });
        }
    </script>
</head>
<body>
<canvas id="canvas"></canvas>
<canvas id="canv"></canvas>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/page.js"></script>
<div class="div_top"><p style="text-indent:5em">我的主页</p>
    <div class="top_menu">
        <div class="top_1"></div>
        <div class="img_info">
            <div class="imglogo">
                <img style="width:24px;height:24px;border-radius: 2px;position:absolute;top:15%"
                     src="${pageContext.request.contextPath}/head_pic/${currentUser.head_src}"
                     onerror="this.src='../img/default.jpg'" alt="您的头像">
            </div>
            <div class="userinfo">
                <span style="margin-left:0;">${currentUser.account}</span>
            </div>
        </div>
        <div class="shareImg">
            <a href="../picture/findpicture.action"><i
                    style=" background-position: -452px -286px;margin-top:13px;margin-left:10px;"></i></a>
        </div>
        <div class="shareImg">
            <i style=" background-position: -452px -312px;margin-top:13px;margin-left:14px;"></i>
        </div>
    </div>
</div>
<div class="bottom">
    <div class="bottom_info">
        <div class="user_bottom"></div>
        <div class="fabulous"></div>
        <div class="userImg">
            <img style="width:120px;height:120px;border-radius: 10px;margin:4px;"
                 onerror="this.src='../img/default.jpg'"
                 src="${pageContext.request.contextPath}/head_pic/${currentUser.head_src}" alt="您的头像">
        </div>
        <div class="userImg_right">
            <div class="userImg_right_top">
                <span style="margin-left:0;color:black">${currentUser.account}&nbsp;&nbsp;${currentUser.username}</span>
            </div>
            <div class="userImg_right_down"></div>
        </div>
        <div class="info_menu"></div>
        <div class="bottom_block">
            <div class="bottom_left">
                <div class="bottom_left_1">
                    <div class="bottom_left_1_list">
                        <i style="background-position: -192px -104px;"></i>
                        <div id="myIssue">
                            <div class="bottom_left_1_list_text">
                                <a id="aa" style="color:blue"
                                   href="../picture/findMyPicture.action">我的上传</a>
                            </div>
                        </div>
                    </div>
                    <div class="bottom_left_1_list">
                        <i style="background-position: -530px -130px;"></i>
                        <div class="bottom_left_1_list_text">
                            <a href="../picture/findMyReviewPicture.action"
                               style="color:green">我的审核</a>
                        </div>
                    </div>



                </div>
            </div>
            <div class="bottom_middle">
                <div id="bbb" class="context" style="margin-top:0;">
                    <div class="list-body">
                        <ul class="clearfix">
                            <c:forEach items="${myPicture}" var="row">
                                <li class="img_li">
                                    <a class="good-image">
                                        <img class=""
                                             src="${pageContext.request.contextPath}/upload/${row.pic_src}?imageView2/1/w/500/h/500/q/100">
                                    </a>
                                    <span class="good-title" style="position:relative;left:50%;">${row.pic_name}</span>
                                    <div>
                                        <p>${row.pic_content}</p>
                                    </div>
                                    <a href="#" class="good-price" data-toggle="modal" data-target="#pictureEditDialog"
                                       onclick="editPicture(${row.pic_id})"><input type="button" value="修改"></a>
                                    <form id="delete_mypicture" action="">
                                        <input type="hidden" name="pic_id" value="${row.pic_id}">
                                        <input type="hidden" name="pic_src" value="${row.pic_src}">
                                        <a class="good-price1" onclick="deletepicture()"><input type="button"
                                                                                                value="删除"></a>
                                    </form>
                                    <span class="pub-time">时间</span>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer-bottom-wrap">
    <div class="footer-bottom">
        <a class="back-to-top" href="#top" id="btn" style="color:blue">返回顶部</a>
    </div>
</div>
<!-- 修改客户模态框 -->
<div class="modal fade" id="pictureEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改图片信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_picture_form">
                    <input type="hidden" id="edit_cust_id" name="cust_id"/>
                    <div class="form-group">
                        <label for="edit_pictureName" class="col-sm-2 control-label">图片名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_pictureName" placeholder="图片名称"
                                   name="pic_name"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_pictureType" style="float:left;padding:7px 15px 0 27px;">图片类型</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="edit_pictureType" name="pic_type">

                                <option value="明星">明星</option>
                                <option value="卡通">卡通</option>
                                <option value="动物">动物</option>
                                <option value="影视">影视</option>
                                <option value="游戏">游戏</option>
                                <option value="名车">名车</option>
                                <option value="风景">风景</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_pictureContent" class="col-sm-2 control-label">图片描述</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_pictureContent" placeholder="图片描述"
                                   name="pic_content"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_picture" class="col-sm-2 control-label">图片展示</label>
                        <div class="col-sm-10">
                            <img id="edit_picture" src="">
                        </div>
                    </div>
                    <input type="hidden" name="account" value="${currentUser.account}">
                    <input id="findid" type="hidden" name="pic_id" value="">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updateCustomer()">保存修改</button>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    var canvas = document.querySelector('#canvas');
    var ctx = canvas.getContext("2d");
    var starlist = [];

    function init() {
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
    }

    init();
    window.onresize = init;


    canvas.addEventListener('mousemove', function (e) {
        starlist.push(new Star(e.offsetX, e.offsetY));
        console.log(starlist)
    })


    function random(min, max) {
        return Math.floor((max - min) * Math.random() + min);
    }


    function Star(x, y) {
        this.x = x;
        this.y = y;
        this.vx = (Math.random() - 0.5) * 2.5;
        this.vy = (Math.random() - 0.5) * 2.5;
        this.color = 'rgb(' + random(0, 200) + ',' + random(0, 200) + ',' + random(0, 200) + ')';
        this.a = 1;
        console.log(this.color);
        this.draw();
    }

    Star.prototype = {
        draw: function () {
            ctx.beginPath();
            ctx.fillStyle = this.color;
            ctx.globalCompositeOperation = 'lighter'
            ctx.globalAlpha = this.a;
            ctx.arc(this.x, this.y, 30, 0, Math.PI * 2, false);
            ctx.fill();
            this.updata();
        },
        updata() {
            this.x += this.vx;
            this.y += this.vy;
            this.a *= .98;
        }
    }
    console.log(new Star(150, 200));

    function render() {
        ctx.clearRect(0, 0, canvas.width, canvas.height)
        starlist.forEach((item, i) => {
            item.draw();
            if (item.a < 0.05) {
                starlist.splice(i, 1);
            }
        })
        requestAnimationFrame(render);
    }

    render();
</script>
<script>
    //获取修改的图信息
    function editPicture(pic_id1) {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/picture/findIdPicture.action",
            data: {"pic_id": pic_id1},
            success: function (data) {
                var pic_src = "${pageContext.request.contextPath}/upload/";
                pic_src += data.pic_src;
                $("#edit_pictureName").val(data.pic_name);
                $("#edit_pictureType").val(data.pic_type)
                $("#edit_picture").attr('src', pic_src);
                $("#edit_pictureContent").val(data.pic_content);
                $("#findid").attr('value', data.pic_id);
            }
        });
    }

    // 执行修改图片操作
    function updateCustomer() {
        $.post("${pageContext.request.contextPath}/picture/updateMyPicture.action", $("#edit_picture_form").serialize(), function (data) {
            if (data == "OK") {
                alert("图片信息修改成功！请等待审核！");
                window.location.reload();
            } else {
                alert("图片信息更新失败！");
                window.location.reload();
            }
        });
    }
</script>

<script>
    //删除我的图片
    function deletepicture() {
        $.post("${pageContext.request.contextPath}/picture/deleteMyPicture.action", $("#delete_mypicture").serialize(), function (data) {
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