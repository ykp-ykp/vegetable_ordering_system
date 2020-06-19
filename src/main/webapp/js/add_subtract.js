

/*购物车出的加号和减号的处理*/
function add(){
         var price = document.getElementById('price').innerHTML; //获取id是td的html文本内容
         var weight = document.getElementById('weight').value;
         weight=parseFloat(weight);
         document.getElementById('weight').value = weight + 1;
         document.getElementById('totalprice').innerHTML = parseFloat(price) * parseFloat(weight+1);

    }

function subtract() {
        var price = document.getElementById('price').innerHTML; //获取id是td的html文本内容
        var weight = document.getElementById('weight').value;
        weight=parseFloat(weight);
        if(weight==0){
            alert("数量不能够小于0")
        }
        else{
            document.getElementById('weight').value = weight - 1;
            document.getElementById('totalprice').innerHTML = parseFloat(price) * parseFloat(weight-1);
        }

}