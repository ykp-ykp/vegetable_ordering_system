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
    <link rel="stylesheet" type="text/css" href="/css/chosen.css">
    <script type="text/javascript" src="js/jquery-1.7.1.js"></script>
    <script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/chosen.jquery.js"></script>
</head>
<body>

<%
    String username = (String) session.getAttribute("username");
    if (username==null)
        username="";

    /*一下几行是判断返回到index页面是否有要显示弹框的信息*/
    String tooltips = (String) session.getAttribute("tooltips");
    if (tooltips!=null&&(!tooltips.equals(""))){%>
<script>
    alert("<%=tooltips%>");
</script>
<%
        /*输出一次就要及时删除，以免之后重复输出*/
        session.setAttribute("tooltips","" );
        session.removeAttribute("tooltips");
    }
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
<%List<Vegetables> vegetablesList = new OperateVegetable().getAllVeg();%>

<div class="search_bar clearfix">
    <a href="/" class="logo fl"><img src="/images/logo.png"></a>
    <form action="/Dispatch/to_vegetable_info" method="post" onsubmit="return search()">
        <div class="search_con fl">
            <select data-placeholder="搜索商品"  style="width:400px !important;height: 32px" id="dept" name="dept" class="dept_select">
                <option value=""></option>
                <%
                    for (int i = 0; i < vegetablesList.size(); i++) {
                        Vegetables vegetable = vegetablesList.get(i);%>
                <option value="<%=vegetable.getName()%>"><%=vegetable.getName()%></option>
                <%}
                %>
            </select>
            <input type="hidden" value="" id="searchvegetable" name="vegetablename">
            <input type="submit"  class="input_btn fr" id="tosearch" value="搜索"/>
        </div>
    </form>
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
    <div style="height: 270px">
        <a href="#"><img src="/images/banner05.jpg"></a>
    </div>
</div>


<div class="list_model">

    <%--x下面要显示蔬菜，需要获取数据库的蔬菜信息--%>
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
<script>
    $(function(){
        $('.dept_select').chosen();
    });
    function search() {
        var vegetablename = $('#dept').val();
        $('#searchvegetable').val(vegetablename);
        return true;
    }
</script>
</body>
</html>
