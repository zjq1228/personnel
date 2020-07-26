
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		*{margin:0;padding:0;list-style-type:none;}
		a,img{border:0;text-decoration:none;}
		body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}

		.subNavBox{width:266px;border:solid 1px #e5e3da;margin:100px auto;}
		.subNav{border-bottom:solid 1px #e5e3da;cursor:pointer;font-weight:bold;font-size:14px;color:#999;line-height:28px;padding-left:10px;background:url(images/jiantou1.jpg) no-repeat;background-position:95% 50%}
		.subNav:hover{color:#277fc2;}
		.currentDd{color:#277fc2}
		.navContent{display: none;border-bottom:solid 1px #e5e3da;}
		.navContent li a{display:block;heighr:28px;text-align:center;font-size:14px;line-height:28px;color:#333}
		.navContent li a:hover{color:#fff;background-color:#277fc2}
	</style>
	<script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
	<script src="<%=request.getContextPath()%>\res\js\fairyDustCursor.js" type="text/javascript"></script>

	<script type="text/javascript">
		$(function(){
			$(".subNav").click(function(){
				$(this).toggleClass("currentDd").siblings(".subNav").removeClass("currentDd");
				$(this).toggleClass("currentDt").siblings(".subNav").removeClass("currentDt");
				$(this).next(".navContent").slideToggle(300).siblings(".navContent").slideUp(500);
			})
		})
	</script>
</head>
<body style="text-align: center"  bgcolor="white">
<span class="container"></span>
<div class="subNavBox">
	<div class="subNav currentDd currentDt">用户中心</div>
	<ul class="navContent " style="display:block">
		<li><a href="<%=request.getContextPath()%>/user/toShow" target="right">&#12288&#12288&#12288&#12288用户展示</a></li>
		<li><a href="<%=request.getContextPath()%>/user/toAdd" target="right">&#12288&#12288&#12288&#12288用户增加</a></li>
		<li><a href="<%=request.getContextPath()%>/base/toShow" target="right">&#12288&#12288&#12288&#12288职员概览</a></li>
		<li><a href="#">&#12288&#12288&#12288&#12288添加连接</a></li>
	</ul>
	<div class="subNav">部门中心</div>
	<ul class="navContent">
		<li><a href="#">&#12288&#12288&#12288&#12288部门增加</a></li>
		<li><a href="#">&#12288&#12288&#12288&#12288部门展示</a></li>
		<li><a href="#">&#12288&#12288&#12288&#12288添加连接</a></li>
		<li><a href="#">&#12288&#12288&#12288&#12288添加连接</a></li>
	</ul>
	<div class="subNav">业务系统</div>
	<ul class="navContent">
		<li><a href="#">&#12288&#12288&#12288&#12288添加连接</a></li>
		<li><a href="#">&#12288&#12288&#12288&#12288添加连接</a></li>
		<li><a href="#">&#12288&#12288&#12288&#12288添加连接</a></li>
	</ul>
	<div class="subNav">留言管理</div>
	<ul class="navContent">
		<li><a href="#">&#12288&#12288&#12288&#12288添加连接</a></li>
		<li><a href="#">&#12288&#12288&#12288&#12288添加连接</a></li>
		<li><a href="#">&#12288&#12288&#12288&#12288添加连接</a></li>
		<li><a href="#">&#12288&#12288&#12288&#12288添加连接</a></li>
		<li><a href="#">&#12288&#12288&#12288&#12288添加连接</a></li>
	</ul>
</div>
<body style="text-align: center"  bgcolor="#CCDDFF">
<br/><br/><br/><br/><br/><br/>
	<a href="<%=request.getContextPath()%>/user/toShow" target="right">用户</a><p>
	<a href="<%=request.getContextPath()%>/department/toShow" target="right">部门管理</a><p>



</body>
</html>
