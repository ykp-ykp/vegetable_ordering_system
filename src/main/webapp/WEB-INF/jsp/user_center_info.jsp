<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/6/23
  Time: 18:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>天天生鲜-用户中心</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
</head>
<body>
<div class="header_con">
    <div class="header">
        <div class="fr">
            <div class="user_link fl">
                <a href="/Dispatch/quit">退出</a>
                <span>|</span>
                <a href="/cart.html">我的购物车</a>
                <span>|</span>
                <a href="/user_center_order.html">我的订单</a>
            </div>
        </div>
    </div>
</div>

<div class="search_bar clearfix">
    <a href="/index.html" class="logo fl"><img src="/images/logo.png"></a>
    <div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;用户中心</div>
    <div class="search_con fr">
        <input type="text" class="input_text fl" name="" placeholder="搜索商品">
        <input type="button" class="input_btn fr" name="" value="搜索">
    </div>
</div>

<div class="main_con clearfix">
    <div class="left_menu_con clearfix">
        <h3>用户中心</h3>
        <ul>
            <li><a href="/user_center_info.html" class="active">· 个人信息</a></li>
            <li><a href="/user_center_order.html">· 全部订单</a></li>
            <li><a href="/user_center_site.html">· 收货地址</a></li>
        </ul>
    </div>
    <div class="right_content clearfix">
        <div class="info_con clearfix">
            <h3 class="common_title2">基本信息</h3>
            <ul class="user_info_list">
                <li><span>用户名：</span>18210569700</li>
                <li><span>联系方式：</span>18210569700</li>
                <li><span>联系地址：</span>北京市昌平区</li>
            </ul>
        </div>
    </div>
</div>

</body>
</html>
