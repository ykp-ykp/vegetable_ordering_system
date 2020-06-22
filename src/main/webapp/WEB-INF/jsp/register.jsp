<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2020/6/22
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>天天生鲜-注册</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>
    <%--下面引用外部js没有用，所哟js我就写在了最下面--%>
    <%--<script type="text/javascript" src="/js/register.js"></script>--%>
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
            <h1>用户注册</h1>
        </div>
        <div class="reg_form clearfix">
            <form action="/Controller/toregister" method="post">
                <ul>
                    <li>
                        <label>用户名:</label>
                        <input type="text" name="user_name" id="user_name">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>密码:</label>
                        <input type="password" name="pwd" id="pwd">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>确认密码:</label>
                        <input type="password" name="cpwd" id="cpwd">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>手机号:</label>
                        <input type="text" name="phone" id="phone">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>地址:</label>
                        <input type="text" name="address" id="address">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>密保问题:</label>
                        <input type="text" name="tooltips" id="tooltips">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>密保答案:</label>
                        <input type="text" name="answer" id="answer">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li class="agreement">
                        <input type="checkbox" name="allow" id="allow" checked="checked">
                        <label>同意”天天生鲜用户使用协议“</label>
                        <span class="error_tip2">提示信息</span>
                    </li>
                    <li class="reg_sub">
                        <input type="submit"  value="注 册" name="" id="sumbit">
                    </li>
                </ul>
            </form>
        </div>

    </div>

</div>
<script>
    $(function(){

        var error_name = false;
        var error_password = false;
        var error_check_password = false;
        var error_phone = false;
        var error_check = false;


        $('#user_name').blur(function() {
            check_user_name();
        });

        $('#pwd').blur(function() {
            check_pwd();
        });

        $('#cpwd').blur(function() {
            check_cpwd();
        });

        $('#phone').blur(function() {
            check_phone();
        });

        $('#allow').click(function() {
            if($(this).is(':checked'))
            {
                error_check = false;
                $(this).siblings('span').hide();
            }
            else
            {
                error_check = true;
                $(this).siblings('span').html('请勾选同意');
                $(this).siblings('span').show();
            }
        });


        function check_user_name(){
            var len = $('#user_name').val().length;
            if(len<1||len>20)
            {
                $('#user_name').next().html('请输入非0个字符的用户名')
                $('#user_name').next().show();
                error_name = true;
            }
            else
            {
                $('#user_name').next().hide();
                error_name = false;
            }
        }

        function check_pwd(){
            var len = $('#pwd').val().length;
            if(len<6||len>20)
            {
                $('#pwd').next().html('密码最少6位，最长20位')
                $('#pwd').next().show();
                error_password = true;
            }
            else
            {
                $('#pwd').next().hide();
                error_password = false;
            }
        }


        function check_cpwd(){
            var pass = $('#pwd').val();
            var cpass = $('#cpwd').val();

            if(pass!=cpass)
            {
                $('#cpwd').next().html('两次输入的密码不一致')
                $('#cpwd').next().show();
                error_check_password = true;
            }
            else
            {
                $('#cpwd').next().hide();
                error_check_password = false;
            }

        }

        function check_phone(){
            var re = /^1[3456789]\d{9}$/;
            if(re.test($('#phone').val()))
            {
                $('#phone').next().hide();
                error_phone = false;
            }
            else
            {
                $('#phone').next().html('你输入的手机号格式不正确')
                $('#phone').next().show();
                error_check_password = true;
            }

        }


        $('#submit').submit(function() {
            check_user_name();
            check_pwd();
            check_cpwd();
            check_phone();

            if(error_name == false && error_password == false && error_check_password == false && error_phone == false && error_check == false)
            {
                return true;
            }
            else
            {
                return false;
            }

        });

    })
</script>
</body>
</html>
