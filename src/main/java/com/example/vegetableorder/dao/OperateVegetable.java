package com.example.vegetableorder.dao;

import com.example.vegetableorder.domain.Vegetables;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.List;

@Component
public class OperateVegetable {

    ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    JdbcTemplate jdbcTemplate = new JdbcTemplate(applicationContext.getBean(DataSource.class));


    public List<Vegetables> getAllVeg(){
        return jdbcTemplate.query("select * from vegetables",new BeanPropertyRowMapper<>(Vegetables.class));
    }

    public Vegetables getOneVeg(String name){
        return jdbcTemplate.queryForObject("select * from vegetables where name = ?",new BeanPropertyRowMapper<>(Vegetables.class),name);
    }

    public boolean Insert(Vegetables vegetables){
        try {
            jdbcTemplate.update("insert into vegetables VALUES (null,?,?,?,?,?,?)",vegetables.getName(),vegetables.getPrice(),vegetables.getDiscount(),
                    vegetables.getImage(),vegetables.getSurplus(),vegetables.getIntroduction());
        } catch (DataAccessException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public void delete(String name){
        jdbcTemplate.update("delete from vegetables where name=?",name);
    }

    public void alterprice(String name,double price){
        jdbcTemplate.update("update vegetables set price = ? where name=?",price,name);
    }

    public void altersurplus(String name,double surplus){
        jdbcTemplate.update("update vegetables set surplus = ? where name=?",surplus,name);
    }

}
