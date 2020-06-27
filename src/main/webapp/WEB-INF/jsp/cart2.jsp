<%@ page import="com.example.vegetableorder.domain.Orders" %>
<%@ page import="com.example.vegetableorder.dao.OperateOrders" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.vegetableorder.domain.Vegetables" %>
<%@ page import="com.example.vegetableorder.dao.OperateVegetable" %><%--
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
    <link href="/css/gouwu.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/gouwu.js" ></script>
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
    <a href="/Dispatch/toindex" class="logo fl"><img src="/images/logo.png"></a>
    <div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;购物车</div>
</div>
<%//获取当前用户的所有的未付款的订单
    String username = (String)session.getAttribute("username");
    List<Orders> ordersList = new OperateOrders().getUnpaidOrders(username);
%>

<div id="page">
<div id="listdiv">
   <table width="750" cellpadding="0" cellspacing="0" id="gwcTable">
    <tr>
      <td width="79"><input type="checkbox" id="checkAll" />全选</td>
      <td width="175">商品</td>
      <td width="92">单价</td>
      <td width="201">数量</td>
      <td width="96">总计</td>
      <td width="79">操作</td>
    </tr>

       <%
           for (int i=0;i<ordersList.size();i++){
               Orders order = ordersList.get(i);
               Vegetables vegetable = new OperateVegetable().getOneVeg(order.getVegetablename());
       %>
       <form action="/Purchase/DeleteOrders">
       <tr>
           <td><input type="checkbox" class="checkCss" value="<%=order.getTime()%>"/></td>
           <td><p><img src="<%=vegetable.getImage()%>" /></p><p><%=order.getVegetablename()%></p></td>
           <td><%=order.getPrice()%></td>
           <td class="count"><input class="reduceCss" id="jia1" value="-" type="button"/>
               <input type="text" class="inputCountCss" id="inputCountCss1" name="orderweight" value="<%=order.getWeight()%>" size="8"/>
               <input class="addCss" id="jia2" value="+" type="button"/></td>
                <input type="hidden" name="surplus" value="<%=vegetable.getSurplus()%>"/>
           <td id="stotal3"><%=order.getTotalprice()%></td>
           <input type="hidden" name="price" value="<%=order.getPrice()%>"/>
           <%--<input type="hidden" name="surplus" value="<%=()%>"/>--%>
           <input type="hidden" name="username" value="<%=order.getUsername()%>">
           <input type="hidden" name="vegetablename" value="<%=order.getVegetablename()%>">
           <input type="hidden" name="time" value="<%=order.getTime()%>">
           <td><button type="submit"  class="a">删除</button></td>
       </tr>
       </form>
<%}%>
  </table>
  </div>
  <div id="jiesuan">
    <div class="t jisuanbtn">
        <%--通过script里面获取checkbox是否被选中，如果某一订单被选中，则把这个订单的时间,单位数量，总价加在下面的value值后面。
        之后再在server中获取到这些订单时间在修改这些订单的状态为已付款--%>
        <form action="/Purchase/Pay" method="post" onsubmit="return jiesuan()">
            <input type="hidden" name="everyordertime" id="everyordertime" value="" />
            <input type="hidden" name="everyorderweight" id="everyorderweight" value="" />
            <input type="hidden" name="everyordertotalprice" id="everyordertotalprice" value="" />
            <%--需要结算的蔬菜的名字，在server中来修改该蔬菜的余量--%>
            <input type="hidden" name="everyvegetablename" id="everyvegetablename" value="" />
            <input type="submit" name="btnOrder" id="btnOrder" value="立即结算" />
        </form>
    </div>
    <div class="t TotalMoney">合计：￥<span id="priceTotal">0.00</span></div>
    <div class="t">已选商品 <span id="countTotal">0</span> 件</div>   
  </div>
</div>
</body>
</html>
