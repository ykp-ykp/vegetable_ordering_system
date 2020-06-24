function check_weight() {
    var weight = $("#weight").val();
    weight = parseFloat(weight);
    if (weight<=0){
        alert("购买数量不正确")
        $('#add_cart').removeAttr('href');//去掉a标签中的href属性
    }
    else{
        $("#add_cart").attr("href","/Purchase/add_cart")
        $("#add_cart").next().hide();
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
             document.getElementById('totalprice').innerHTML = parseFloat(price) * parseFloat(weight+1);
             document.getElementById('Htotalprice').value = parseFloat(price) * parseFloat(weight-1);
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
            document.getElementById('totalprice').innerHTML = parseFloat(price) * parseFloat(weight-1);
            document.getElementById('Htotalprice').value = parseFloat(price) * parseFloat(weight-1);
        }

}
