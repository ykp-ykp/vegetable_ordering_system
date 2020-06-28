package com.example.vegetableorder.server;

import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@org.springframework.stereotype.Controller
@RequestMapping("/Dispatch")
public class Dispatch {

    @RequestMapping("/tologin")
    public String login(){
        return "login";
    }

    @RequestMapping("/quit")
    public String quit(HttpSession session){
        //退出时，只需要把session存储的用户名删掉，让在跳转到其他界面的时候无法获取用户即可
        session.setAttribute("username", null);
        session.removeAttribute("username");
        return "redirect:/Dispatch/tologin";
    }

    @RequestMapping("/toindex")
    public String index(){
        return "redirect:/";
    }

    @RequestMapping("/toregister")
    public String register(){
        return "register";
    }

    @RequestMapping("/to_vegetable_info")
    public String to_vegetable_info(HttpSession session, HttpServletRequest request){
        String vegetablename = request.getParameter("vegetablename");
        System.out.println(vegetablename);
        session.setAttribute("vegetablename", vegetablename);
        return "vegetable_info";
    }

    @RequestMapping("/to_user_center_info")
    public String to_user_center_info(HttpSession session, HttpServletRequest request, HttpServletResponse response){
        //这里需要设置一个拦截器，如果用户已登陆，则可以跳转到用户中心，否则不能
        String username = (String) session.getAttribute("username");
        if(username==null|| username.equals("")){
            request.setAttribute("error","你还未登录，请去登录！" );
            request.setAttribute("pagename","tologin" );
            return "ErroePage";
        }
        else
            return "user_center_info";
    }

    @RequestMapping("/to_user_center_order")
    public String to_user_center_order(HttpSession session, HttpServletRequest request, HttpServletResponse response){
        String username = (String) session.getAttribute("username");
        if(username==null|| username.equals("")){
            request.setAttribute("error","你还未登录，请去登录！" );
            request.setAttribute("pagename","tologin" );
            return "ErroePage";
        }
        else
            return "user_center_order";
    }

    @RequestMapping("/to_alter_user_info")
    public String to_alter_user_info(HttpSession session, HttpServletRequest request, HttpServletResponse response){
        String username = (String) session.getAttribute("username");
        if(username==null|| username.equals("")){
            request.setAttribute("error","你还未登录，请去登录！" );
            request.setAttribute("pagename","tologin" );
            return "ErroePage";
        }
        else
            return "alter_user_info";
    }


@RequestMapping("/to_cart")
    public String to_cart(HttpSession session, HttpServletRequest request){
        String username = (String) session.getAttribute("username");
        if(username==null|| username.equals("")){
            request.setAttribute("error","你还未登录，请去登录！" );
            request.setAttribute("pagename","tologin" );
            return "ErroePage";
        }
        else
            return "cart2";
    }

}
