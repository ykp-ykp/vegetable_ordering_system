<%@ page import="com.example.vegetableorder.domain.Orders" %>
<%@ page import="com.example.vegetableorder.dao.OperateOrders" %>
<%@ page import="com.example.vegetableorder.domain.Vegetables" %>
<%@ page import="com.example.vegetableorder.dao.OperateVegetable" %>
<%@ page import="com.example.vegetableorder.domain.Remark" %>
<%@ page import="com.example.vegetableorder.dao.OperateRemark" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/6/30
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--下面引用外部js没有用，所哟js我就写在了最下面--%>
    <link rel="stylesheet" type="text/css" href="/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/js/register.js"></script>

</head>
<body>
<div class="register_con" style="margin-left: 300px">
    <div class="l_con fl">
        <a class="reg_logo"><img src="/images/logo02.png"></a>
        <div class="reg_slogan">足不出户  ·  新鲜每一天</div>
        <div class="reg_banner"></div>
    </div>
<%
    String username = (String) session.getAttribute("username");
    String vegetablename = (String) session.getAttribute("remark_vegetablename");
    String order_time = (String) session.getAttribute("order_time");
    Orders order = new OperateOrders().getOneOrder(username,vegetablename,order_time);
    Vegetables vegetable = new OperateVegetable().getOneVeg(vegetablename);
%>
    <%
        Remark remark = new OperateRemark().getOneVegetableofMe_remark(vegetablename,username ,order_time );
        String content = "";
        if (remark!=null)
            content = remark.getContent();
    %>

    <div class="r_con fr">
        <div class="reg_title clearfix">
            <h1 style="font-size: 16px">评价商品</h1>
        </div>
        <%--把要评论的订单显示出来--%>
        <table class="order_list_table" style="width: 750px;height: 63px;">
            <tr>
                <td width="55%">
                    <ul class="order_goods_list clearfix">
                        <li class="col01"><img src="<%=vegetable.getImage()%>"></li>
                        <li class="col02"><%=order.getVegetablename()%><em><%=order.getPrice()%>元/500g</em></li>
                        <li class="col03"><%=order.getWeight()%>个</li>
                    </ul>
                </td>
                <td width="15%"><%=order.getTotalprice()%>元</td>
                <td width="15%">已收货</td>
                <td width="15%"><%=order.getTime()%></td>
            </tr>
        </table>

        <%--下面那个隐藏矿用于储存当前订单的评论内容，如果为空，则用户可以进行评论。否则不可再次评论。（在下面的jquery中处理）--%>
        <input type="hidden" id="content" value="<%=content%>">

        <div class="reg_form clearfix">
            <form action="/Purchase/remark" method="post" id="reg_form" onsubmit="return check()">
                <ul>
                    <li>
                        <label>评价:</label>
                        <textarea name="remark" id="remark" style="width: 288px;height: 70px "></textarea>
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li class="reg_sub">
                        <input type="submit"  value="确 定" name="submit" id="submit">
                    </li>
                </ul>
            </form>
        </div>
    </div>

</div>
<script>
    $(function () {
        var content = $('#content').val();
        if (content.length>0){
            //如果已经存评论内容
            $('#remark').attr("readonly","readonly")
            $('#remark').val(content);
            $('#remark').next().html("已经评论过了，无法修改评论")
            $('#remark').next().show();
            $('#submit').attr("type","button");
            return false;
        }
        else{
            return true;
        }
    })

    function check() {
        var tooltips =  $('#remark').next().html();
        if(tooltips.indexOf("已经评论过了，无法修改评论")>=0){
            return false;
        }
        else{
            alert("评论成功");
            return true;
        }
    }
</script>
</body>
</html>
