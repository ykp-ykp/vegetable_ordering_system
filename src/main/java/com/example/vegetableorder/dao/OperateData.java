package com.example.vegetableorder.dao;


import com.example.vegetableorder.domain.People;
import com.example.vegetableorder.domain.People;
import com.example.vegetableorder.domain.Vegetables;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.List;

@Component
public class OperateData {

    ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    JdbcTemplate jdbcTemplate = new JdbcTemplate(applicationContext.getBean(DataSource.class));
    /*JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbc( DataSource dataSource){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        this.jdbcTemplate = new JdbcTemplate(applicationContext.getBean(dataSource.getClass()));
    }*/


    public List<Vegetables> getAllVeg(){
        return jdbcTemplate.query("select * from vegetables",new BeanPropertyRowMapper<>(Vegetables.class));
    }

    public boolean Insert(People stu){
        try {
            jdbcTemplate.update("insert into student VALUES (?,?)",stu.getName(),stu.getPassword());
        } catch (DataAccessException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public void deleteStu(String id){
        jdbcTemplate.update("delete from student where id=?",id);
    }


}
