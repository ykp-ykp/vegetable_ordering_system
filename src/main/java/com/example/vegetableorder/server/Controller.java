package com.example.vegetableorder.server;

import org.springframework.web.bind.annotation.RequestMapping;


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

}
