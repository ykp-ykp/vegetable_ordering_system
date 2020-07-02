package com.example.vegetableorder.service;

import com.example.vegetableorder.dao.OperateAdmin;
import com.example.vegetableorder.dao.OperateUser;
import com.example.vegetableorder.dao.OperateVegetable;
import com.example.vegetableorder.domain.Vegetables;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.context.MessageSource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Locale;
import org.springframework.beans.factory.annotation.Autowired;


@org.springframework.stereotype.Controller
@RequestMapping("/Alter")
public class Alter {

    private MessageSource messageSource;
    @Autowired
    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

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

    @RequestMapping("/Alter_address")//再加上电话
    public String Alter_address(HttpSession session, HttpServletRequest request){
        String username = (String) session.getAttribute("username");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        new OperateUser().alter_address(username,address,phone);
        //修改地址返回个人信息界面
        return "redirect:/Dispatch/to_user_center_info";
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
    public String admin_alter_user(HttpServletRequest request){
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
    public String admin_alter_vegetable(MultipartFile file, RedirectAttributes redirectAttributes, Locale locale, HttpServletRequest request){
        String vegetablename = request.getParameter("vegetablename");
        double price = Double.parseDouble(request.getParameter("price"));
        double surplus = Double.parseDouble(request.getParameter("surplus"));
        //String image = request.getParameter("image");
        String introduction = request.getParameter("introduction");
        String image = "/images/goods/";
        //
        try {
            image+=upload_image(file, redirectAttributes,locale ,request );
        } catch (IOException e) {
            e.printStackTrace();
        }
        //
        System.out.println(vegetablename+"---"+price+"---"+ surplus+"---"+image+"---"+introduction);
        new OperateVegetable().alter(vegetablename,price,surplus,image,introduction);

        //修改完之后返回管理员界面
        return "redirect:/Dispatch/to_admin_center_allvegetable";
    }

    @RequestMapping("/to_add_vegetable")
    public String add_vegetable(MultipartFile file, RedirectAttributes redirectAttributes, Locale locale, HttpServletRequest request){
        String vegetablename = request.getParameter("vegetablename");
        double price = Double.parseDouble(request.getParameter("price"));
        double surplus = Double.parseDouble(request.getParameter("surplus"));
        //String image = request.getParameter("image");
        String introduction = request.getParameter("introduction");
        String image = "/images/goods/";
        //
        try {
            image+=upload_image(file, redirectAttributes,locale ,request );
        } catch (IOException e) {
            e.printStackTrace();
        }
        //
        System.out.println(vegetablename+"---"+price+"---"+ surplus+"---"+image+"---"+introduction);
        Vegetables vegetable = new Vegetables(vegetablename,price,0.0,image,surplus,introduction);
        new OperateVegetable().Insert(vegetable);

        //添加完之后返回管理员界面
        return "redirect:/Dispatch/to_admin_center_allvegetable";
    }


    //上传本地文件到/images/goods/目录下，并返回图片名称和后缀（如apple.jpg）
    public String upload_image(MultipartFile file, RedirectAttributes redirectAttributes, Locale locale, HttpServletRequest request) throws IOException {
        System.out.println("file: "+file);
        if(file.isEmpty()){
            redirectAttributes.addFlashAttribute("msg",messageSource.getMessage("file.empty",null,locale));
        }
        redirectAttributes.addFlashAttribute("name",file.getOriginalFilename());
        /*String realPath=request.getServletContext().getRealPath("/WEB-INF/jsp/upload");*/
        //将文件（图片上传到upload文件夹中）
        String realPath=request.getServletContext().getRealPath("/images/goods");
        File destFile=new File(realPath,file.getOriginalFilename());
        // log.debug("{}",destFile);
        if(!destFile.exists()){  //如果该目录下没有这个文件
            //拷贝文件到指定目录
            file.transferTo(destFile);
        }
        return file.getOriginalFilename();
    }



    @RequestMapping("/to_admine_delete_vegetable")
    public String admine_delete_vegetable(HttpServletRequest request){
        String vegetablename = request.getParameter("vegetablename");
        System.out.println(vegetablename);
        new OperateVegetable().delete(vegetablename);

        //删除之后返回管理员界面
        return "redirect:/Dispatch/to_admin_center_allvegetable";
    }




}
