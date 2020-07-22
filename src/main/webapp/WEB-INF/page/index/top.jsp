<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src = "<%=request.getContextPath()%>/res/js/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(function(){
	setInterval("$('#dateTime').html(new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay()));",1000);
	
})
</script>
</head>
<body style="text-align: center"  bgcolor="#CCDDFF">

	<a href="<%=request.getContextPath()%>/user/out">退出登陆</a>
	

	<marquee><h1 align="center">欢迎登陆 北京点金教育平台，万元高新，尽在点金!</h1></marquee>

	

	<div id="dateTime" align="right"></div>
</body>
</html>