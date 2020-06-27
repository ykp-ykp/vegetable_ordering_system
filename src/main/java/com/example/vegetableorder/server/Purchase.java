package com.example.vegetableorder.server;

import com.example.vegetableorder.dao.OperateAdmin;
import com.example.vegetableorder.dao.OperateOrders;
import com.example.vegetableorder.dao.OperateUser;
import com.example.vegetableorder.dao.OperateVegetable;
import com.example.vegetableorder.domain.Orders;
import com.example.vegetableorder.domain.User;
import com.example.vegetableorder.domain.Vegetables;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.text.SimpleDateFormat;

@org.springframework.stereotype.Controller
@RequestMapping("/Purchase")
public class Purchase {

    @RequestMapping("/add_cart")
    public String add_cart(HttpSession session, HttpServletRequest request, HttpServletResponse response){
        String username = (String) session.getAttribute("username");
        if(username==null|| username.equals("")){
            request.setAttribute("error","你还未登录，请去登录！" );
            request.setAttribute("pagename","toindex" );
            return "ErroePage";
        }
        else{
            String vegetablename = (String) session.getAttribute("vegetablename");
            double weight = Double.parseDouble(request.getParameter("form_weight"));
            User user = new OperateUser().getOneUser(username);
            Vegetables vegetables = new OperateVegetable().getOneVeg(vegetablename);
            System.out.println(user);
            double price = vegetables.getPrice();
            double totalprice = Double.parseDouble(request.getParameter("form_totalprice"));
            int ismember = user.getIsmember();
            int state = 0;//订单状态
            Date date = new Date();//获取当前的日期
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
            String time = df.format(date);//获取String类型的时间

            try {
                Orders orders = new Orders(username,vegetablename,weight,price,totalprice,ismember,state,time);
                new OperateOrders().insert(orders);
                //session.setAttribute("tooltips","加入购物车成功！" );
            } catch (Exception e) {
                session.setAttribute("tooltips","加入购物车失败！" );
                e.printStackTrace();
            }

            //System.out.println(username+"--"+vegetablename+"--"+weight+"--"+price+"--"+totalprice+"--"+ismember+"--"+state+"--"+time);
            return "index";
        }

    }

    @RequestMapping("/DeleteOrders")
    public String DeleteOrders(HttpSession session, HttpServletRequest request){
        String username = request.getParameter("username");
        String vegetablename = request.getParameter("vegetablename");
        String time = request.getParameter("time");
        new OperateOrders().delete(username,vegetablename ,time );
        return "cart2";
    }

    @RequestMapping("/Pay")
    public String Pay(HttpSession session, HttpServletRequest request){
        //获取需要结算的订单的时间，单位数量，总价钱
        String everyordertime = request.getParameter("everyordertime");
        String everyorderweight = request.getParameter("everyorderweight");
        String everyordertotalprice = request.getParameter("everyordertotalprice");

        String[] everyordertimeArray = everyordertime.split(",");
        String[] everyorderweightArray = everyorderweight.split(",");
        String[] everyordertotalpriceArray = everyordertotalprice.split(",");
        String username = (String)session.getAttribute("username");

        OperateOrders operateOrders = new OperateOrders();
        for (int i = 0; i < everyordertimeArray.length; i++) {
            if (everyordertimeArray[i]!=null&&!everyordertimeArray[i].equals("")){
                String time = everyordertimeArray[i];
                String weight = everyorderweightArray[i];
                String totalprice = everyordertotalpriceArray[i];
                operateOrders.alter(time,weight,totalprice,username);
            }
        }

        return "index";
    }
}
