
// 判断是否填写上传人并已选择上传文件
function check(){
    var pic_name = document.getElementById("pic_name").value;
    var pic_content = document.getElementById("pic_content").value;
    var pic_src = document.getElementById("uploadfile").value;
    if(pic_name==""){
        alert("请填写照片名");
        return false;
    }
    if(pic_src==""){
        alert("请上传壁纸");
        return false;
    }
    if(pic_content==""){
        alert("请填写壁纸描述");
        return false;
    }
   
    return true;
}



$(function(){  
    $("#uploadfile").change(function(){  
        if($.support.msie){  
            $("#img1").attr("src",$(this).val())   
        }else{ 
            var objUrl=getObjectURL(this.files[0]);  
            console.log("objUrl="+objUrl);  
            if(objUrl){  
                $("#img1").attr("src",objUrl);  
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

	




