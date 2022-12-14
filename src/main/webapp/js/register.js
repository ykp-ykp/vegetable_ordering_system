var error_name = false;
var error_password = false;
var error_check_password = false;
var error_phone = false;
var error_check = false;

//下面是已添加蔬菜或修改蔬菜信息时候用到的判断
var error_vegetablename = false;
var error_price = false;
var error_surplus = false;
var error_image = false

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


    //针对蔬菜的工能
    $('#vegetablename').blur(function() {
        check_vegetablename();
    });

    $('#price').blur(function() {
        check_price();
    });

    $('#surplus').blur(function() {
        check_surplus();
    });

    $('#image').blur(function() {
        check_image();
    });

    function check_vegetablename() {
        var len = $('#vegetablename').val().length;
        if(len<1||len>20)
        {
            $('#vegetablename').next().html('蔬菜名不能为空')
            $('#vegetablename').next().show();
            error_vegetablename = true;
        }
        else
        {
            $('#vegetablename').next().hide();
            error_vegetablename = false;
        }
    }

    function check_price() {
        var price = $('#price').val();
        price = parseFloat(price);
        if(price>0) {
            $('#price').next().hide();
            error_price = false;
        }
        else {
            $('#price').next().html('价格必须大于0')
            $('#price').next().show();
            error_price = true;
        }
    }

    function check_surplus() {
        var surplus = $('#surplus').val();
        surplus = parseFloat(surplus);
        if(surplus>0) {
            $('#surplus').next().hide();
            error_surplus = false;
        }
        else {
            $('#surplus').next().html('余量必须大于0')
            $('#surplus').next().show();
            error_price = true;
        }
    }
    //针对蔬菜的工能


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
            error_phone = true;
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

function admin_alter_user_checkall(){
    if(error_name == false && error_password == false && error_phone == false)
    {
        alert("修改成功");
        return true;
    }
    else
    {
        console.log("提交失败")
        return false;
    }
}

//检查书否上传图片
function check_image() {
    var fileFlag = false;
    $("input[name='file']").each(function(){
        if($(this).val()!="") {
            fileFlag = true;
        }
    });
    if(!fileFlag) {
        $('#file').next().attr("class","error_tip");
        $('#file').next().html('未选择图片');
        $('#file').next().show();
        alert("请选择图片!");
        return true
    }
    else{
        $('#file').next().attr("class","error_tip3");
        $('#file').next().html('已选择图片');
        $('#file').next().show();
        return false;
    }
}

function admin_alter_vegetable_checkall(){
    var temp = check_image();
    if(error_price == false && error_surplus == false && error_image ==false && temp == false)
    {
        alert("修改成功");
        return true;
    }
    else
    {
        console.log("提交失败")
        return false;
    }
}

function add_vegetable_checkall(){
    var temp = check_image();
    if(error_vegetablename == false && error_price == false && error_surplus == false && error_image ==false && temp == false)
    {
        alert("添加成功");
        return true;
    }
    else
    {
        console.log("添加失败")
        return false;
    }
}