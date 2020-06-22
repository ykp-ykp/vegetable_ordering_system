package com.example.vegetableorder.server;

import com.example.vegetableorder.dao.OperateAdmin;
import com.example.vegetableorder.dao.OperateUser;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@org.springframework.stereotype.Controller
@RequestMapping("/Login")
public class Login {
    OperateUser operateUser = new OperateUser();
    OperateAdmin operateAdmin = new OperateAdmin();

    @RequestMapping("/user")
    public String User_Login(HttpSession session, HttpServletRequest request, HttpServletResponse response){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        session.setAttribute("username",username );
        session.setMaxInactiveInterval(10);

        boolean b = operateUser.select(username,password );
        if(b==true){
            //登陆成功
            return "index";
        }
        else {
            //登录失败，这里需要一个提示
            return "login_faild";
        }
    }
}
