package com.example.vegetableorder.dao;

import com.example.vegetableorder.domain.Administrator;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.util.List;

public class OperateAdmin {
    ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    JdbcTemplate jdbcTemplate = new JdbcTemplate(applicationContext.getBean(DataSource.class));

    public List<Administrator> getAllAdmin(){
        return jdbcTemplate.query("select * from adminuser",new BeanPropertyRowMapper<>(Administrator.class));
    }

    //用于登陆的时候查找信息
    public boolean select(String name,String password){
        List<Administrator> administrators = jdbcTemplate.query("select * from adminuser where name=? and password=?", new BeanPropertyRowMapper<>(Administrator.class),name,password);
        if(administrators.size()>=1){
            //成功
            return  true;
        }
        else {
            //未查找到，登录失败
            return false;
        }
    }

    public Administrator getOneAdmin(String name){
        return jdbcTemplate.queryForObject("select * from adminuser where name = ?",new BeanPropertyRowMapper<>(Administrator.class),name);
    }

    //这个几乎不用
    public boolean Insert(Administrator administrator){
        try {
            jdbcTemplate.update("insert into adminuser VALUES (null,?,?)",administrator.getName(),administrator.getPassword());
        } catch (DataAccessException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public void delete(String name){
        jdbcTemplate.update("delete from adminuser where name=?",name);
    }

    public void alterpwd(String name,String password){
        jdbcTemplate.update("update adminuser set password = ? where name=?",password,name);
    }
}
