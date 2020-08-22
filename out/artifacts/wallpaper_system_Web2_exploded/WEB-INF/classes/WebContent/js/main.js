  window.onload = function() {
            var obtn = document.getElementById('btn');
            var timer = null;
            var isTop = true;
            //获取页面的可视窗口高度
            var clientHeight = document.documentElement.clientHeight || document.body.clientHeight;

            //滚动条滚动时触发
            window.onscroll = function() {
                //在滚动的时候增加判断
                var osTop = document.documentElement.scrollTop || document.body.scrollTop;
                if (osTop >= clientHeight) {
                    obtn.style.display = 'block';
                } else {
                    obtn.style.display = 'none';
                }

                if (!isTop) {
                    clearInterval(timer);
                }
                isTop = false;
            };


            btn.onclick = function() {

                //设置定时器
                timer = setInterval(function() {
                    //获取滚动条距离顶部的高度
                    var osTop = document.documentElement.scrollTop || document.body.scrollTop; //同时兼容了ie和Chrome浏览器

                    //减小的速度
                    var isSpeed = Math.floor(-osTop / 6);
                    document.documentElement.scrollTop = document.body.scrollTop = osTop + isSpeed;
                    //console.log( osTop + isSpeed);

                    isTop = true;

                    //判断，然后清除定时器
                    if (osTop == 0) {
                        clearInterval(timer);
                    }
                }, 66);
            };
        }
  
  
  
  
  
  
  
  
  
  function showPic(e,sUrl){ 
      var x,y; 
      x = e.clientX; 
      y = e.clientY; 
      document.getElementById("Layer1").style.left = x+2+'px'; 
      document.getElementById("Layer1").style.top = y+2+'px'; 
      document.getElementById("Layer1").innerHTML = "<img border='0' src=\"" + sUrl + "\">"; 
      document.getElementById("Layer1").style.display = ""; 
      } 
      function hiddenPic(){ 
      document.getElementById("Layer1").innerHTML = ""; 
      document.getElementById("Layer1").style.display = "none"; 
  } 