<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>人事管理系统——修改员工</title>
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
    <script type="text/javascript" src = "<%=request.getContextPath()%>/res/validate/jquery.validate.min.js"></script>
    <script type="text/javascript" src = "<%=request.getContextPath()%>/res/validate/messages_zh.js"></script>
<script type="text/javascript">
    $.validator.setDefaults({
        submitHandler: function() {
            var index = layer.load(1,{shade:0.3});
            $.post("<%=request.getContextPath()%>/employee/update",
                $("#fm").serialize(),
                function(data){
                    if(data.code != 200){
                        layer.msg(data.msg, {icon: 5});
                        layer.close(index);
                        return;
                    }
                    layer.msg(data.msg, {
                        icon: 6,
                        time: 2000 //2秒关闭（如果不配置，默认是3秒）
                    }, function(){
                        layer.close(index);
                        parent.window.location.href="<%=request.getContextPath()%>/employee/toShow";
                    });

                })
        }
    });


    $().ready(function(){
        $("#fm").validate({
            rules : {
                name : {
                    required:true,
                }
            },
            messages:{
                name : {
                    required:"请输入姓名",
                },
            }
        })
    })
</script>
    <style>
        .error{
            color:red;
        }
    </style>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td height="10"></td>
    </tr>
    <tr>
        <td width="15" height="32"><img src="${pagePath}/res/images/main_locleft.gif" width="15" height="32"></td>
        <td class="main_locbg font2"><img src="${pagePath}/res/images/pointer.gif">&nbsp;当前位置：员工管理&nbsp;&gt;&nbsp;修改员工</td>
        <td width="15" height="32"><img src="${pagePath}/res/images/main_locright.gif" width="15" height="32"></td>
    </tr>
</table>


<form id = "fm">

    <input type="hidden"  name="id"  value="${employee.id}" /><br>

    <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
        <tr>
            <td class="font3 fftd">
                <table>
                    <tr>
                        <td class="font3 fftd">姓名：<input type="text" name="name" id="name" size="20" value="${employee.name}" /></td>
                        <td class="font3 fftd">身份证号码：<input type="text" name="cardId" id="cardId" size="20" value="${employee.cardId}" /></td>
                    </tr>
                    <tr>

                        <td class="font3 fftd">性别： <select id="sex" name="sex" style="width: 143px;">
                            <option value="">--请选择性别--</option>
                            <option value="1" <c:if test="${employee.sex==1}">selected </c:if> >男</option>
                            <option value="0" <c:if test="${employee.sex==0}">selected </c:if> >女</option>
                        </select></td>
                        <td class="font3 fftd">职&nbsp;&nbsp;&nbsp;位： <select id="jobId" name="jobId" style="width: 143px;">
                            <option value="">--请选择职位--</option>
                            <option value="1"<c:if test="${employee.jobId==1}">selected </c:if> >职员</option>
                            <option value="2"<c:if test="${employee.jobId==2}">selected </c:if> >Java开发工程师</option>
                            <option value="3"<c:if test="${employee.jobId==3}">selected </c:if> >Java中级开发工程师</option>
                            <option value="4"<c:if test="${employee.jobId==4}">selected </c:if> >Java高级开发工程师</option>
                            <option value="5"<c:if test="${employee.jobId==5}">selected </c:if>>系统管理员</option>
                            <option value="6"<c:if test="${employee.jobId==6}">selected </c:if> >架构师</option>
                            <option value="7"<c:if test="${employee.jobId==7}">selected </c:if> >主管</option>
                            <option value="8"<c:if test="${employee.jobId==8}">selected </c:if> >经理</option>
                            <option value="9"<c:if test="${employee.jobId==9}">selected </c:if> >总经理</option>
                            <option value="10"<c:if test="${employee.jobId==10}">selected </c:if> >清洁工</option>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="font3 fftd">学历：<input name="education" id="education" size="20" value="${employee.education}" /></td>
                        <td class="font3 fftd">邮&nbsp;&nbsp;&nbsp;箱：<input name="email" id="email" size="20" value="${employee.email}" /></td>
                    </tr>
                    <tr>
                        <td class="font3 fftd">手机：<input name="mobile" id="mobile" size="20" value="${employee.mobile}" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="main_tdbor"></td>
        </tr>
        <tr>
            <td class="font3 fftd">QQ&nbsp;号码：<input name="qq" id="qq" size="20" value="${employee.qq}" />
            </td>
        </tr>
        <tr>
            <td class="main_tdbor"></td>
        </tr>
        <tr>
            <td class="font3 fftd">联系地址：<input name="address" id="address" size="40" value="${employee.address}" />&nbsp;&nbsp;邮政编码：<input name="postCode" id="postCode" size="20" value="${employee.postCode}" />
            </td>
        </tr>
        <tr>
            <td class="main_tdbor"></td>
        </tr>

        <tr>
            <td class="main_tdbor"></td>
        </tr>
        <tr>
            <td class="font3 fftd">特长：<input name="speciality" id="speciality" size="40" value="${employee.speciality}" /></td>
        </tr>
        <tr>
            <td class="main_tdbor"></td>
        </tr>
        <tr>
            <td class="font3 fftd">所属部门： <select id="departmentId" name="departmentId" style="width: 100px;">
                <option value="">--请选择部门--</option>
                <option value="1" <c:if test="${employee.departmentId==1}">selected </c:if> >技术部</option>
                <option value="2" <c:if test="${employee.departmentId==2}">selected </c:if> >运营部</option>
                <option value="3" <c:if test="${employee.departmentId==3}">selected </c:if> >财务部</option>
                <option value="4" <c:if test="${employee.departmentId==4}">selected </c:if> >总公办</option>
                <option value="5" <c:if test="${employee.departmentId==5}">selected </c:if> >市场部</option>
                <option value="6" <c:if test="${employee.departmentId==6}">selected </c:if> >教学部</option>
                <option value="7" <c:if test="${employee.departmentId==7}">selected </c:if> > 测试部门</option>
            </select>
            </td>
        </tr
        <tr>
            <td class="main_tdbor"></td>
        </tr>
        <tr>
            <td align="left" class="fftd"><input type="submit" value="修改">&nbsp;&nbsp;<input type="button" onclick="location.href='${pagePath}/employee/toShow'" value="取消 "></td>
        </tr>
    </table>
</form>

<div style="height: 10px;"></div>
</body>
</html>
