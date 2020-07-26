<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="pagePath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>人事管理系统——添加文档</title>
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
				var formData = new FormData($('#fm')[0]);
				var index = layer.load(1,{shade:0.3});
				$.ajax({
					type: 'post',
					url: '<%=request.getContextPath() %>/document/upload',
					data: formData,
					cache: false,//cache作用：是否在缓存中读取数据的读取
					processData: false,//processData 默认为true，当设置为true的时候,提交的时候不会序列化data，而是直接使用data
					contentType: false,
				}).success(function (data) {
					if (data.code != 200) {
						layer.close(index);
						layer.msg(data.msg, {icon: 5});
						return;
					}
					layer.close(index);
					layer.msg('data.msg', {icon: 6, time: 2000},
							function(){
								location.href = "<%=request.getContextPath()%>/document/toShow";
					});
				})
			}
		});

		$().ready(function(){
			$("#fm").validate({
				rules : {
					file : {
						required:true,
						remote: {
							url: "<%=request.getContextPath()%>/document/findDocumentByTitle",     //后台处理程序
							type: "post",               //数据发送方式
							dataType: "json",           //接受数据格式
							data: {                     //要传递的数据
								fileName: function() {
									return $("#file").val();
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
					},
					title : {
						required:true
					}
				},
				messages:{
					file : {
						required:"请输入文件名",
						remote: "文件名已存在"
					},
					remark : {
						required:"请输入详细信息",
					},
					title : {
						required:"请输入标题"
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
		<td class="main_locbg font2"><img src="${pagePath}/res/images/pointer.gif">&nbsp;当前位置：文档管理&nbsp;&gt;&nbsp;上传文档</td>
		<td width="15" height="32"><img src="${pagePath}/res/images/main_locright.gif" width="15" height="32"></td>
	</tr>
</table>
<form id = "fm" action="${pagePath}/document/upload" enctype="multipart/form-data" method="post">
	<table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
		<tr>
			<td class="font3 fftd">
				<table>
					<tr>
						<td class="font3 fftd">文件名称：<input type="file" name="file" size="20" /></td>
					</tr>
					<tr>
						<td class="font3 fftd">标&nbsp;题：<input type="text" name="title" id="title" size="20" /></td>
					</tr>
					<tr>
						<td class="font3 fftd">详细描述：<input type="text" name="remark" id="remark" size="20" /></td>
					</tr>
					<tr>
						<td class="font3 fftd"><input type="submit" value="上传"> <input type="reset" value="重置"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
<div style="height: 10px;"></div>
</body>
</html>

