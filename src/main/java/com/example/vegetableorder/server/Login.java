package com.example.vegetableorder.server;

import com.example.vegetableorder.dao.OperateAdmin;
import com.example.vegetableorder.dao.OperateUser;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@org.springframework.stereotype.Controller
@RequestMapping("/Login")
public class Login {
    OperateUser operateUser = new OperateUser();
    OperateAdmin operateAdmin = new OperateAdmin();

    @RequestMapping("/tologin")
    public String User_Login(HttpSession session, HttpServletRequest request, HttpServletResponse response){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        session.setAttribute("username",username );
        session.setMaxInactiveInterval(600);

        //获取复选框的admin是否选中，如果选中就作为管理员的登录
        String isadmin = request.getParameter("admin");
        if (isadmin==null)
            isadmin="";

        boolean b;
        if(isadmin.equals("isadmin")){
            b = operateAdmin.select(username,password );
        }else{
            b = operateUser.select(username,password );
        }

        if(b==true){
            if(isadmin.equals("isadmin"))
                return "admin_functions";
            else
                //登陆成功
                return "index";
        }
        else {
            //登录失败，这里需要一个提示
            return "login_faild";
        }
    }
}
