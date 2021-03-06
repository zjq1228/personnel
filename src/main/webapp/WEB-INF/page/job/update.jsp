<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
            $.post("<%=request.getContextPath()%>/job/update",
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
                        parent.window.location.href="<%=request.getContextPath()%>/job/toShow";
                    });

                })
        }
    });


    $().ready(function(){
        $("#fm").validate({
            rules : {
                name : {
                    required:true,
                },
                remark : {
                    required:true,
                }
            },
            messages:{
                name : {
                    required:"请输入职位名",
                },
                remark : {
                    required:"详细信息不能为空",
                }
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
        <td class="main_locbg font2"><img src="${pagePath}/res/images/pointer.gif">&nbsp;当前位置：职位管理&nbsp;&gt;&nbsp;修改职位</td>
        <td width="15" height="32"><img src="${pagePath}/res/images/main_locright.gif" width="15" height="32"></td>
    </tr>
</table>

<form id = "fm">
    <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
        <tr>
            <td class="font3 fftd">
                <table>
                    <input type="hidden"  name="id"  value="${job.id}" /><br>
                    <tr>
                        <td class="font3 fftd">职位名称：<input name="name" id="name" value="${job.name}" size="20" /></td>
                    </tr>
                    <tr>
                        <td class="font3 fftd">详细描述：<input name="remark" id="remark" value="${job.remark}" size="20" /></td>
                    </tr>
                </table>
        <tr>
            <td class="main_tdbor"></td>
        </tr>
        <tr>
            <td align="left" class="fftd"><input type="submit" value="修改">&nbsp;&nbsp;<input type="button" onclick="location.href='${pagePath}/job/toShow'" value="取消 "></td>
        </tr>
            </td>
        </tr>
    </table>
</form>
<div style="height: 10px;"></div>

</body>
</html>
