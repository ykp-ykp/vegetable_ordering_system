package com.example.vegetableorder.dao;

import com.example.vegetableorder.domain.Administrator;
import com.example.vegetableorder.domain.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.util.List;

public class OperateUser {
    ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    JdbcTemplate jdbcTemplate = new JdbcTemplate(applicationContext.getBean(DataSource.class));

    public List<User> getAllUser(){
        return jdbcTemplate.query("select * from user",new BeanPropertyRowMapper<>(User.class));
    }

    //用于登陆的时候查找信息
    public boolean select(String name,String password){
        List<User> user = jdbcTemplate.query("select * from user where name=? and password=?", new BeanPropertyRowMapper<>(User.class),name,password);
        if(user.size()>=1){
            //成功
            return  true;
        }
        else {
            //未查找到，登录失败
            return false;
        }
    }

    public User getOneUser(String name){
        String sql="select * from user where name = '"+name+"'";
        return jdbcTemplate.queryForObject(sql,new BeanPropertyRowMapper<>(User.class));
    }

    public boolean Insert(User user){
        try {
            jdbcTemplate.update("insert into user VALUES (null,?,?,?,?,0,?,?)",user.getName(),user.getPassword(),user.getPhone(),user.getAddress(),
                    user.getTooltips(),user.getAnswer());
        } catch (DataAccessException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public void delete(String name){
        jdbcTemplate.update("delete from user where name=?",name);
    }
}
