<%@ page import="com.example.vegetableorder.domain.User" %>
<%@ page import="com.example.vegetableorder.dao.OperateUser" %>
<%@ page import="com.example.vegetableorder.domain.Administrator" %>
<%@ page import="com.example.vegetableorder.dao.OperateAdmin" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/6/29
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>天天生鲜-管理员中心</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
</head>
<body>
<%
    String adminname = (String) session.getAttribute("adminname");
    Administrator admin = new OperateAdmin().getOneAdmin(adminname);
%>
<div class="header_con">
    <div class="header">
        <div class="fr">
            <div class="user_link fl">
                <a href="/">返回首页</a>
                <span>|</span>
                <a href="/Dispatch/quit">退出</a>
            </div>
        </div>
    </div>
</div>

<div class="search_bar clearfix">
    <a href="/" class="logo fl"><img src="/images/logo.png"></a>
    <div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;管理员中心</div>
</div>

<div class="main_con clearfix">
    <div class="left_menu_con clearfix">
        <h3>管理员中心</h3>
        <ul>
            <li><a href="/Dispatch/to_admin_center_info" class="active">· 个人信息</a></li>
            <li><a href="/Dispatch/to_alter_admin_info">· 修改密码</a></li>
            <li><a href="/Dispatch/to_admin_center_allorder">· 全部订单</a></li>
            <li><a href="/Dispatch/to_admin_center_alluser">· 用户信息</a></li>
            <li><a href="/Dispatch/to_admin_center_allvegetable">· 蔬菜信息</a></li>
        </ul>
    </div>
    <div class="right_content clearfix">
        <div class="info_con clearfix">
            <h3 class="common_title2">基本信息</h3>
            <ul class="user_info_list">
                <li><span>用户名：</span><%=admin.getName()%></li>
                <li><span>密码：</span><%=admin.getPassword()%></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
