function check_weight() {
    var username = $("#username").val();
    var weight = $("#weight").val();
    weight = parseFloat(weight);
    if (weight<=0){
        alert("购买数量不正确");
        return false;
    }
    else if (username==""){
        alert("用户未登录！");
        return false;
    }
    else
        {
        alert("加入购物车成功！");
        return true
    }

}

function check_weight_buy() {
    var username = $("#username").val();
    var weight = $("#weight").val();
    weight = parseFloat(weight);
    if (weight<=0){
        alert("购买数量不正确");
        return false;
    }
    else if (username==""){
        alert("用户未登录！");
        return false;
    }
    else{
        alert("购买成功！");
        return true
    }

}


/*购物车出的加号和减号的处理*/
function add(){
         var price = document.getElementById('price').innerHTML; //获取id是td的html文本内容
         var weight = document.getElementById('weight').value;
         var surplus = document.getElementById("surplus").value;
         weight=parseFloat(weight);
         surplus=parseFloat(surplus);
         if (weight<surplus){
             document.getElementById('weight').value = weight + 1;
             /*下面两个时提交的表单里的两个数据type为hidden*/
             document.getElementById('form_weight_directbuy').value = weight+1;//直接购买的表单
             document.getElementById('form_weight').value = weight+1;//加入购物车的表单
             document.getElementById('totalprice').innerHTML = parseFloat(price) * parseFloat(weight+1);

             //直接购买的表单
             document.getElementById('form_totalprice_directbuy').value = parseFloat(price) * parseFloat(weight+1);
             //加入购物车的表单
             document.getElementById('form_totalprice').value = parseFloat(price) * parseFloat(weight+1);
         }
         else{
             alert("余量不足！");
         }

    }

function subtract() {
        var price = document.getElementById('price').innerHTML; //获取id是td的html文本内容
        var weight = document.getElementById('weight').value;
        weight=parseFloat(weight);
        if(weight<=0){
            alert("数量不能小于0");
            document.getElementById('weight').value = 0;
        }
        else{
            document.getElementById('weight').value = weight - 1;
            document.getElementById('form_weight_directbuy').value = weight-1;//直接购买的表单
            document.getElementById('form_weight').value = weight-1;//加入购物车的表单
            document.getElementById('totalprice').innerHTML = parseFloat(price) * parseFloat(weight-1);
            //document.getElementById('Htotalprice').value = parseFloat(price) * parseFloat(weight+1);

            //直接购买的表单
            document.getElementById('form_totalprice_directbuy').value = parseFloat(price) * parseFloat(weight-1);
            //加入购物车的表单
            document.getElementById('form_totalprice').value = parseFloat(price) * parseFloat(weight-1);
        }

}
