var error_password = false;
var error_check_password = false;
var error_phone = false;

$(function(){


    $('#password').blur(function() {
        check_pwd();
    });

    $('#currentpassword').blur(function() {
        check_currentpwd();
    });

    $('#phone').blur(function() {
        check_phone();
    });



    function check_pwd(){
        var len = $('#password').val().length;
        if(len<6||len>20)
        {
            $('#password').next().html('密码最少6位，最长20位')
            $('#password').next().show();
            error_password = true;
        }
        else
        {
            $('#password').next().hide();
            error_password = false;
        }
    }


    function check_currentpwd(){
        var correctpwd = $('#correctpwd').val();
        var currentpassword = $('#currentpassword').val();

        if(correctpwd!=currentpassword)
        {
            $('#currentpassword').next().html('密码不正确')
            $('#currentpassword').next().show();
            error_check_password = true;
        }
        else
        {
            $('#currentpassword').next().hide();
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
            error_phone = true;
        }

    }

})

function checkall(){
    if(error_password == false && error_check_password == false && error_phone == false)
    {
        alert("修改成功");
        return true;
    }
    else
    {
        return false;
    }
}

/*因为管理员只可以修改密码，所以只需要判断密码格式是否正确和检验当前输入的密码与数据库中的是否相同*/
function checkall_admin(){
    if(error_password == false && error_check_password == false)
    {
        alert("修改成功");
        return true;
    }
    else
    {
        return false;
    }
}

function checkall_phone() {
    if (error_phone == false){
        alert("修改成功");
        return true;
    }
    else
        return false;
}