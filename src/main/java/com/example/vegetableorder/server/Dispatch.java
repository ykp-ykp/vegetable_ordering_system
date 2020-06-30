package com.example.vegetableorder.server;

import org.springframework.boot.web.servlet.server.Session;
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
        session.setAttribute("adminname", null);
        session.removeAttribute("adminname");
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

    @RequestMapping("/to_alter_address")
    public String to_alter_address(HttpSession session, HttpServletRequest request, HttpServletResponse response){
        String username = (String) session.getAttribute("username");
        if(username==null|| username.equals("")){
            request.setAttribute("error","你还未登录，请去登录！" );
            request.setAttribute("pagename","tologin" );
            return "ErroePage";
        }
        else
            return "alter_address";
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

    @RequestMapping("/to_remark")
    public String remark(HttpSession session, HttpServletRequest request){
        String username = (String) session.getAttribute("username");
        session.setAttribute("remark_vegetablename", request.getParameter("vegetablename"));
        session.setAttribute("order_time", request.getParameter("order_time"));
        System.out.println(request.getParameter("vegetablename")+"***********"+request.getParameter("order_time"));
        if(username==null|| username.equals("")){
            request.setAttribute("error","你还未登录，请去登录！" );
            request.setAttribute("pagename","tologin" );
            return "ErroePage";
        }
        else
            return "remark";
    }


    @RequestMapping("/to_admin_center_info")
    public String to_admin_center_info(HttpSession session, HttpServletRequest request){
        String adminname = (String) session.getAttribute("adminname");
        if(notlogin(adminname, "请先登录", "tologin", request))
            return "ErroePage";
        else
            return "admin_center_info";
    }

    @RequestMapping("/to_alter_admin_info")
    public String to_alter_admin_info(HttpSession session, HttpServletRequest request){
        String adminname = (String) session.getAttribute("adminname");
        if(notlogin(adminname, "请先登录", "tologin", request))
            return "ErroePage";
        else
            return "alter_admin_info";
    }

    @RequestMapping("/to_admin_center_allorder")
    public String to_admin_center_allorder(HttpSession session, HttpServletRequest request){
        String adminname = (String) session.getAttribute("adminname");
        if(notlogin(adminname, "请先登录", "tologin", request))
            return "ErroePage";
        else
            return "admin_center_allorder";
    }

    @RequestMapping("/to_admin_center_alluser")
    public String to_admin_center_alluser(HttpSession session, HttpServletRequest request){
        String adminname = (String) session.getAttribute("adminname");
        if(notlogin(adminname, "请先登录", "tologin", request))
            return "ErroePage";
        else
            return "admin_center_alluser";
    }

    @RequestMapping("/to_admin_alter_user")
    public String to_admin_alter_user(HttpSession session, HttpServletRequest request){
        String adminname = (String) session.getAttribute("adminname");
        if(notlogin(adminname, "请先登录", "tologin", request))
            return "ErroePage";
        else
            return "admin_alter_user";
    }

    @RequestMapping("/to_admin_center_allvegetable")
    public String to_admin_center_allvegetable(HttpSession session, HttpServletRequest request){
        String adminname = (String) session.getAttribute("adminname");
        if(notlogin(adminname, "请先登录", "tologin", request))
            return "ErroePage";
        else
            return "admin_center_allvegetable";
    }

    @RequestMapping("/to_admin_alter_vegetable")
    public String to_admin_alter_vegetable(HttpSession session, HttpServletRequest request){
        String adminname = (String) session.getAttribute("adminname");
        if(notlogin(adminname, "请先登录", "tologin", request))
            return "ErroePage";
        else
            return "admin_alter_vegetable";
    }

    @RequestMapping("/to_add_vegetable")
    public String to_add_vegetable(HttpSession session, HttpServletRequest request){
        String adminname = (String) session.getAttribute("adminname");
        if(notlogin(adminname, "请先登录", "tologin", request))
            return "ErroePage";
        else
            return "add_vegetable";
    }


    @RequestMapping("/to_see_remark")
    public String see_remark(HttpSession session, HttpServletRequest request){
        return "vegetable_info_remarks";
    }



    public boolean notlogin(String name,String tooltips,String topage,HttpServletRequest request){
        if(name==null|| name.equals("")){
            request.setAttribute("error",tooltips );
            request.setAttribute("pagename",topage );
            return true;
        }
        else
            return false;
    }

}
