<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- 导入c标签 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <script type="text/javascript" src="<%=request.getContextPath() %>/res/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
        function add() {
            $.post("<%=request.getContextPath() %>/department/add",
                $("#fm").serialize(),
                function (data) {
                    if (data.code != "200") {
                        alert(data.msg);
                    } else {
                        alert(data.msg);
                        window.location.href = "<%=request.getContextPath() %>/department/toShow"
                    }
                })
        }
    </script>
</head>
<body style="text-align:center">
<form id="fm">
    部门名称:<input type="text" name="name"/><br/><br/>
    详细描述:<input type="text" name="remark"/><br/><br/>
    <input type="button" value="添加" onclick="add()"/><br>
</form>
</body>
</html>