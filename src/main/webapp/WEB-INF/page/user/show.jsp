<%--
  Created by IntelliJ IDEA.
  User: dj
  Date: 2020/7/23
  Time: 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $.post(
                "/user/show",
                {"id" : '${user.id}'},
                function (result) {
                    var users = result.data;
                    var html = "";
                    for (var i=0;i<users.length;i++){
                        var user = users[i];
                        html += "<tr>";
                        html += "<td>"+user.id+"</td>";
                        html += "<td>"+user.username+"</td>";
                        html += "<td>"+user.password+"</td>";
                        html += "<td>"+user.status+"</td>";
                        html += "<td>"+user.createTime+"</td>";
                        html += "</tr>";
                    }
                    $("#tbd").html(html);
                }
            );
        })

        function add() {
            window.location.href = "/user/toAdd";
        }
    </script>
</head>
<body>
    <form id="frm">
        <input type="button" value="添加" onclick="add()">
    </form>
    <table>
        <tr>
            <td>用户ID</td>
            <td>登录名称</td>
            <td>密码</td>
            <td>状态</td>
            <td>注册时间</td>
        </tr>
        <tbody id="tbd"></tbody>
    </table>
</body>
</html>
