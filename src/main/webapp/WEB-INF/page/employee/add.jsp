<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="pagePath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>人事管理系统——添加员工</title>
	<link type="text/css" rel="stylesheet" href="${pagePath}/res/css/css.css" />
	<link type="text/css" rel="stylesheet" href="${pagePath}/res/js/ligerUI/skins/Aqua/css/ligerui-dialog.css" />
	<link type="text/css" rel="stylesheet" href="${pagePath}/res/js/ligerUI/skins/ligerui-icons.css" />
	<link type="text/css" rel="stylesheet" href="${pagePath}/res/css/pager.css" />
	<script type="text/javascript" src="${pagePath}/res/js/jquery-1.11.0.js"></script>
	<script type="text/javascript" src="${pagePath}/res/js/jquery-migrate-1.2.1.js"></script>
	<script type="text/javascript" src="${pagePath}/res/js/ligerUI/js/core/base.js"></script>
	<script type="text/javascript" src="${pagePath}/res/js/ligerUI/js/plugins/ligerDrag.js"></script>
	<script type="text/javascript" src="${pagePath}/res/js/ligerUI/js/plugins/ligerDialog.js"></script>
	<script type="text/javascript" src="${pagePath}/res/js/ligerUI/js/plugins/ligerResizable.js"></script>
	<script type="text/javascript" src="${pagePath}/res/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/res/layer/layer.js"></script>
	<script type="text/javascript" src = "<%=request.getContextPath()%>/res/validate/jquery.validate.min.js"></script>
	<script type="text/javascript" src = "<%=request.getContextPath()%>/res/validate/messages_zh.js"></script>
	<script type="text/javascript">
		$.validator.setDefaults({
			submitHandler: function() {
				var index = layer.load(1,{shade:0.3});
				$.post("<%=request.getContextPath()%>/employee/",
						$("#fm").serialize(),
						function(data){
							if(data.code != 200){
								layer.msg(data.msg, {icon: 5});
								layer.close(index);
								return;
							}
							layer.msg(data.msg, {
								icon: 6,
								time: 2000 //2秒关闭（如果不配置，默认是3秒）
							}, function(){
								layer.close(index);
								parent.window.location.href="<%=request.getContextPath()%>/employee/toShow";
							});

						})
			}
		});

		$().ready(function(){
			$("#fm").validate({
				rules : {
					name : {
						required:true,
						remote: {
							url: "<%=request.getContextPath() %>/employee/findEmployeeByName",     //后台处理程序
							type: "post",               //数据发送方式
							dataType: "json",           //接受数据格式
							data: {                     //要传递的数据
								name: function() {
									return $("#name").val();
								}
							},
							dataType : "json",
							dataFilter:function(data,type){
								if(data == "true"){
									return true;
								}else{
									return false;
								}
							}
						}
					}
				},
				cardId : {
					required:true,
				},
				sex : {
					required:true,
				},
				jobId : {
					required:true,
				},
				education : {
					required:true,
				},
				email : {
					required:true,
				},
				mobile : {
					required:true,
				},
				qq : {
					required:true,
				},
				address : {
					required:true,
				},
				speciality : {
					required:true,
				},
				departmentId : {
					required:true,
				},
				messages:{
					name : {
						required:"请输入姓名",
						remote: "姓名已存在"
					},
					cardId : {
						required:"详细信息不能为空"
					},
					sex : {
						required:"详细信息不能为空"
					},
					education : {
						required:"详细信息不能为空"
					},
					email : {
						required:"详细信息不能为空"
					},
					mobile : {
						required:"详细信息不能为空"
					},
					qq : {
						required:"详细信息不能为空"
					},
					address : {
						required:"详细信息不能为空"
					},
					speciality : {
						required:"详细信息不能为空"
					},
					departmentId : {
						required:"详细信息不能为空"
					},


				}
			})
		})
	</script>
	<style>
		.error{
			color: #ff0084;
		}
	</style>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="10"></td>
	</tr>
	<tr>
		<td width="15" height="32"><img src="${pagePath}/res/images/main_locleft.gif" width="15" height="32"></td>
		<td class="main_locbg font2"><img src="${pagePath}/res/images/pointer.gif">&nbsp;当前位置：员工管理&nbsp;&gt;&nbsp;添加员工</td>
		<td width="15" height="32"><img src="${pagePath}/res/images/main_locright.gif" width="15" height="32"></td>
	</tr>
</table>
<table width="100%" height="90%" border="0" cellpadding="5" cellspacing="0" class="right">
	<tr valign="top">
		<td>
		</td>
	</tr>
</table>
<div style="height: 10px;"></div>
<form id = "fm">

	<table width="100%" border="0" cellpadding="0" cellspacing="10" class="right">
		<tr>
			<td class="font3 fftd">
				<table>
					<tr>
						<td class="font3 fftd">姓名：<input type="text" name="name"  size="20" /></td>
						<td class="font3 fftd">身份证号码：<input type="text" name="cardId" id="cardId" size="20" /></td>
					</tr>
					<tr>
						<td class="font3 fftd">性别： <select id="sex" name="sex" style="width: 143px;">
							<option value="">--请选择性别--</option>
							<option value="1">男</option>
							<option value="0">女</option>
						</select></td>
						<td class="font3 fftd">职&nbsp;&nbsp;&nbsp;位： <select id="jobId" name="jobId" style="width: 143px;">
							<option value="">--请选择职位--</option>
							<option value="1">职员</option>
							<option value="2">Java开发工程师</option>
							<option value="3">Java中级开发工程师</option>
							<option value="4">Java高级开发工程师</option>
							<option value="5">系统管理员</option>
							<option value="6">架构师</option>
							<option value="7">主管</option>
							<option value="8">经理</option>
							<option value="9">总经理</option>
							<option value="10">清洁工</option>
						</select>
						</td>
					</tr>
					<tr>
						<td class="font3 fftd">学历：<input name="education" id="education" size="20" /></td>
						<td class="font3 fftd">邮&nbsp;&nbsp;&nbsp;箱：<input name="email" id="email" size="20" /></td>
					</tr>
					<tr>
						<td class="font3 fftd">手机：<input name="mobile" id="mobile" size="20" /></td>
					</tr>

				</table>
			</td>
		</tr>
		<tr>
			<td class="main_tdbor"></td>
		</tr>

		<tr>
			<td class="font3 fftd">联系地址：<input name="address" id="address" size="40" /></td>
		</tr>
		<tr>
			<td class="right"></td>
		</tr>
		<tr>
			<td class="main_tdbor"></td>
		</tr>
		<tr>
			<td class="font3 fftd">特长：<input name="speciality" id="speciality" size="40" /></td>
		</tr>
		<tr>
			<td class="main_tdbor"></td>
		</tr>
		<tr>
			<td class="font3 fftd">所属部门： <select id="departmentId" name="departmentId" style="width: 100px;">
				<option value="">--请选择部门--</option>
				<option value="1">技术部</option>
				<option value="2">运营部</option>
				<option value="3">财务部</option>
				<option value="4">总公办</option>
				<option value="5">市场部</option>
				<option value="6">教学部</option>
				<option value="7"> 测试部门</option>
			</select>
			</td>
		</tr>
		<tr>
			<td class="right"></td>
		</tr>
		<tr>
			<td align="left" class="fftd"><input type="submit" value="添加">&nbsp;&nbsp;<input type="reset" value="清空 "></td>
		</tr>
	</table>
</form>
</body>
</html>