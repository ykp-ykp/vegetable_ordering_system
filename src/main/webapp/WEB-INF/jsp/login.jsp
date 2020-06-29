<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/6/18
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>天天生鲜-登录</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
</head>
<body>
<div class="login_top clearfix">
    <a href="/" class="login_logo"><img src="/images/logo02.png"></a>
</div>

<div class="login_form_bg">
    <div class="login_form_wrap clearfix">
        <div class="login_banner fl"></div>
        <div class="slogan fl">日夜兼程 · 急速送达</div>
        <div class="login_form fr">
            <div class="login_title clearfix">
                <h1>用户登录</h1>
                <a href="/Dispatch/toregister">立即注册</a>
            </div>
            <div class="form_input">
                <form action="/Controller/tologin" method="post">
                    <input type="text" name="username" class="name_input" placeholder="请输入用户名">
                    <input type="password" name="password" class="pass_input" placeholder="请输入密码">
                    <div class="more_input clearfix">
                        <input type="checkbox" name="" checked="checked">
                        <label>记住用户名</label>
                        <a href="#">忘记密码</a><br>
                        <input type="checkbox" name="admin" value="isadmin"/>
                        <label>我是管理员</label>

                    </div>
                    <input type="submit" name="" value="登录" class="input_submit">
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
