res<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
			$.post("<%=request.getContextPath()%>/job/",
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
							parent.window.location.href="<%=request.getContextPath()%>/job/toShow";
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
						url: "<%=request.getContextPath()%>/job/findJobByName",     //后台处理程序
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
				},
				remark : {
					required:true,
				}
			},
			messages:{
				name : {
					required:"请输入职位名",
					remote: "职位名已存在"
				},
				remark : {
					required:"请输入详细信息",
				}
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
		<td class="main_locbg font2"><img src="${pagePath}/res/images/pointer.gif">&nbsp;当前位置：职位管理&nbsp;&gt;&nbsp;添加职位</td>
		<td width="15" height="32"><img src="${pagePath}/res/images/main_locright.gif" width="15" height="32"></td>
	</tr>
</table>
<form id = "fm">
	<table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
		<tr>
			<td class="font3 fftd">
				<table>
					<tr>
						<td class="font3 fftd">职位名：<input name="name" id="name"  size="20" /></td></br>
						<td class="font3 fftd">详细信息：<input name="remark" id="remark"  size="20" /></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
<div style="height: 10px;"></div>
<input type="submit" value="添加" />
</body>
</html>