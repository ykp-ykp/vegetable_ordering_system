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
<title>天天生鲜-商品详情</title>
<link rel="stylesheet" type="text/css" href="/css/reset.css">
<link rel="stylesheet" type="text/css" href="/css/main.css">
<script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/slide.js"></script>
</head>
<body>
<div class="header_con">
	<div class="header">
		<div class="welcome fl">欢迎来到天天生鲜!</div>
		<div class="fr">
			<div class="login_info fl">
				欢迎您：<em>张 山</em>
			</div>
			<div class="login_btn fl">
				<a href="login.html">登录</a>
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
	<a href="#">首页</a>
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
		<p>草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。</p>
		<div class="prize_bar">
			<span class="show_pirze">¥<a id="price"><%=vegetable.getPrice()%></a></span>
			<span class="show_unit">单  位：500g</span>
		</div>
		<div class="goods_num clearfix">
			<div class="num_name fl">数 量：</div>
			<div class="num_add fl">
				<input type="text" class="num_show fl" value="0" id="weight">
				<a href="#" class="add fr" id="add">+</a>
				<a href="#" class="minus fr" id="subtract">-</a>
			</div>
		</div>
		<div class="total" >总价：<em id="totalprice">0</em>元</div>
		<div class="operate_btn">
			<a href="javascript:;" class="buy_btn">立即购买</a>
			<a href="javascript:;" class="add_cart" id="add_cart">加入购物车</a>
		</div>
	</div>
</div>

<div class="main_wrap clearfix">
	<div class="l_wrap fl clearfix">
		<div class="new_goods">
			<h3>新品推荐</h3>
			<ul>
				<li>
					<a href="#"><img src="/images/goods/goods001.jpg"></a>
					<h4><a href="#">进口柠檬</a></h4>
					<div class="prize">￥3.90</div>
				</li>
				<li>
					<a href="#"><img src="/images/goods/goods002.jpg"></a>
					<h4><a href="#">玫瑰香葡萄</a></h4>
					<div class="prize">￥16.80</div>
				</li>
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
				<dd>草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。 </dd>
			</dl>
		</div>

	</div>
</div>

<script type="text/javascript">
    window.onload=function(){
        var price = document.getElementById('price').innerHTML; //获取id是td的html文本内容
        document.getElementById('add').onclick = function(){
            var weight = document.getElementById('weight').value;
            weight=parseFloat(weight);
            document.getElementById('weight').value = weight + 1;
            document.getElementById('totalprice').innerHTML = parseFloat(price) * parseFloat(weight+1);
        }
        document.getElementById('subtract').onclick = function(){
            var weight = document.getElementById('weight').value;
            weight=parseFloat(weight);
            if(weight==0){
                alert("数量不能够小于0")
			}
			else{
                document.getElementById('weight').value = weight - 1;
                document.getElementById('totalprice').innerHTML = parseFloat(price) * parseFloat(weight-1);
			}
        }

    }
</script>
</body>
</html>