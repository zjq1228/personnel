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
    <script type="text/javascript">
        function add() {
            $.post(
                "<%=request.getContextPath()%>/user/addUser",
                $("#frm").serialize(),
                function (result) {
                    window.location.href = "/user/toShow";
                }
            );
        }

        /**
         * 部门
         */
        $(function(){
            $.post("<%=request.getContextPath()%>/user/getParent",
                {"parentId" : 4},
                function (data) {
                if(data.code == 200){
                    var parentIdBM = data.data;
                    var parentHtml = "";
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
                        for (var i = 0; i < parentIdBM.length; i++){
                            var parentOne= parentIdBM[i];
                            parentHtml += " <option value='"+parentOne.id+"'>"+parentOne.baseName+"</option>"

                        }
                        $("#rs").html(parentHtml);
                    }
                })
        }
        function level3(parentId) {
            $("#num").val(parentId);
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
                <td><input type="hidden" name="userLevel" value="3"></td>
            </tr>
            <tr>
                <td>选择部门及上级</td>
                <td> 部门<select id = "bm" onchange="level2(this.value)"></select>
                     人事<select id = "rs" onchange="level3(this.value)"></select></td>
                <td><input type="hidden" name="pId" id="num"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="button" value="添加" onclick="add()"></td>
            </tr>
        </table>
    </form>

</body>
</html>
