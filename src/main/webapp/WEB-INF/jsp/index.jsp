<%@ page import="java.util.List" %>
<%@ page import="com.example.vegetableorder.domain.Vegetables" %>
<%@ page import="com.example.vegetableorder.dao.OperateVegetable" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/6/18
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>天天生鲜-首页</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/js/slide.js"></script>
</head>
<body>

<%
String username = (String) session.getAttribute("username");
if (username==null)
    username="";
%>
<div class="header_con">
    <div class="header">
        <div class="welcome fl">欢迎<b style="color: #5fb42a;font-size: 25px"><%=username%></b>来到天天生鲜!</div>
        <div class="fr">
            <%
                if (username.equals("")){%>
                   <%-- 如果用户未登录，需要显示登录和注册链接--%>
                <div class="login_btn fl">
                     <a href="/Dispatch/tologin">登录</a>
                    <span>|</span>
                    <a href="/Dispatch/toregister">注册</a>
                </div>
            <%}
                else{%>
                    <%--如果用户已登录，需要显示退出链接--%>
            <div class="login_btn fl">
                <a href="/Dispatch/quit">退出</a>
            </div>
            <%}
            %>

            <div class="user_link fl">
                <span>|</span>
                <a href="/Dispatch/to_user_center_info">用户中心</a>
                <span>|</span>
                <a href="/Dispatch/to_cart">我的购物车</a>
                <span>|</span>
                <a href="/Dispatch/to_user_center_order">我的订单</a>
            </div>
        </div>
    </div>
</div>

<div class="search_bar clearfix">
    <a href="/Dispatch/toindex" class="logo fl"><img src="/images/logo.png"></a>
    <div class="search_con fl">
        <input type="text" class="input_text fl" name="" placeholder="搜索商品">
        <input type="button" class="input_btn fr" name="" value="搜索">
    </div>
    <div class="guest_cart fr">
        <a href="#" class="cart_name fl">我的购物车</a>
        <div class="goods_count fl" id="show_count">1</div>
    </div>
</div>


<div class="center_con clearfix">

    <div class="slide fl">
        <ul class="slide_pics">
            <li><img src="/images/slide.jpg" alt="幻灯片"></li>
            <li><img src="/images/slide02.jpg" alt="幻灯片"></li>
            <li><img src="/images/slide03.jpg" alt="幻灯片"></li>
            <li><img src="/images/slide04.jpg" alt="幻灯片"></li>
        </ul>
        <div class="prev"></div>
        <div class="next"></div>
        <ul class="points"></ul>
    </div>
    <div class="adv fl">
        <a href="#"><img src="/images/adv01.jpg"></a>
        <a href="#"><img src="/images/adv02.jpg"></a>
    </div>
</div>


<div class="list_model">

    <%--x下面要显示蔬菜，需要获取数据库的蔬菜信息--%>
        <%
            List<Vegetables> vegetablesList = new OperateVegetable().getAllVeg();
        %>
    <div class="goods_con clearfix">
        <div class="goods_banner fl"><img src="/images/banner01.jpg"></div>
        <ul class="goods_list fl">
            <%
                for (int i=0;i<vegetablesList.size();i++){
                Vegetables vegetables = vegetablesList.get(i);
            %>
                <li>
                    <h4><a href="/Dispatch/to_vegetable_info?vegetablename=<%=vegetables.getName()%>"><%=vegetables.getName()%></a></h4>
                    <a href="/Dispatch/to_vegetable_info?vegetablename=<%=vegetables.getName()%>"><img src="<%=vegetables.getImage()%>"></a>
                    <div class="prize"><%=vegetables.getPrice()%></div>
                </li>
            <%}
            %>
        </ul>
    </div>
</div>
<script type="text/javascript" src="/js/slideshow.js"></script>
<script type="text/javascript">

    BCSlideshow('focuspic');
    var oFruit = document.getElementById('fruit_more');
    var oShownum = document.getElementById('show_count');
    var hasorder = localStorage.getItem('order_finish');
    if(hasorder)
    {
        oShownum.innerHTML = '2';
    }

    oFruit.onclick = function(){
        window.location.href = 'list.jsp';
    }
</script>
</body>
</html>
