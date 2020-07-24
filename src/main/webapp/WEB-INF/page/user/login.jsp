<%--
  Created by IntelliJ IDEA.
  User: dj
  Date: 2020/7/22
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
        //判断当前窗口路径与加载路径是否一致。
        if(window.top.document.URL != document.URL){
            //将窗口路径与加载路径同步
            window.top.location = document.URL;
        }
         function  login() {
               $.post(
                    "<%=request.getContextPath()%>/user/login",
                     $("#frm").serialize(),
                     function (result) {
                        alert(result.code);
                        if(result.code == 200) {
                            location.href="/index/toIndex";
                        } else {
                            alert(result.msg);
                        }
                     }
               )
          }

    </script>
</head>
<body>
    <form id="frm">
        用户名：<input type="text" name="username" />
        密码：<input type="text" name="password" />
        <input type="button" value="登陆" onclick="login()">
    </form>
</body>
</html>
