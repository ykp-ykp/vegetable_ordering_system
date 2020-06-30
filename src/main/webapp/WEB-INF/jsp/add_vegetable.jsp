<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/6/30
  Time: 9:21
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
<div class="register_con">
    <div class="l_con fl">
        <a class="reg_logo"><img src="/images/logo02.png"></a>
        <div class="reg_slogan">足不出户  ·  新鲜每一天</div>
        <div class="reg_banner"></div>
    </div>

    <div class="r_con fr">
        <div class="reg_title clearfix">
            <h1>添加蔬菜</h1>
        </div>
        <div class="reg_form clearfix">
            <form action="/Alter/to_add_vegetable" method="post" onsubmit="return add_vegetable_checkall()" id="reg_form">
                <ul>
                    <li>
                        <label>蔬菜名:</label>
                        <input type="text" name="vegetablename" id="vegetablename" value="">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>价格:</label>
                        <input type="text" name="price" id="price" value="" >
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>余量:</label>
                        <input type="text" name="surplus" id="surplus" value="" placeholder="">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>简介:</label>
                        <textarea name="introduction" id="introduction" style="width: 288px;height: 50px "></textarea>
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>图片地址:</label>
                        <input type="text" name="image" id="image" value="/images/goods/图片名.jpg" placeholder="">
                        <span class="error_tip3">只能修改图片名称哦</span>
                    </li>
                    <li class="reg_sub">
                        <input type="submit"  value="确 定" name="submit" id="submit">
                    </li>
                </ul>
            </form>
        </div>
    </div>

</div>
</body>
</html>