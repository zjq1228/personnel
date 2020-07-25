
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src = "<%=request.getContextPath()%>/res/js/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/res/css/shutter.css">
<script type="text/javascript">

</script>
</head>
<body style="text-align: center"  bgcolor="gray">
<div class="shutter">
	<div class="shutter-img">
		<a href="#" data-shutter-title="Iron Man"><img src="<%=request.getContextPath()%>/res/images/a1.png" alt="#"></a>
		<a href="#" data-shutter-title="Super Man"><img src="<%=request.getContextPath()%>/res/images/a2.png" alt="#"></a>
		<a href="#" data-shutter-title="The Hulk"><img src="<%=request.getContextPath()%>/res/images/a3.png" alt="#"></a>
		<a href="#" data-shutter-title="The your"><img src="<%=request.getContextPath()%>/res/images/a4.png" alt="#"></a>
	</div>
	<ul class="shutter-btn">
		<li class="prev"></li>
		<li class="next"></li>
	</ul>
	<div class="shutter-desc">
		<p>Iron Man</p>
	</div>
</div>
<script src="<%=request.getContextPath()%>/res/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/res/js/velocity.js"></script>
<script src="<%=request.getContextPath()%>/res/js/shutter.js"></script>
<script>
	$(function () {
		$('.shutter').shutter({
			shutterW: 1500, // 容器宽度
			shutterH: 200, // 容器高度
			isAutoPlay: true, // 是否自动播放
			playInterval: 2000, // 自动播放时间
			curDisplay: 3, // 当前显示页
			fullPage: false // 是否全屏展示
		});
	});
</script>
</body>
</html>
