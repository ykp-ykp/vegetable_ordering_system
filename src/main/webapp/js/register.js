var error_name = false;
var error_password = false;
var error_check_password = false;
var error_phone = false;
var error_check = false;

$(function(){

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
            $('#user_name').next().html('用户名不能为空')
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
        console.log("在检查电话号码")
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

})

function checkall(){
    if(error_name == false && error_password == false && error_check_password == false && error_phone == false && error_check == false)
    {
        alert("注册成功");
        return true;
    }
    else
    {
        console.log("提交失败")
        return false;
    }
}
