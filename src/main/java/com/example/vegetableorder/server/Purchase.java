package com.example.vegetableorder.server;

import com.example.vegetableorder.dao.OperateAdmin;
import com.example.vegetableorder.dao.OperateUser;
import com.example.vegetableorder.dao.OperateVegetable;
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
    OperateUser operateUser = new OperateUser();
    OperateAdmin operateAdmin = new OperateAdmin();

    @RequestMapping("/add_cart")
    public String add_cart(HttpSession session, HttpServletRequest request){
        String username = (String) session.getAttribute("username");
        String vegetablename = (String) session.getAttribute("vegetablename");
        User user = new OperateUser().getOneUser(username);
        Vegetables vegetables = new OperateVegetable().getOneVeg(vegetablename);
        System.out.println(user);
        System.out.println(vegetables);

        //获取不到
        System.out.println(request.getParameter("weight"));//结果为null
        double weight = Double.parseDouble(request.getParameter("weight"));
        double totalprice = Double.parseDouble(request.getParameter("Htotalprice"));
        System.out.println(weight+"--"+totalprice);
        //
        int state = 0;//订单状态
        Date date = new Date();//获取当前的日期
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String time = df.format(date);//获取String类型的时间
        //System.out.println(username+"--"+vegetablename+"--"+weight+"--"+price+"--"+totalprice+"--"+ismember+"--"+state+"--"+time);
        return "index";
    }

}
