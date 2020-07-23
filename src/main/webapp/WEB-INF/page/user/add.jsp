<%--
  Created by IntelliJ IDEA.
  User: dj
  Date: 2020/7/23
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
        function add() {
            $.post(
                "/user/addUser",
                $("#frm").serialize(),
                function (result) {
                    window.location.href = "/user/toShow";
                }
            );
        }
    </script>
</head>
<body>
    <form id="frm">
        <table>
            <tr>
                <td>用户名</td>
                <td><input type="text" name="username"></td>
            </tr>
            <tr>
                <td>密码</td>
                <td><input type="text" name="password"></td>
            </tr>
            <tr>
                <td>状态</td>
                <td><input type="text" name="status" value="1"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="button" value="添加" onclick="add()"></td>
            </tr>
        </table>
    </form>

</body>
</html>
