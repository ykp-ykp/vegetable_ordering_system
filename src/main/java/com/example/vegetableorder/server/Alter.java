package com.example.vegetableorder.server;

import com.example.vegetableorder.dao.OperateAdmin;
import com.example.vegetableorder.dao.OperateUser;
import com.example.vegetableorder.dao.OperateVegetable;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@org.springframework.stereotype.Controller
@RequestMapping("/Alter")
public class Alter {

    @RequestMapping("/Alteruser")
    public String Alteruser(HttpSession session, HttpServletRequest request){
        String username = (String) session.getAttribute("username");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String tooltips = request.getParameter("tooltips");
        String answer = request.getParameter("answer");
        new OperateUser().alter(username, password, phone, address, tooltips,answer);
        //修改密码之后让用户自动退出，并返回登录界面
        session.setAttribute("username", null);
        session.removeAttribute("username");
        return "redirect:/Dispatch/tologin";
    }

    @RequestMapping("/Alteradmin")
    public String Alteradmin(HttpSession session, HttpServletRequest request){
        String adminname = (String) session.getAttribute("adminname");
        String password = request.getParameter("password");

        new OperateAdmin().alterpwd(adminname,password);
        //修改密码之后让管理员自动退出，并返回登录界面
        session.setAttribute("adminname", null);
        session.removeAttribute("adminname");
        return "redirect:/Dispatch/tologin";
    }

    @RequestMapping("/to_admin_alter_user")
    public String admin_alter_user(HttpSession session, HttpServletRequest request){
        String username = request.getParameter("username");
        String password = request.getParameter("pwd");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String tooltips = request.getParameter("tooltips");
        String answer = request.getParameter("answer");
        System.out.println(username+"---"+password+"---"+ phone+"---"+address+"---"+tooltips+"---"+answer);
        new OperateUser().alter(username, password, phone, address, tooltips,answer);

        //修改完之后返回管理员界面
        return "redirect:/Dispatch/to_admin_center_alluser";
    }

    @RequestMapping("/to_admin_alter_vegetable")
    public String admin_alter_vegetable(HttpSession session, HttpServletRequest request){
        String vegetablename = request.getParameter("vegetablename");
        double price = Double.parseDouble(request.getParameter("price"));
        double surplus = Double.parseDouble(request.getParameter("surplus"));
        String image = request.getParameter("image");
        String introduction = request.getParameter("introduction");


        System.out.println(vegetablename+"---"+price+"---"+ surplus+"---"+image+"---"+introduction);
        new OperateVegetable().alter(vegetablename,price,surplus,image,introduction);

        //修改完之后返回管理员界面
        return "redirect:/Dispatch/to_admin_center_allvegetable";
    }


}
