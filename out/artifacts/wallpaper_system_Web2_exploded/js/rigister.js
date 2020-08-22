$(function(){  
		    $("#uploadfile").change(function(){  
		        if($.support.msie){  
		            $("#img2").attr("src",$(this).val()) 
		        }else{ 
		            var objUrl=getObjectURL(this.files[0]);  
		            console.log("objUrl="+objUrl);  
		            if(objUrl){  
		                $("#img2").attr("src",objUrl);  
		            }  
		        }  
		    })  
		    //建立一個可存取到該file的url  
		    function getObjectURL(file) {  
		        var url = null ;   
		        if (window.createObjectURL!=undefined) {  
		            url = window.createObjectURL(file) ;  
		        } else if (window.URL!=undefined) {   
		            url = window.URL.createObjectURL(file) ;  
		        } else if (window.webkitURL!=undefined) {   
		            url = window.webkitURL.createObjectURL(file) ;  
		        }  
		        return url ;  
		    }  
		})


// 判断是否填写上传人并已选择上传文件
function check1(){
    var username = $("#username").val();
    var password = $("#password").val();
    var pwd2 = $("#password2").val();
    var checkname = $("#remind").text();
    if(username==""){
        alert("请填写用户名");
        return false;
    }
    if(password==""){
        alert("请填写密码");
        return false;
    }
    if(password!=pwd2)
     {
       $("#error").html("<font  color='red'>两次密码不相同</font>");
       return false;
     }
    if(checkname != ""){
    	alert("用户名已被注册，请更换用户名！");
    	return false;
    }
    return true;
}







		