<%--
  Created by IntelliJ IDEA.
  User: 文沛阳
  Date: 2020/7/23
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>\res\css\jq22-demo.css">
    <script type="text/javascript" src = "<%=request.getContextPath()%>/res/layer/layer.js"></script>
    <script type="text/javascript">
        function upd() {
            var index = layer.load(2, {shade: 0.3});
            $.post(
                "<%=request.getContextPath()%>/user/updateUser",
                $("#frm").serialize(),
                function (result) {
                    layer.close(index);
                    if(result.code != "200"){
                        parent.layer.msg(data.msg, {icon: 5});
                        return;
                    }
                    layer.msg('修改成功', {
                        icon: 6,
                        time: 2000 //2秒关闭（如果不配置，默认是3秒）
                    }, function(){
                        parent.location.reload();
                        return;
                    });
                }
            );
        }
    </script>
</head>
<body style="text-align: center" bgcolor="white">
    <form id="frm">
        <table>
            <tr>
                <td><input type="hidden" name="id" value="${user.id}"></td>
            </tr>
            <tr>
                <td><font color="red">用户名</font></td>
                <td><input type="text" name="username" value="${user.username}"></td>
            </tr>
            <tr>
                <td><font color="red">密码</font></td>
                <td><input type="text" name="password" value="${user.password}"></td>
            </tr>
            <tr>
                <td><font color="red">手机号码</font></td>
                <td><input type="text" name="userPhone" value="${user.userPhone}"></td>
            </tr>
            <tr>
                <td><font color="red">身份证号码</font></td>
                <td><input type="text" name="idCard" value="${user.idCard}"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="button" value="修改" onclick="upd()"></td>
            </tr>
        </table>
    </form>
    <span class="container"></span>
    <script src="<%=request.getContextPath()%>\res\js\snowflakeCursor.js" type="text/javascript"></script>
</body>
</html>
