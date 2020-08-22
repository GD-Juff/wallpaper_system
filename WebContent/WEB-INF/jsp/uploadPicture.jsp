<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/uploadPicture.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadPicture.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/page.js"></script>

    <title>上传壁纸</title>
    <!-- 显示剩余数字 -->
    <script type="text/javascript">
        $(document).ready(function () {
            var limitNum = 30;
            var pattern = '还可以输入' + limitNum + '字符';
            $('#text-count').html(pattern);
            "WebContent/WEB-INF/jsp/uploadPicture.jsp"
            $('#pic_content').keyup(
                function () {
                    var remain = $(this).val().length;
                    if (remain > 30) {
                        pattern = "字数超过限制！";
                    } else {
                        var result = limitNum - remain;
                        pattern = '还可以输入' + result + '字符';
                    }
                    $('#text-count').html(pattern);
                }
            );
        });
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
</head>
<body style="background-image: url(../img/bg5.jpg);">
<div class="uploadpicture">
    <form action="${pageContext.request.contextPath }/picture/upload.action"
          method="post" enctype="multipart/form-data" onsubmit="return check()">
        <p style="color: white;text-align:center;  font-size: 180%;font-family: '仿宋';font-weight: bold;">上传壁纸</p>
        <div>
            <p style="color:white;">
                壁纸名称：
                <input type="text" maxlength="11" name="pic_name" id="pic_name">

                选择分类：
                <select name="pic_type" id="status">
                    <option value="风景">风景</option>
                    <option value="明星">明星</option>
                    <option value="卡通">卡通</option>
                    <option value="动物">动物</option>
                    <option value="影视">影视</option>
                    <option value="游戏">游戏</option>
                    <option value="名车">名车</option>
                </select>
            </p>
            <p>
                <input type="hidden" name="account" value="${currentUser.account}">
            </p>

            <div class='uploadpic'>
			        	<span class="uploadbutton">
	    					<button>选择本地文件</button>
	    					<input id="uploadfile" type="file" name="uploadfile" accept="image/*"
                                   onchange="picType(this)">
                            <!--<input id="uploadfile" type="file" name="uploadfile"  multiple="multiple" accept="image/*">-->
	    				</span>
            </div>
            <IMG id="img1" height=250 width=460 src="" style="position:relative;top:10px;"><br/>
            <p>
                壁纸描述：
            </p>

            <textarea id="pic_content" name="pic_content" maxlength="30" placeholder='最短不少于5个字符,最长不超过30个字符'
                      cols="30" rows="5"
                      style="width: 452px; height: 100px;resize: none;font-family: '宋体';font-size: 90%;"></textarea>

            <span id="text-count" style="float:right;color:white;font-size: 85%;"></span>
            <div class='login_fields__submit'>

                <input type="submit" value="上传">
                <input type="button" value="返回" style="position:relative;left:30px"
                       onclick="window.location.href='../picture/findpicture.action'">
            </div>
        </div>
    </form>
</div>
</body>


</html>


