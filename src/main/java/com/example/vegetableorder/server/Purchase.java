package com.example.vegetableorder.server;

import com.example.vegetableorder.dao.OperateOrders;
import com.example.vegetableorder.dao.OperateUser;
import com.example.vegetableorder.dao.OperateVegetable;
import com.example.vegetableorder.domain.Orders;
import com.example.vegetableorder.domain.User;
import com.example.vegetableorder.domain.Vegetables;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.text.SimpleDateFormat;

@org.springframework.stereotype.Controller
@RequestMapping("/Purchase")
public class Purchase {

    OperateVegetable operateVegetable = new OperateVegetable();

    @RequestMapping("/add_cart")
    public String add_cart(HttpSession session, HttpServletRequest request){
        String username = (String) session.getAttribute("username");
        if(username==null|| username.equals("")){
            request.setAttribute("error","你还未登录，请去登录！" );
            request.setAttribute("pagename","toindex" );
            return "ErroePage";
        }
        else{
            int state = Integer.parseInt(request.getParameter("state")); //订单状态
            /*如果订单状态是1说明是直接购买的，所以request.getParameter应该从直接购买提交过来的表单取数据
            * 否则应从加入购物车表单提交过来的数据*/
            String vegetablename = (String) session.getAttribute("vegetablename");
            double weight=0;
            double totalprice=0;
            if(state==0){
                weight = Double.parseDouble(request.getParameter("form_weight"));
                totalprice = Double.parseDouble(request.getParameter("form_totalprice"));
            }
            else{
                weight = Double.parseDouble(request.getParameter("form_weight_directbuy"));
                totalprice = Double.parseDouble(request.getParameter("form_totalprice_directbuy"));
            }

            User user = new OperateUser().getOneUser(username);
            Vegetables vegetables = new OperateVegetable().getOneVeg(vegetablename);
            System.out.println(user);
            double price = vegetables.getPrice();

            int ismember = user.getIsmember();
            Date date = new Date();//获取当前的日期
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
            String time = df.format(date);//获取String类型的时间

            try {
                Orders orders = new Orders(username,vegetablename,weight,price,totalprice,ismember,state,time);
                new OperateOrders().insert(orders);
               /* 更新蔬菜余量（不更新了，只有在结账的时候才会更新）*/
            } catch (Exception e) {
                session.setAttribute("tooltips","加入购物车失败！" );
                e.printStackTrace();
            }

            return "redirect:/";
        }

    }

    @RequestMapping("/directbuy")
    public String directbuy(HttpSession session, HttpServletRequest request){
        add_cart(session,request );
        return "redirect:/";
    }

    @RequestMapping("/DeleteOrders")
    public String DeleteOrders(HttpSession session, HttpServletRequest request){
        String username = request.getParameter("username");
        String vegetablename = request.getParameter("vegetablename");
        String time = request.getParameter("time");
        new OperateOrders().delete(username,vegetablename ,time );

        //删除之后需要把余量加进去（不需要了）
        //我改成了只有结账才需要加减，加入购车不加减
        return "cart2";
    }

    @RequestMapping("/Pay")
    public String Pay(HttpSession session, HttpServletRequest request){
        //获取需要结算的订单的时间，单位数量，总价钱
        String everyordertime = request.getParameter("everyordertime");
        String everyorderweight = request.getParameter("everyorderweight");
        String everyordertotalprice = request.getParameter("everyordertotalprice");
        String everyvegetablename = request.getParameter("everyvegetablename");

        String[] everyordertimeArray = everyordertime.split(",");
        String[] everyorderweightArray = everyorderweight.split(",");
        String[] everyordertotalpriceArray = everyordertotalprice.split(",");
        String[] everyvegetablenameArray = everyvegetablename.split(",");
        String username = (String)session.getAttribute("username");

        OperateOrders operateOrders = new OperateOrders();
        for (int i = 0; i < everyordertimeArray.length; i++) {
            if (everyordertimeArray[i]!=null&&!everyordertimeArray[i].equals("")){
                String time = everyordertimeArray[i];
                String weight = everyorderweightArray[i];
                String totalprice = everyordertotalpriceArray[i];
                operateOrders.alter(time,weight,totalprice,username);
                //结账之后把购买的蔬菜从余量中减去
                double surplus =operateVegetable.getOneVeg(everyvegetablenameArray[i]).getSurplus();
                operateVegetable.altersurplus(everyvegetablenameArray[i], surplus-Double.parseDouble(weight));
            }
        }

        return "redirect:/";
    }
}
