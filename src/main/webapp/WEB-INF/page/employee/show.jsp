<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="pagePath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>人事管理系统——员工管理</title>
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
            $.post("<%=request.getContextPath()%>/employee/show",
                $("#fm").serialize(),
                function(data){
                    if (data.code != 200) {
                        alert(data.msg);
                        return;
                    }
                    var html = "";
                    var pageHtml = "";
                    for (var i = 0; i <  data.data.list.length; i++) {
                        var u = data.data.list[i];
                        html += "<tr>";
                        html += "<td><input type='checkbox' value='" + u.id + "' name='id' /></td>"
                        html += "<td>"+u.name +"</td>";
                        if (u.sex==1){
                            html += "<td>男</td>";
                        }else{
                            html += "<td>女</td>";
                        }
                        html += "<td>"+u.mobile +"</td>";
                        html += "<td>"+u.email +"</td>";
                        html += "<td>"+u.zhiwei +"</td>";
                        html += "<td>"+u.cardId +"</td>";
                        html += "<td>"+u.bumen +"</td>";
                        html += "<td>"+u.address +"</td>";
                        html += "<td>"+u.createTime +"</td>";
                        html += "<td><input type='button' value='修改' onclick='upd("+u.id+")' /></td>"
                        html += "</tr>";
                    }
                    $("#tbd").html(html);
                    pageHtml += "<input type = 'button' value='上一页' onclick='page(0, "+data.data.pages+")'/>";
                    if (data.data.pages==0) {
                        pageHtml +="第0页";
                    }else{
                        pageHtml +="第"+$("#pageNo").val()+"/"+data.data.pages+"页";
                    }
                    pageHtml += "<input type = 'button' value='下一页' onclick='page(1, "+data.data.pages+")'/>";
                    $("#pageDiv").html(pageHtml);
                });
        }
        //分页
        function page(q,pages){
            var page = $("#pageNo").val();
            if (q == 0) {
                if (page == 1) {
                    layer.msg("已是首页", {icon: 5, time: 2000});
                    return;
                }
                $("#pageNo").val(parseInt(page) - 1);
            }
            if (q == 1) {
                if (parseInt(page) + 1 > pages ) {
                    layer.msg("已是尾页", {icon: 5, time: 2000});
                    return;
                }
                $("#pageNo").val(parseInt(page) + 1);
            }
            search();
        }
        //条件查询要重新分页
        function selectBy(){
            $("#pageNo").val(1);
            search();
        }
        function add() {
            location.href = "<%=request.getContextPath()%>/employee/toInsert"
        }
        //删除
        function del() {
            selectedValue();
            var index = layer.load(0, {shade: 0.3}, {time: 10 * 1000});
            $.post("<%=request.getContextPath()%>/employee/deleteEmployee",
                {"ids": $("#ids").val()},//,"_method": "delete"
                function (data) {
                    layer.close(index);
                    if (data.code == "200") {
                        layer.msg(data.msg,
                            {icon: 6, time: 2000},
                            function () {
                                window.location.href = "<%=request.getContextPath()%>/employee/toShow"
                            });
                        return;
                    }
                    layer.msg(data.msg);

                })
        }

        function upd(id) {
            window.location.href = "<%=request.getContextPath()%>/employee/toUpdate?id=" + id;
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
        <td class="main_locbg font2"><img src="${pagePath}/res/images/pointer.gif">&nbsp;当前位置：员工管理&nbsp;&gt;&nbsp;员工查询</td>
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
                        <form name="empform" method="post" id="empform" action="${pagePath}/employee/show">
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="font3">职位： <select name="jobId" style="width: 143px;">
                                        <option value="">--请选择职位--</option>
                                        <option value="1">职员</option>
                                        <option value="2">Java开发工程师</option>
                                        <option value="3">Java中级开发工程师</option>
                                        <option value="4">Java高级开发工程师</option>
                                        <option value="5">系统管理员</option>
                                        <option value="6">架构师</option>
                                        <option value="7">主管</option>
                                        <option value="8">经理</option>
                                        <option value="9">总经理</option>
                                        <option value="10">清洁工</option>
                                    </select>
                                        姓名：<input type="text" name="name" >
                                    </td>
                                </tr>
                                <tr>
                                    <td class="font3">性别： <select name="sex" style="width: 143px;">
                                        <c:if test="${empty sex}">
                                            <option value="" selected="selected">--请选择性别--</option>
                                            <option value="1">男</option>
                                            <option value="0">女</option>
                                        </c:if>
                                        <c:if test="${sex == 1}">
                                            <option value="">--请选择性别--</option>
                                            <option value="1" selected="selected">男</option>
                                            <option value="0">女</option>
                                        </c:if>
                                        <c:if test="${sex == 0}">
                                            <option value="">--请选择性别--</option>
                                            <option value="1">男</option>
                                            <option value="0" selected="selected">女</option>
                                        </c:if>
                                    </select> 手机：<input type="text" name="mobile" /> &nbsp;所属部门：<select name="departmentId" style="width: 100px;">
                                        <option value="">--请选择部门--</option>
                                        <option value="1">技术部</option>
                                        <option value="2">运营部</option>
                                        <option value="3">财务部</option>
                                        <option value="4">总公办</option>
                                        <option value="5">市场部</option>
                                        <option value="6">教学部</option>
                                        <option value="7"> 测试部门</option>
                                    </select>&nbsp; <input type="button" value="搜索" onclick="selectBy()"/>
                                        <input type="reset"  value="清空" />
                                        <input onclick="del()" type="button" value="删除" />
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
                    <td></td>
                    <td>姓名</td>
                    <td>性别</td>
                    <td>手机号码</td>
                    <td>邮箱</td>
                    <td>职位</td>
                    <td>身份证号码</td>
                    <td>部门</td>
                    <td>联系地址</td>
                    <td>建档日期</td>
                    <td align="center">操作</td>
                </tr>
                <tbody id ="tbd"></tbody>
            </table>
        </td>
    </tr>
</table>
</form>
<div id = "pageDiv"></div>
<div style="height: 10px;"></div>
</body>
</html>