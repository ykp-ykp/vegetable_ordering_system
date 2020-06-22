<%@ page import="java.util.List" %>
<%@ page import="com.example.vegetableorder.domain.Vegetables" %>
<%@ page import="com.example.vegetableorder.dao.OperateVegetable" %>
<%@ page import="com.example.vegetableorder.domain.Recommendation" %>
<%@ page import="com.example.vegetableorder.dao.OperateRecommend" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/6/18
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>天天生鲜-商品详情</title>
<link rel="stylesheet" type="text/css" href="/css/reset.css">
<link rel="stylesheet" type="text/css" href="/css/main.css">
<script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/slide.js"></script>
<script type="text/javascript" src="/js/add_subtract.js"></script>
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
			<div class="login_btn fl">
				<a href="/Dispatch/tologin">登录</a>
				<span>|</span>
				<a href="register.html">注册</a>
			</div>
			<div class="user_link fl">
				<span>|</span>
				<a href="user_center_info.html">用户中心</a>
				<span>|</span>
				<a href="cart.html">我的购物车</a>
				<span>|</span>
				<a href="user_center_order.html">我的订单</a>
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
		<a href="cart.html" class="cart_name fl">我的购物车</a>
		<div class="goods_count fl" id="show_count">1</div>
	</div>
</div>

<div class="navbar_con">
	<div class="navbar clearfix">
		<ul class="navlist fl">
			<li><a href="/Dispatch/toindex">首页</a></li>
		</ul>
	</div>
</div>

<div class="breadcrumb">
	<a href="/Dispatch/toindex">首页</a>
	<span>></span>
	<a href="#">商品详情</a>
</div>

<%--下面是显示某个蔬菜的详细信息，需要从数据库中读取--%>
<div class="goods_detail_con clearfix">
	<%--现货区需要显示的蔬菜的信息--%>
	<%
		//获取要显示的蔬菜的蔬菜名
		String vegetablename = (String)session.getAttribute("vegetablename");
		//从数据库获取该对象
		Vegetables vegetable = new OperateVegetable().getOneVeg(vegetablename);
		System.out.println(vegetable);
	%>
	<div class="goods_detail_pic fl"><img src="<%=vegetable.getImage()%>"></div>

	<div class="goods_detail_list fr">
		<h3>鲜美的<%=vegetable.getName()%></h3>
		<p><%=vegetable.getIntroduction()%></p>
		<div class="prize_bar">
			<span class="show_pirze">¥<a id="price"><%=vegetable.getPrice()%></a></span>
			<span class="show_unit">单  位：500g</span>
			<span class="show_unit">余  量：<%=vegetable.getSurplus()%></span>
		</div>
		<div class="goods_num clearfix">
			<div class="num_name fl">数 量：</div>
			<div class="num_add fl">
				<input type="text" class="num_show fl" value="0" id="weight">
				<a href="#" class="add fr" id="add" onclick="add()">+</a>
				<a href="#" class="minus fr" id="subtract" onclick="subtract()">-</a>
			</div>
		</div>
		<div class="total" >总价：<em id="totalprice">0</em>元</div>
		<div class="operate_btn">
			<a href="javascript:;" class="buy_btn">立即购买</a>
			<a href="javascript:;" class="add_cart" id="add_cart">加入购物车</a>
		</div>
	</div>
</div>


<%--下面是推荐的蔬菜信息，也需要从表中获取并显示出来--%>
<div class="main_wrap clearfix">
	<div class="l_wrap fl clearfix">
		<%
			List<Recommendation> recommendationList = new OperateRecommend().getAllVeg();
		%>
		<div class="new_goods">
			<h3>新品推荐</h3>
			<ul>
				<%
					for (int i=0;i<recommendationList.size();i++){
						Recommendation recommendation = recommendationList.get(i);
						/*如果目前显示的商品就在推荐商品里面，那么就不需要再次推荐*/
						if(!vegetable.getName().equals(recommendation.getVegetablename())){
				%>
				<li>
					<a href="/Dispatch/to_vegetable_info?vegetablename=<%=recommendation.getVegetablename()%>"><img src="<%=recommendation.getImage()%>"></a>
					<h4><a href="/Dispatch/to_vegetable_info?vegetablename=<%=recommendation.getVegetablename()%>"><%=recommendation.getVegetablename()%></a></h4>
					<div class="prize"><%=recommendation.getPrice()%></div>
				</li>
				<%}
					}
				%>
				<%--<li>
					<a href="#"><img src="/images/goods/goods002.jpg"></a>
					<h4><a href="#">玫瑰香葡萄</a></h4>
					<div class="prize">￥16.80</div>
				</li>--%>
			</ul>
		</div>
	</div>

	<div class="r_wrap fr clearfix">
		<ul class="detail_tab clearfix">
			<li class="active">商品介绍</li>
			<li>评论</li>
		</ul>

		<div class="tab_content">
			<dl>
				<dt>商品详情：</dt>
				<dd><%=vegetable.getIntroduction()%></dd>
			</dl>
		</div>

	</div>
</div>
</body>
</html>