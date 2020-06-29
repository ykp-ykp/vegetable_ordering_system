<%@ page import="com.example.vegetableorder.domain.Administrator" %>
<%@ page import="com.example.vegetableorder.dao.OperateAdmin" %>
<%@ page import="com.example.vegetableorder.domain.User" %>
<%@ page import="com.example.vegetableorder.dao.OperateUser" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/6/29
  Time: 12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>天天生鲜-管理员中心</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/js/table_search.js"></script>
</head>
<body>
<%
    String adminname = (String) session.getAttribute("adminname");
    Administrator admin = new OperateAdmin().getOneAdmin(adminname);
    List<User> alluser = new OperateUser().getAllUser();

%>
<div class="header_con">
    <div class="header">
        <div class="fr">
            <div class="user_link fl">
                <a href="/">返回首页</a>
                <span>|</span>
                <a href="/Dispatch/quit">退出</a>
            </div>
        </div>
    </div>
</div>

<div class="search_bar clearfix">
    <a href="/" class="logo fl"><img src="/images/logo.png"></a>
    <div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;管理员中心</div>
</div>

<div class="main_con clearfix">
    <div class="left_menu_con clearfix">
        <h3>用户中心</h3>
        <ul>
            <li><a href="/Dispatch/to_admin_center_info">· 个人信息</a></li>
            <li><a href="/Dispatch/to_alter_admin_info">· 修改密码</a></li>
            <li><a href="/Dispatch/to_admin_center_allorder">· 全部订单</a></li>
            <li><a href="/Dispatch/to_admin_center_alluser" class="active">· 用户信息</a></li>
            <li><a href="/Dispatch/to_admin_center_allvegetable">· 蔬菜信息</a></li>
        </ul>
    </div>
    <div class="right_content clearfix">
        <input type="text" id="lin" class="admin_search_user" placeholder="请输入需要搜索的内容">
        <table id="table-1" cellspacing='0' border="1" class="order_list_table w980">
            <tr>
                <th>用户名</th>
                <th>密码</th>
                <th>电话</th>
                <th>地址</th>
                <th>密保问题</th>
                <th>答案</th>
            </tr>
            <%
                for (int i = 0; i < alluser.size(); i++) {
                    User user = alluser.get(i);%>
            <form action="/Dispatch/to_admin_alter_user" method="post">
                <input type="hidden" name="altered_username" value="<%=user.getName()%>">
                <tr>
                    <td><%=user.getName()%></td>
                    <td><%=user.getPassword()%></td>
                    <td><%=user.getPhone()%></td>
                    <td><%=user.getAddress()%></td>
                    <td><%=user.getTooltips()%></td>
                    <td><%=user.getAnswer()%></td>
                    <td><button type="submit" id="searchuser" name="searchuser">修改</button></td>
                </tr>
            </form>
            <%}
            %>
        </table>
    </div>
</div>





<script type="text/javascript">
    var table = document.getElementById("table-1");
    var input = document.getElementById("lin")
    input.onkeyup = function () {
        new Search(table, input)
    }
</script>
</body>
</html>