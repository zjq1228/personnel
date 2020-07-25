<%--
  Created by IntelliJ IDEA.
  User: 文沛阳
  Date: 2020/7/22
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords" content=""
    />
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/placeMe.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>\res\css\style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>\res\css\fontawesome-all.css">
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

        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }

    </script>
</head>
<body>
<div id="bg">
    <canvas></canvas>
    <canvas></canvas>
    <canvas></canvas>
</div>
<h1>欢迎来到用户管理系统</h1>
<div class="sub-main-w3">
    <form id="frm">
        <h2>Login Now
            <i class="fa fa-long-arrow-down"></i>
        </h2>
        <div class="form-style-agile">
            <label>
                <i class="fa fa-user"></i>
                输入用户昵称
            </label>
            <input placeholder="Username" name="username" type="text" required="">
        </div>
        <div class="form-style-agile">
            <label>
                <i class="fa fa-unlock-alt"></i>
                输入用户密码
            </label>
            <input placeholder="Password" name="password" type="password" required="">
        </div>
        <div class="wthree-text">
            <ul>
                <li>
                    <label class="anim">
                        <input type="checkbox" class="checkbox" required="">
                        <span>Stay Signed In</span>
                    </label>
                </li>
                <li>
                    <a href="#">Forgot Password?</a>
                </li>
            </ul>
        </div>
        <input type="submit" value="Log In" onclick="login()">
    </form>
</div>
<div class="footer">
    <p>Copyright &copy; 2018.Company name All rights reserved.</p>
</div>
<script src="<%=request.getContextPath()%>\res\js\canva_moving_effect.js"></script>
</body>
</html>
