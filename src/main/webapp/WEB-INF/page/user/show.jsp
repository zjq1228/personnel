<%--
  Created by IntelliJ IDEA.
  User: dj
  Date: 2020/7/23
  Time: 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>\res\css\jq22-demo.css">
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
                        html += "<td>"+user.userPhone+"</td>";
                        html += "<td>"+user.idCard+"</td>";
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
        <input type="button" value="添加" onclick="add()"><br/><br/>
        <c:if test="${user.userLevel == 1}">
            手机号查询<input type="text" name="userPhone"><br/>
            姓名&#12288查询<input type="text" name="username"><br/>
            职位&#12288查询<select>
            <option>总经理</option>
            <option>经理</option>
            <option>主管</option>
            <option>员工</option>
            </select><br/>
            身份证号码<input type="text" name="idCard"><br/>
            所在&#12288部门<input type="text" name="idCard"><br/>
        </c:if>

    </form>
    <table>
        <tr>
            <td>用户ID</td>
            <td>登录名称</td>
            <td>密码</td>
            <td>状态</td>
            <td>注册时间</td>
            <td>手机号码</td>
            <td>身份证号码</td>
        </tr>
        <tbody id="tbd"></tbody>
    </table>


    <span class="container"></span>
    <script src="<%=request.getContextPath()%>\res\js\snowflakeCursor.js" type="text/javascript"></script>
</body>
</html>
