package com.example.vegetableorder.server;

import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@org.springframework.stereotype.Controller
@RequestMapping("/Dispatch")
public class Dispatch {

    @RequestMapping("/tologin")
    public String login(){
        return "login";
    }

    @RequestMapping("/toindex")
    public String index(){
        return "index";
    }

    @RequestMapping("/to_vegetable_info")
    public String to_vegetable_info(HttpSession session, HttpServletRequest request){
        String vegetablename = request.getParameter("vegetablename");
        session.setAttribute("vegetablename", vegetablename);
        return "vegetable_info";
    }
}
