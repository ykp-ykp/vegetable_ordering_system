<%@ page import="com.example.vegetableorder.domain.Orders" %>
<%@ page import="com.example.vegetableorder.dao.OperateOrders" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/6/24
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <title>天天生鲜-购物车</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
</head>
<body>
<div class="header_con">
    <div class="header">
        <div class="welcome fl">欢迎来到天天生鲜!</div>
        <div class="fr">
            <div class="user_link fl">
                <span>|</span>
                <a href="/Dispatch/quit">退出</a>
                <span>|</span>
                <a href="/Dispatch/toindex">返回首页</a>
            </div>
        </div>
    </div>
</div>

<div class="search_bar clearfix">
    <a href="/index.html" class="logo fl"><img src="/images/logo.png"></a>
    <div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;购物车</div>
</div>
<%//获取当前用户的所有的未付款的订单
String username = (String)session.getAttribute("username");
List<Orders> ordersList = new OperateOrders().getUnpaidOrders(username);
%>
<div class="total_count">全部商品<em><%=ordersList.size()%></em>件</div>
<ul class="cart_list_th clearfix">
    <li class="col01">商品名称</li>
    <li class="col02">商品单位</li>
    <li class="col03">商品价格</li>
    <li class="col04">数量</li>
    <li class="col05">总计</li>
    <li class="col06">操作</li>
</ul>
<%
    for (int i=0;i<ordersList.size();i++){
        Orders order = ordersList.get(i);%>

    <ul class="cart_list_td clearfix" name="<%=i%>" id="<%=i%>">
        <li class="col01"><input type="checkbox" name="" checked="checked"></li>
        <li class="col02"><img src="/images/goods/goods012.jpg"></li>
        <li class="col03"><%=order.getVegetablename()%></li>
        <li class="col04">500g</li>
        <li class="col05"><%=order.getPrice()%>元/500g</li>
        <li class="col06">
            <div class="num_add">
                <a href="/javascript:;" class="add fl">+</a>
                <input type="text" class="num_show fl" value="<%=order.getWeight()%>">
                <a href="/javascript:;" class="minus fl">-</a>
            </div>
        </li>
        <li class="col07"><%=order.getTotalprice()%></li>
        <li class="col08"><a href="/javascript:;">删除</a></li>
    </ul>
<%}
%>


<ul class="settlements">
    <li class="col01"><input type="checkbox" name="" checked=""></li>
    <li class="col02">全选</li>
    <li class="col03">合计(不含运费)：<span>¥</span><em>42.60</em><br>共计<b>2</b>件商品</li>
    <li class="col04"><a href="/place_order.html">去结算</a></li>
</ul>

</body>
</html>
