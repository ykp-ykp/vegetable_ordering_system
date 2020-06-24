<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/6/22
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>天天生鲜-注册</title>
    <%--下面引用外部js没有用，所哟js我就写在了最下面--%>
    <link rel="stylesheet" type="text/css" href="/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/js/register.js"></script>

</head>
<body>
<div class="register_con">
    <div class="l_con fl">
        <a class="reg_logo"><img src="/images/logo02.png"></a>
        <div class="reg_slogan">足不出户  ·  新鲜每一天</div>
        <div class="reg_banner"></div>
    </div>

    <div class="r_con fr">
        <div class="reg_title clearfix">
            <h1>用户注册</h1>
        </div>
        <div class="reg_form clearfix">
            <form action="/Controller/toregister" method="post" onsubmit="return checkall()" id="reg_form">
                <ul>
                    <li>
                        <label>用户名:</label>
                        <input type="text" name="user_name" id="user_name">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>密码:</label>
                        <input type="password" name="pwd" id="pwd">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>确认密码:</label>
                        <input type="password" name="cpwd" id="cpwd">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>手机号:</label>
                        <input type="text" name="phone" id="phone">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>地址:</label>
                        <input type="text" name="address" id="address">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>密保问题:</label>
                        <input type="text" name="tooltips" id="tooltips">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>密保答案:</label>
                        <input type="text" name="answer" id="answer">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li class="agreement">
                        <input type="checkbox" name="allow" id="allow" checked="checked">
                        <label>同意”用户使用协议“</label>
                        <span class="error_tip2">提示信息</span>
                    </li>
                    <li class="reg_sub">
                        <input type="submit"  value="注 册" name="submit" id="submit">
                    </li>
                </ul>
            </form>
        </div>
    </div>

</div>
</body>
</html>
