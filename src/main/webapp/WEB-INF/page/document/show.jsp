<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="pagePath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>人事管理系统——文档管理</title>
    <link type="text/css" rel="stylesheet" href="${pagePath}/res/css/css.css" />
    <link type="text/css" rel="stylesheet" href="${pagePath}/res/js/ligerUI/skins/Aqua/css/ligerui-dialog.css" />
    <link type="text/css" rel="stylesheet" href="${pagePath}/res/js/ligerUI/skins/ligerui-icons.css" />
    <link type="text/css" rel="stylesheet" href="${pagePath}/res/css/pager.css" />
    <script type="text/javascript" src="${pagePath}/res/js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="${pagePath}/res/js/jquery-migrate-1.2.1.js"></script>
    <script type="text/javascript" src="${pagePath}/res/js/ligerUI/js/core/base.js"></script>
    <script type="text/javascript" src="${pagePath}/res/js/ligerUI/js/plugins/ligerDrag.js"></script>
    <script type="text/javascript" src="${pagePath}/res/js/ligerUI/js/plugins/ligerDialog.js"></script>
    <script type="text/javascript" src="${pagePath}/res/js/ligerUI/js/plugins/ligerResizable.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/layer/layer.js"></script>
    <script type="text/javascript">
        //赋选中复选框的值
        function selectedValue() {
            appliancesIds = $('input[name="id"]:checked');
            var chk_value = [];
            $.each(appliancesIds,function(){
                chk_value.push($(this).val());
            })
            $("#ids").val(chk_value);
            return chk_value;
        }
        $(function() {
            search();
        })
        //展示
        function search() {
            $.post("<%=request.getContextPath()%>/document/show",
                $("#fm").serialize(),
                function (data) {
                    if (data.code != 200) {
                        alert(data.msg);
                        return;
                    }
                    var html = "";
                    var pageHtml = "";
                    for (var i = 0; i < data.data.list.length; i++) {
                        var u = data.data.list[i];
                        html += "<tr>";
                        html += "<td><input type='checkbox' value='" + u.id + "' name='id' /></td>"
                        html += "<td>" + u.title + "</td>"
                        html += "<td>" + u.username + "</td>";
                        html += "<td>" + u.fileName + "</td>"
                        html += "<td>" + u.remark + "</td>"
                        html += "<td>" + u.createTime + "</td>"
                        html += "<td><input type='button' value='修改' onclick='upd(" + u.id + ")' /></td>"
                        // html += "<td><input type='button' value='下载' onclick='xiazai(" + u.id + ")' /></td>"
                        html += "<td><a href='<%=request.getContextPath()%>/document/download?id="+u.id+"'>下载</a></td>"
                        html += "</tr>";
                    }
                    $("#tbd").html(html);
                    pageHtml += "<input type = 'button' value='上一页' onclick='page(0, " + data.data.pages + ")'/>";
                    if (data.data.pages == 0) {
                        pageHtml += "第0页";
                    } else {
                        pageHtml += "第" + $("#pageNo").val() + "/" + data.data.pages + "页";
                    }
                    pageHtml += "<input type = 'button' value='下一页' onclick='page(1, " + data.data.pages + ")'/>";
                    $("#pageDiv").html(pageHtml);
                });
        }

        //分页
        function page(q, pages) {
            var page = $("#pageNo").val();
            if (q == 0) {
                if (page == 1) {
                    layer.msg("已是首页", {icon: 5, time: 2000});
                    return;
                }
                $("#pageNo").val(parseInt(page) - 1);
            }
            if (q == 1) {
                if (parseInt(page) + 1 > pages) {
                    layer.msg("已是尾页", {icon: 5, time: 2000});
                    return;
                }
                $("#pageNo").val(parseInt(page) + 1);
            }
            search();
        }

        //条件查询要重新分页
        function selectBy() {
            $("#pageNo").val(1);
            search();
        }

        function add() {
            location.href = "<%=request.getContextPath()%>/document/toInsert"
        }
        //删除
        function del() {
            selectedValue();
            var index = layer.load(0, {shade: 0.3}, {time: 10 * 1000});
            $.post("<%=request.getContextPath()%>/document/deleteDocument",
                {"ids": $("#ids").val()},//,"_method": "delete"
                function (data) {
                    if (data.code == "200") {
                        layer.msg(data.msg,
                            {icon: 6, time: 2000},
                            function () {
                                window.location.href = "<%=request.getContextPath()%>/document/toShow"
                            });
                        layer.close(index);
                        return;
                    }
                    layer.msg(data.msg);
                    layer.close(index);


                })
        }
        //下载
        function xiazai(id) {
            var index = layer.load(0, {shade: 0.3}, {time: 10 * 1000});
            $.post("<%=request.getContextPath()%>/document/download",
                {"id": id},//,"_method": "delete"
                function (data) {
                /*debugger;*/
                    if (data == "200") {
                        layer.msg("下载成功",
                            {icon: 6, time: 2000},
                            function () {
                                window.location.href = "<%=request.getContextPath()%>/document/toShow"
                            });
                        layer.close(index);
                        return;
                    }
                    layer.msg("下载失败");
                    layer.close(index);

                })
        }
        function upd(id) {
            window.location.href = "<%=request.getContextPath()%>/document/toUpdate?id=" + id;
        }
    </script>
</head>
<body>
<form id="fm">
    <input type="hidden" value="1"  id="pageNo" name ="pageNo">
    <input type="hidden" id="ids" />
<!-- 导航 -->
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td height="10"></td>
    </tr>
    <tr>
        <td width="15" height="32"><img src="${pagePath}/res/images/main_locleft.gif" width="15" height="32"></td>
        <td class="main_locbg font2"><img src="${pagePath}/res/images/pointer.gif">&nbsp;当前位置：文档管理&nbsp;&gt;&nbsp;文档查询</td>
        <td width="15" height="32"><img src="${pagePath}/res/images/main_locright.gif" width="15" height="32"></td>
    </tr>
</table>
    <table width="100%" height="90%" border="0" cellpadding="5" cellspacing="0" class="main_tabbor">
        <!-- 查询区  -->
        <tr valign="top">
            <td height="30">
                <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
                    <tr>
                        <td class="fftd">
                            <form name="deptform" method="post" id="deptform" action="${pagePath}/document/show">
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="font3">文档标题：<input type="text" name="title"> <input type="button" value="查询" onclick="selectBy()"/>  <input type="reset" value="清空"/>  <input onclick="del()" type="button" value="删除" />
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    <!-- 数据展示区 -->
    <tr valign="top">
        <td height="20">
            <table width="100%" border="1" cellpadding="5" cellspacing="0" style="border: #c2c6cc 1px solid; border-collapse: collapse;">
                <tr class="main_trbg_tit" align="center">
                    <td width="8%"></td>
                    <td width="15%">标题</td>
                    <td width="5%">创建人</td>
                    <td width="10%">文档名称</td>
                    <td width="30%">描述</td>
                    <td width="10%">创建时间</td>
                    <td width="5%">操作</td>
                    <td width="5%">下载</td>
                    <tbody id ="tbd"></tbody>
                </tr>
            </table>
        </td>
    </tr>
</table>
</form>
<div id = "pageDiv"></div>
<div style="height: 10px;"></div>
</body>
</html>