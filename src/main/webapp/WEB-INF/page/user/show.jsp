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
    <script type="text/javascript" src = "<%=request.getContextPath()%>/res/layer/layer.js"></script>
    <script type="text/javascript">

        var province = null;
        function selec() {
            province= $('input[name="province"]:checked');
            var pid=[];
            $.each(province,function(){
                pid.push($(this).val());
            })
            return pid;
        }

        var proId = null;
        function count() {
            proId= $('input[name="proId"]:checked');
            var pid=[];
            $.each(proId,function(){
                pid.push($(this).val());
            })
            $("#findById").val(pid);
            return pid;
        }

        $(function () {
           show();
        })

       function show(){
           $("#ids").val(selec())
           $.post(
               "/user/show?id="+${user.id},
               $("#fm").serialize(),
               function (result) {
                   var users = result.data;
                   var html = "";
                   for (var i=0;i<users.length;i++){
                       var user = users[i];
                       html += "<tr>";

                       html += "<td><input type='checkbox' name='proId' value='"+user.id+"'/></td>";

                       html += "<td><font color=\"#ffd700\">"+user.username+"</font></td>";
                       html += "<td><font color=\"#ffd700\">"+user.password+"</font></td>";
                       html += "<td><font color=\"#ffd700\">"+user.status+"</font></td>";
                       html += "<td><font color=\"#ffd700\">"+user.createTime+"</font></td>";
                       html += "<td><font color=\"#ffd700\">"+user.userPhone+"</font></td>";
                       html += "<td><font color=\"#ffd700\">"+user.idCard+"</font></td>";
                       html += "</tr>";
                   }
                   $("#tbd").html(html);
               })

       };

        function updateUser(){
            var checkBox = count();
            if(checkBox.length != 1){
                alert("必须选中一个修改")
                return;
            }
            layer.open({
                type: 2,
                title: '修改个人信息',
                shadeClose: true,
                shade: 0.8,
                area: ['380px', '90%'],
                content: '<%=request.getContextPath()%>/user/toUpdate?id='+checkBox[0] //iframe的url
            });
        }

    </script>
</head>
<body>
    <form id="fm">
        <input type="hidden" name="id" value="${user.id}">
        <input type="hidden" id="ids" name="ids">
        <c:if test="${user.userLevel == 1}">
            <font color="aqua">手机号查询</font><input type="text" name="userPhone"><br/>
            <font color="aqua">姓名&#12288查询</font><input type="text" name="username"><br/>
            <font color="aqua">职位&#12288查询</font><select name="userLevel">
            <option  value="0">请选择</option>
            <option  value="1">boos</option>
            <option  value="2">管理</option>
            <option  value="3">员工</option>
            </select><br/>
            <font color="aqua">身份证号码</font><input type="text" name="idCard"><br/>
            <font color="aqua">所在&#12288部门</font> <br/>
            <c:forEach items="${parentIdBM}" var="p">
            <font color="#00ffff">${p.baseName}</font> <input type="checkbox" name="province" value="${p.id}" />
            </c:forEach><br/><br/>
            <input type="button" value="查询" onclick="show()"><br/>
        </c:if>

            <input type='button' value='修改个人信息' onclick='updateUser()'>

    </form>
    <table>
        <tr>
            <td></td>
            <td><font color="#7fffd4">登录名称</font></td>
            <td><font color="#7fffd4">密码</font></td>
            <td><font color="#7fffd4">状态</font></td>
            <td><font color="#7fffd4">注册时间</font></td>
            <td><font color="#7fffd4">手机号码</font></td>
            <td><font color="#7fffd4">身份证号码</font></td>
        </tr>
        <tbody id="tbd"></tbody>
    </table>


    <span class="container"></span>
    <script src="<%=request.getContextPath()%>\res\js\snowflakeCursor.js" type="text/javascript"></script>
</body>
</html>
