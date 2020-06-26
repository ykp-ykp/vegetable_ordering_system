<%--
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
                <a href="/Dispatch/quit">退出</a>
                <span>|</span>
                <a href="/Dispatch/toindex">返回首页</a>
            </div>
        </div>
    </div>
</div>

<div class="search_bar clearfix">
    <a href="/Dispatch/toindex" class="logo fl"><img src="/images/logo.png"></a>
    <div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;用户中心</div>
</div>

<div class="main_con clearfix">
    <div class="left_menu_con clearfix">
        <h3>用户中心</h3>
        <ul>
            <li><a href="/Dispatch/to_user_center_info" class="active">· 个人信息</a></li>
            <li><a href="/Dispatch/to_user_center_order">· 全部订单</a></li>
        </ul>
    </div>
    <div class="right_content clearfix">
        <h3 class="common_title2">全部订单</h3>
        <ul class="order_list_th w978 clearfix">
            <li class="col01">2016-8-21 17:36:24</li>
            <li class="col02">订单号：56872934</li>
            <li class="col02 stress">未支付</li>
        </ul>

        <table class="order_list_table w980">
            <tbody>
            <tr>
                <td width="55%">
                    <ul class="order_goods_list clearfix">
                        <li class="col01"><img src="/images/goods02.jpg"></li>
                        <li class="col02">嘎啦苹果嘎啦苹果<em>11.80元/500g</em></li>
                        <li class="col03">1</li>
                        <li class="col04">11.80元</li>
                    </ul>
                    <ul class="order_goods_list clearfix">
                        <li class="col01"><img src="/images/goods02.jpg"></li>
                        <li class="col02">嘎啦苹果嘎啦苹果<em>11.80元/500g</em></li>
                        <li class="col03">1</li>
                        <li class="col04">11.80元</li>
                    </ul>
                </td>
                <td width="15%">33.60元</td>
                <td width="15%">待付款</td>
                <td width="15%"><a href="/#" class="oper_btn">去付款</a></td>
            </tr>
            </tbody>
        </table>

        <ul class="order_list_th w978 clearfix">
            <li class="col01">2016-8-21 17:36:24</li>
            <li class="col02">订单号：56872934</li>
            <li class="col02 stress">已支付</li>
        </ul>
        <table class="order_list_table w980">
            <tbody>
            <tr>
                <td width="55%">
                    <ul class="order_goods_list clearfix">
                        <li class="col01"><img src="/images/goods02.jpg"></li>
                        <li class="col02">嘎啦苹果嘎啦苹果<em>11.80元/500g</em></li>
                        <li class="col03">1</li>
                        <li class="col04">11.80元</li>
                    </ul>
                    <ul class="order_goods_list clearfix">
                        <li class="col01"><img src="/images/goods02.jpg"></li>
                        <li class="col02">嘎啦苹果嘎啦苹果<em>11.80元/500g</em></li>
                        <li class="col03">1</li>
                        <li class="col04">11.80元</li>
                    </ul>
                </td>
                <td width="15%">33.60元</td>
                <td width="15%">已付款</td>
                <td width="15%"><a href="/#" class="oper_btn">查看物流</a></td>
            </tr>
            </tbody>
        </table>

        <div class="pagenation">
            <a href="/#">上一页</a>
            <a href="/#" class="active">1</a>
            <a href="/#">2</a>
            <a href="/#">3</a>
            <a href="/#">4</a>
            <a href="/#">5</a>
            <a href="/#">下一页></a>
        </div>
    </div>
</div>

</body>
</html>
