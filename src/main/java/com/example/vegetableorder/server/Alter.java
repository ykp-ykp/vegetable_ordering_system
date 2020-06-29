package com.example.vegetableorder.server;

import com.example.vegetableorder.dao.OperateAdmin;
import com.example.vegetableorder.dao.OperateUser;
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

}
