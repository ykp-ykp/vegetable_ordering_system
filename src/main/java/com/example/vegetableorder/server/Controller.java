package com.example.vegetableorder.server;

import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@org.springframework.stereotype.Controller
@RequestMapping("/Controller")
public class Controller {

    @RequestMapping("/toligin")
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
        System.out.println(vegetablename);
        return "vegetable_info";
    }

}
