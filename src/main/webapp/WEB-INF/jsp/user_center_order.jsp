<%@ page import="java.util.List" %>
<%@ page import="com.example.vegetableorder.domain.Orders" %>
<%@ page import="com.example.vegetableorder.dao.OperateOrders" %>
<%@ page import="com.example.vegetableorder.domain.Vegetables" %>
<%@ page import="com.example.vegetableorder.dao.OperateVegetable" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/6/24
  Time: 10:19
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
                <a href="/Dispatch/to_cart">我的购物车</a>
                <span>|</span>
                <a href="/">返回首页</a>
                <span>|</span>
                <a href="/Dispatch/quit">退出</a>
            </div>
        </div>
    </div>
</div>

<div class="search_bar clearfix">
    <a href="/" class="logo fl"><img src="/images/logo.png"></a>
    <div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;用户中心</div>
</div>

<div class="main_con clearfix">
    <div class="left_menu_con clearfix">
        <h3>用户中心</h3>
        <ul>
            <li><a href="/Dispatch/to_user_center_info">· 个人信息</a></li>
            <li><a href="/Dispatch/to_user_center_order" class="active">· 全部订单</a></li>
            <li><a href="/Dispatch/to_alter_user_info">· 修改信息</a></li>
            <li><a href="/Dispatch/to_alter_address">· 修改地址</a></li>
        </ul>
    </div>
<%
    String username = (String)session.getAttribute("username");
    List<Orders> ordersList = new OperateOrders().getMyOrders(username);
%>
    <div class="right_content clearfix">
        <h3 class="common_title2">全部订单</h3>
        <ul class="order_list_th w978 clearfix">
            <li class="col02 stress">未支付订单</li>
            <li class="col01">数量</li>
            <li class="col02">总价</li>
        </ul>
        <table class="order_list_table w980">
<%
    for (int i = 0; i <ordersList.size() ; i++) {
            Orders order = ordersList.get(i);
            Vegetables vegetable = new OperateVegetable().getOneVeg(order.getVegetablename());
            if(order.getState()==0){%>
                <tr>
                    <td width="55%">
                        <ul class="order_goods_list clearfix">
                            <li class="col01"><img src="<%=vegetable.getImage()%>"></li>
                            <li class="col02"><%=order.getVegetablename()%><em><%=order.getPrice()%>元/500g</em></li>
                            <li class="col03"><%=order.getWeight()%>个</li>
                        </ul>
                    </td>
                    <td width="15%"><%=order.getTotalprice()%>元</td>
                    <td width="15%">待付款</td>
                    <td width="15%"><a href="/Dispatch/to_cart" class="oper_btn">去付款</a></td>
                </tr>
        <%}
    }%>
        </table>
        <%--下面是未付款的订单--%>
        <ul class="order_list_th w978 clearfix">
            <li class="col02 stress">已支付订单</li>
            <li class="col01">数量</li>
            <li class="col02">总价</li>
        </ul>
        <table class="order_list_table w980">
        <%
            for (int i = 0; i <ordersList.size() ; i++) {
                Orders order = ordersList.get(i);
                Vegetables vegetable = new OperateVegetable().getOneVeg(order.getVegetablename());
                if(order.getState()==1){%>
            <tr>
                <td width="55%">
                    <ul class="order_goods_list clearfix">
                        <li class="col01"><img src="<%=vegetable.getImage()%>"></li>
                        <li class="col02"><%=order.getVegetablename()%><em><%=order.getPrice()%>元/500g</em></li>
                        <li class="col03"><%=order.getWeight()%>个</li>
                    </ul>
                </td>
                <td width="15%"><%=order.getTotalprice()%>元</td>
                <td width="15%">已付款</td>
                <td width="15%"><a href="#" class="oper_btn">查看物流</a></td>
                <td width="15%"><a href="/Dispatch/to_remark?vegetablename=<%=order.getVegetablename()%>&order_time=<%=order.getTime()%>" class="oper_btn">去评论</a></td>
            </tr>
        <%}
        }%>
        </table>
    </div>
</div>

</body>
</html>
