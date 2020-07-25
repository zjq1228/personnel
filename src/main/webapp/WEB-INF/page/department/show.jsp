<%--
  Created by IntelliJ IDEA.
  User: dj
  Date: 2020/7/23
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath() %>/res/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
        //赋选中复选框的值
        function selectedValue() {
            appliancesIds = $('input[name="ids"]:checked');
            var chk_value = [];
            $.each(appliancesIds, function () {
                chk_value.push($(this).val());
            })
            $("#ids").val(chk_value);
            return chk_value;
        }

        $(function () {
            show();
        })

        function search() {
            $("#tbd").empty();
            $("#pageNo").val(1);
            show();
        }

        function show() {
            $.post("<%=request.getContextPath() %>/department/show",
                $("#fm").serialize(),
                function (data) {
                    if (data.code != 200) {
                        alert(data.msg);
                        return;
                    }
                    var html = "";
                    var pageHtml = "";
                    for (var i = 0; i < data.data.list.length; i++) {
                        var department = data.data.list[i];
                        html += "<tr>"
                        html += "<td><input type = 'checkbox' name = 'ids' value = '" + department.id + "'/></td>"
                        html += "<td>" + department.name + "</td>"
                        html += "<td>" + department.remark + "</td>"
                        html += "</tr>";
                    }
                    $("#tbd").append(html);
                    pageHtml += "<input type = 'button' value = '加载更多' onclick = 'page(" + data.data.pages + ")'/>";
                    $("#pageDiv").html(pageHtml);
                })
        }





        //删除
        function del() {
            if(selectedValue().length == 0){
                alert("您必须选一个");
                return;
            }if(confirm("确认删除吗") == true){
                $.post("<%=request.getContextPath()%>/department/updateIsDel",
                    {"ids":selectedValue(), "isDel":0},
                    function(data) {
                        if(data.code == 200) {
                            alert(data.msg);
                            window.location.href = "<%=request.getContextPath() %>/department/toShow";
                        }
                    });
            }
        }


        function add(){
            window.location.href = "<%=request.getContextPath() %>/department/toAdd";
        }



        function page(pages) {
            var page = $("#pageNo").val();
            if (parseInt(page) + 1 > pages) {
                $("#pageDiv").html("--我是有底线的--");
                return;
            }
            $("#pageNo").val(parseInt(page) + 1);
            show();
        }
    </script>
</head>
<body align="center">

<form id="fm" align="center">

    <input type="hidden" name="pageNo" id="pageNo" value="1">
    <input type="hidden" name="isDel" value="1">
    部门查询：<input type="text" name="name"/>
    <input type="button" value="查询" onclick="search()"/><br/>
    <input type = "reset" value = "清空" />
    <input type = "hidden" id = "ids" />
    <input type = "button" value = "删除" onclick = "del()"/>
    <input type = "button" value = "添加" onclick = "add()"/>
</form>
<table align="center">
    <tr>
        <th></th>
        <th>部门名称</th>
        <th>详细描述</th>
    </tr>
    <tbody id="tbd">

    </tbody>
</table>
<div id="pageDiv"></div>
</body>
</html>
