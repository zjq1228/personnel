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
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>\res\css\jq22-demo.css">
    <script type="text/javascript" src = "<%=request.getContextPath()%>/res/layer/layer.js"></script>
    <script type="text/javascript">
        function add() {
            var index = layer.load(2, {shade: 0.3});
            $.post(
                "<%=request.getContextPath()%>/user/addUser",
                $("#frm").serialize(),
                function (result) {
                    layer.close(index);
                    if(result.code != "200"){
                        parent.layer.msg(data.msg, {icon: 5});
                        return;
                    }
                    layer.msg('增加成功', {
                        icon: 6,
                        time: 2000 //2秒关闭（如果不配置，默认是3秒）
                    }, function(){
                        location.reload();
                        return;
                    });
                }
            );
        }

        /**
         * 部门
         */
        $(function(){
            $.post("<%=request.getContextPath()%>/user/getParent",
                {"parentId" : 0},
                function (data) {
                if(data.code == 200){
                    var parentIdBM = data.data;
                    var parentHtml = "";
                    parentHtml += " <option>请选择</option>"
                    for (var i = 0; i < parentIdBM.length; i++){
                        var parentOne= parentIdBM[i];
                        parentHtml += " <option value='"+parentOne.id+"'>"+parentOne.baseName+"</option>"

                    }
                    $("#bm").html(parentHtml);
                }
            })
        })

        /**
         * 上级
         */
        function level2(parentId) {
            $.post("<%=request.getContextPath()%>/user/getParent",
                {"parentId" : parentId},
                function (data) {
                    if(data.code == 200){
                        var parentIdBM = data.data;
                        var parentHtml = "";
                        parentHtml += " <option>请选择</option>"
                        for (var i = 0; i < parentIdBM.length; i++){
                            var parentOne= parentIdBM[i];
                            parentHtml += " <option value='"+parentOne.id+"'>"+parentOne.baseName+"</option>"
                        }
                        $("#rs").html(parentHtml);
                    }
                })
            $("#bumen").val(parentId);
        }
        function level3(parentId) {
            $("#num").val(parentId);
        }

    </script>
</head>
<body style="text-align: center" bgcolor="white">
    <form id="frm">
        <table>
            <tr>
                <td><font color="red">用户名</font></td>
                <td><input type="text" name="username"></td>
            </tr>
            <tr>
                <td><font color="red">密码</font></td>
                <td><input type="text" name="password"></td>
            </tr>
            <tr>
                <td><font color="red">状态</font></td>
                <td><input type="radio" name="status" value="1" checked="checked">有效</td>
            </tr>
            <tr>
                <td><font color="red">手机号码</font></td>
                <td><input type="text" name="userPhone"></td>
            </tr>
            <tr>
                <td><font color="red">身份证号码</font></td>
                <td><input type="text" name="idCard"></td>
            </tr>
            <tr>
                <td><font color="red"><input type="hidden" name="userLevel" value="3"></td>
            </tr>
            <tr>
                <td><font color="red">选择部门及上级</font></td>
                <td> 部门<select id = "bm" onchange="level2(this.value)">

                </select>
                     人事<select id = "rs" onchange="level3(this.value)">
                    </select></td>
                <td><input type="hidden" name="pId" id="num"></td>
            </tr>
            <tr>
                <td><input type="hidden" name="province" id="bumen"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="button" value="添加" onclick="add()"></td>
            </tr>
        </table>
    </form>
    <span class="container"></span>
    <script src="<%=request.getContextPath()%>\res\js\snowflakeCursor.js" type="text/javascript"></script>
</body>
</html>
