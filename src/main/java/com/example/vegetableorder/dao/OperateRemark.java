package com.example.vegetableorder.dao;

import com.example.vegetableorder.domain.Remark;
import com.example.vegetableorder.domain.Vegetables;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.util.List;

public class OperateRemark {
    ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    JdbcTemplate jdbcTemplate = new JdbcTemplate(applicationContext.getBean(DataSource.class));

    public Remark getOneVegetableofMe_remark(String vegetablename,String username,String order_time){
        try {
            return jdbcTemplate.queryForObject("select * from remarks where vegetablename = ? and username = ? and order_time = ?",
                    new BeanPropertyRowMapper<>(Remark.class),vegetablename,username,order_time);
        }catch (Exception e){
            //异常处理，如果还未评论，则找不到该评论对象。让他返回null
            System.out.println("用户还未评论，评论对象置位null");
            return null;
        }

    }

    public List<Remark> getOneVegetable_remark(String vegetablename){
        return jdbcTemplate.query("select * from remarks where vegetablename = ?",new BeanPropertyRowMapper<>(Remark.class),vegetablename);
    }

    public boolean insert(Remark remark){
        try {
            jdbcTemplate.update("insert into remarks VALUES (null,?,?,?,?,?)",remark.getUsername(),
                    remark.getVegetablename(),remark.getRemark_time(),remark.getOrder_time(),remark.getContent());
        } catch (DataAccessException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
