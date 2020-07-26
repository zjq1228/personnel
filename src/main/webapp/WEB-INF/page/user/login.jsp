<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆</title>
<script src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src = "<%=request.getContextPath()%>/res/layer/layer.js"></script>
<style>
body {
  background: radial-gradient(200% 100% at bottom center, #f7f7b6, #e96f92, #75517d, #1b2947);
  background: radial-gradient(220% 105% at top center, #1b2947 10%, #75517d 40%, #e96f92 65%, #f7f7b6);
  background-attachment: fixed;
  overflow: hidden;
}

@keyframes rotate {
  0% {
    transform: perspective(400px) rotateZ(20deg) rotateX(-40deg) rotateY(0);
  }
  100% {
    transform: perspective(400px) rotateZ(20deg) rotateX(-40deg) rotateY(-360deg);
  }
}
.stars {
  transform: perspective(500px);
  transform-style: preserve-3d;
  position: absolute;
  bottom: 0;
  perspective-origin: 50% 100%;
  left: 50%;
  animation: rotate 90s infinite linear;
}

.star {
  width: 2px;
  height: 2px;
  background: #F7F7B6;
  position: absolute;
  top: 0;
  left: 0;
  transform-origin: 0 0 -300px;
  transform: translate3d(0, 0, -300px);
  backface-visibility: hidden;
}
.table{
	width: 400px;
	height: 350px;
	margin: 80px auto;
}
.table form{
	width: 100%;
}
.table .username{
	width: 280px;
	margin: 20px auto 30px auto;
	display: block;
	height: 30px;
	border-radius: 20px;
	border: none;
	background: rgba(0,0,0,0.2);
	text-indent: 0.5em;
}
.table .password{
  width: 280px;
  margin: 20px auto 30px auto;
  display: block;
  height: 30px;
  border-radius: 20px;
  border: none;
  background: rgba(0,0,0,0.2);
  text-indent: 0.5em;
}
.table .btn{
	width: 100px;
	height: 30px;
	background: rgba(0,0,0,0.1);
	border-radius: 8px;
	border: none;
	color: white;
	margin: 0 auto;
	display: block;
}

</style>
</head>
<body>
<div class="stars"></div> 
<div class="table">
<!-- background: url(E:\\upload\\‪pinn.png) no-repeat;
background-size: 100%;opacity: 0.5; -->
	<div style="width: 100%;height: 200px;"></div>
		<form action="#" method="post" id="fm">
			<input type="text" name="username" class="username" placeholder="请输入用户名" />
			
			<input type="text" name="password" class="password" placeholder="请输入密码" />
			
			<input type="button" class="btn" value="登录" onclick="login()"/>
		</form>
	</div>
<script>
$(document).ready(function(){
  var stars=1000;  /*星星的密集程度，数字越大越多*/
  var $stars=$(".stars");
  var r=700;   /*星星的看起来的距离,值越大越远,可自行调制到自己满意的样子*/
  for(var i=0;i<stars;i++){
    var $star=$("<div/>").addClass("star");
    $stars.append($star);
  }
  $(".star").each(function(){
    var cur=$(this);
    var s=0.2+(Math.random()*1);
    var curR=r+(Math.random()*300);
    cur.css({ 
      transformOrigin:"0 0 "+curR+"px",
      transform:" translate3d(0,0,-"+curR+"px) rotateY("+(Math.random()*360)+"deg) rotateX("+(Math.random()*-50)+"deg) scale("+s+","+s+")"
       
    })
  })
})
//判断当前窗口路径与加载路径是否一致。
if(window.top.document.URL != document.URL){
//将窗口路径与加载路径同步
window.top.location = document.URL;
}

function login() {
	var index = layer.load(1, {shade: 0.3});
	$.post("<%=request.getContextPath()%>/user/login",
			$("#fm").serialize(),
			function (data) {
				if (data.code != 200) {
					alert(data.msg);
					layer.close(index);
					return;
				}
				layer.msg('登陆成功，欢迎！', {icon: 6, time: 2000},
						function () {
							layer.close(index);
							parent.location.href = "<%=request.getContextPath()%>/index/toIndex";
						});
			})
}
</script>
</body>

</html>