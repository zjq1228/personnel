<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>\res\css\jq22-demo.css">
	<script type="text/javascript" src = "<%=request.getContextPath()%>/res/layer/layer.js"></script>
	<script type="text/javascript">

		  function reg(){
			  var index = layer.load(2, {shade: 0.3});
			  $.post("<%=request.getContextPath()%>/base/add",
					  $("#fm").serialize(),
					  function(data){
			  	layer.close(index);
				     if(data.code != "200"){
						 parent.layer.msg(data.msg, {icon: 5});
				    	return;
				     }
				  layer.msg('增加成功', {
					  icon: 6,
					  time: 2000 //2秒关闭（如果不配置，默认是3秒）
				  }, function(){
					  parent.location.href="<%=request.getContextPath()%>/base/toShow";
				  });



						});
	}
</script>
</head>
<body>



	<form id="fm">
		<input type="hidden" name="parentId" value="${parentId}"/><br />
		名字<input type="text" name="baseName" /><br />

		<input type="button" value="新增" onclick="reg()" />
	</form>


</body>
</html>