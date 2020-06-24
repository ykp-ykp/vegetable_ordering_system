package com.example.vegetableorder.server;

import ch.qos.logback.core.joran.conditional.ElseAction;
import com.example.vegetableorder.dao.OperateAdmin;
import com.example.vegetableorder.dao.OperateUser;
import com.example.vegetableorder.domain.User;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@org.springframework.stereotype.Controller
@RequestMapping("/Controller")
public class Controller {
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
            request.setAttribute("error","登陆失败" );
            request.setAttribute("pagename","tologin" );
            return "ErroePage";
        }
    }

    @RequestMapping("/toregister")
    public String register(HttpSession session, HttpServletRequest request, HttpServletResponse response){
        String username = request.getParameter("user_name");
        String password = request.getParameter("pwd");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String tooltips = request.getParameter("tooltips");
        String answer = request.getParameter("answer");
        User user = new User(username, password, phone, address, tooltips, answer);
        boolean b = operateUser.Insert(user);  //注册用户
        if (b == true){
            return "login";
        }
        else {
            //注册失败之后
        }
        return "login";
    }
}
