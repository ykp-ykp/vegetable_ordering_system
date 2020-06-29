<%@ page import="com.example.vegetableorder.domain.User" %>
<%@ page import="com.example.vegetableorder.dao.OperateUser" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/6/29
  Time: 18:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
            <h1>修改用户信息</h1>
        </div>
        <%
            String altered_username = request.getParameter("altered_username");
            User user = new OperateUser().getOneUser(altered_username);
        %>
        <div class="reg_form clearfix">
            <form action="/Alter/to_admin_alter_user" method="post" onsubmit="return admin_alter_user_checkall()" id="reg_form">
                <ul>
                    <li>
                        <label>用户名:</label>
                        <input type="text" name="username" id="username" readonly="readonly" value="<%=user.getName()%>">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>密码:</label>
                        <input type="text" name="pwd" id="pwd" value="<%=user.getPassword()%>">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>手机号:</label>
                        <input type="text" name="phone" id="phone" value="<%=user.getPhone()%>">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>地址:</label>
                        <input type="text" name="address" id="address" value="<%=user.getAddress()%>">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>密保问题:</label>
                        <input type="text" name="tooltips" id="tooltips" value="<%=user.getTooltips()%>">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>密保答案:</label>
                        <input type="text" name="answer" id="answer" value=<%=user.getAnswer()%>>
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li class="reg_sub">
                        <input type="submit"  value="确 定" name="submit" id="submit">
                    </li>
                </ul>
            </form>
        </div>
    </div>

</div>
</body>
</html>
