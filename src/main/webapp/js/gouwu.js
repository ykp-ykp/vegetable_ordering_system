// JavaScript Document
window.onload = function demo() {
	//找到全选框
	oCheckBoxAll = document.getElementById("checkAll");
	//找到全选框
	oCheck = document.getElementsByClassName("checkCss");
	//找到所有订单数量
	allSelectOrder = document.getElementsByName("orderweight");
	//获取所有订单中的蔬菜名
    everyvegetablename = document.getElementsByName("vegetablename");
	//找到每一个订单的蔬菜的单价
    price = document.getElementsByName("price");
    //找到每一种蔬菜的余量
	surplus = document.getElementsByName("surplus");
	//定义总共数量以及总金额
	var totalCount = 0;
	var totalMoney = 0;
	//找到显示数量和金额的元素
	var priceTotal = document.getElementById("priceTotal");
	var countTotal = document.getElementById("countTotal");
	//找到数量输入框的值
	var oInputCount = document.getElementsByClassName("inputCountCss");
	//获取表格元素的值
	var otab = document.getElementById("gwcTable");
	var otr = document.getElementsByTagName("tr");
	//加减按钮元素
	var oBtn_jian = document.getElementsByClassName("reduceCss");
	var oBtn_jia = document.getElementsByClassName("addCss");
	//删除
	var oDel = document.getElementsByClassName("a");
	//获取结算按钮id
	var orderBtn = document.getElementById("btnOrder");
	//判断全选按钮是否勾选
	var flag = 0; 


	//数组selectorder存储选中的订单的时间,并传到jsp页面的值中，再传递到server中
	function getselectorder() {
		var lenght = oCheck.length;
        var selectorder = new Array(lenght);
        for(i = 0; i < oCheck.length; i++) {
            if(oCheck[i].checked) {
                selectorder[i] = oCheck[i].value;
            }
            else
                selectorder[i] = "";
        }
        document.getElementById("everyordertime").value = selectorder;
        geteveryweight();
        /*var selectorder = "";
        for(i = 0; i < oCheck.length; i++) {
            if(oCheck[i].checked) {
                var ordertime = oCheck[i].value;
                selectorder += (ordertime+",");
                document.getElementById("selectvegetable").value = selectorder;
            }
        }*/
    }

    function geteveryweight() {
        var lenght = allSelectOrder.length;  //订单列表长
        var orderweight = new Array(lenght);  //用于储存每一个订单的蔬菜数量
        var everyordertotalprice = new Array(lenght);  //用于储存每一个订单的蔬菜的单价
        for(i = 0; i < allSelectOrder.length; i++) {
        	orderweight[i] = allSelectOrder[i].value;
            everyordertotalprice[i] = parseFloat(price[i].value)*parseFloat(orderweight[i]);
        }
        document.getElementById("everyorderweight").value = orderweight;
        document.getElementById("everyordertotalprice").value = everyordertotalprice;
        geteveryvegetablename();
    }

    function geteveryvegetablename() {
        var length = everyvegetablename.length;
        var vegetablename = new Array(length);
        for (var i = 0; i < length; i++) {
            vegetablename[i] = everyvegetablename[i].value;
        }
        document.getElementById("everyvegetablename").value = vegetablename;
    }

    //单击全选按钮函数
	function Fcheck() {
		if(oCheckBoxAll.checked == true) {
			for(i = 0; i < oCheck.length; i++) {
				if(!oCheck[i].checked) { //判断单选框是否已经选中,不然价格和数量会重复加
					oCheck[i].checked = true;
					flag+=1;
					totalCount += parseFloat(oInputCount[i].value);
					totalMoney += parseFloat(otr[i + 1].cells[4].innerText);
				}
            }
		} else {
			for(i = 0; i < oCheck.length; i++) {
				oCheck[i].checked = false;
				flag = 0;
			}
			totalCount = 0;
			totalMoney = 0;
		}
		Spantotal();
        getselectorder();
	}
	//显示总金额和总件数函数
	function Spantotal() {
		countTotal.innerHTML = totalCount;
		priceTotal.innerHTML = totalMoney;
	}
	//单选按钮函数
	function check() {
		for(i = 0; i < oCheck.length; i++) {
			if(this == oCheck[i]) {
				index = i;
				break;
			}
		}
		if(oCheck[index].checked) {
			totalCount += parseFloat(oInputCount[index].value);
			totalMoney += parseFloat(oInputCount[index].value) * parseFloat(otr[index + 1].cells[2].innerText);
			flag+= 1;
		} else {
			totalCount -= parseFloat(oInputCount[index].value);
			totalMoney -= parseFloat(oInputCount[index].value) * parseFloat(otr[index + 1].cells[2].innerText);
			flag-= 1;
		}
		if(flag==oCheck.length){
			oCheckBoxAll.checked=true;
		}
		else{
			oCheckBoxAll.checked=false;
		}
		Spantotal();
        getselectorder();
	}

	//减按钮功能函数
	function jian() {
		for(i = 0; i < oBtn_jian.length; i++) {
			if(this == oBtn_jian[i]){
				index = i;
				break;
			}
		}
		if(oInputCount[index].value > 1) {
			oInputCount[index].value = oInputCount[index].value - 1;
			otr[index+1].cells[4].innerText = [parseFloat(oInputCount[index].value) * parseFloat(otr[index+1].cells[2].innerText)];
			if(oCheck[index].checked && oInputCount[index].value >= 1) {
				totalCount -= 1;
				totalMoney -= parseFloat(otr[index+1].cells[2].innerText);
				Spantotal();
			}
		}
		else
            alert("数量不能小于1！");
        geteveryweight();
	}
	//加按钮功能函数
	function jia() {
		for(i = 0; i < oBtn_jian.length; i++) {
			if(this == oBtn_jia[i]){
				index = i;
				break;
			}
		}

        /*这里需要限制一下蔬菜的订购数量不能大于余量*/
		if (oInputCount[index].value >= parseFloat(surplus[i].value)){
            alert("余量不足！");
            oInputCount[index].value = surplus[i].value;
            otr[index+1].cells[4].innerText = parseFloat(oInputCount[index].value) * parseFloat(otr[index+1].cells[2].innerText);
		}

		else{
            oInputCount[index].value = +(oInputCount[index].value) + 1;
            otr[index+1].cells[4].innerText = parseFloat(oInputCount[index].value) * parseFloat(otr[index+1].cells[2].innerText);
            if(oCheck[index].checked) {
                totalCount += 1;
                totalMoney += parseFloat(otr[index+1].cells[2].innerText);
                Spantotal();
            }
		}
        geteveryweight();
	}
	function jiesuan(){
		if(flag!=0){
			alert("结算成功！")
			return true;
		}
		else{
			alert("请至少选择一件商品结算");
			return false;
		}
	}
	oCheckBoxAll.onclick = Fcheck;			//调用全选函数
	for(i = 0; i < oCheck.length; i++)
		oCheck.item(i).onclick = check; 	//调用单选函数
	for(i = 0; i < oDel.length; i++)	
	//oDel.item(i).onclick = shanChu;			//调用删除函数
	for(i = 0; i < oBtn_jian.length; i++)	//调用减
		oBtn_jian.item(i).onclick = jian;
	for(i = 0; i < oBtn_jia.length; i++)	//调用加
		oBtn_jia.item(i).onclick = jia;
	orderBtn.onclick=jiesuan;				//调用结算函数
}