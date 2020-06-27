package com.example.vegetableorder.dao;

import com.example.vegetableorder.domain.Orders;
import com.example.vegetableorder.domain.Vegetables;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.util.List;

public class OperateOrders {

    ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    JdbcTemplate jdbcTemplate = new JdbcTemplate(applicationContext.getBean(DataSource.class));


    public List<Orders> getAllOrders(){
        return jdbcTemplate.query("select * from orders",new BeanPropertyRowMapper<>(Orders.class));
    }

    public List<Orders> getUnpaidOrders(String username){
        return jdbcTemplate.query("select * from orders where username = ? and state = '0'",new BeanPropertyRowMapper<>(Orders.class),username);
    }

    public boolean insert(Orders orders){
        try {
            jdbcTemplate.update("insert into orders VALUES (null,?,?,?,?,?,?,?,?)",orders.getUsername(),orders.getVegetablename(),
                    orders.getWeight(),orders.getPrice(),orders.getTotalprice(),orders.getIsmember(),orders.getState(),orders.getTime());
        } catch (DataAccessException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public void delete(String username,String vegetablename,String time){
        jdbcTemplate.update("delete from orders where username=? and vegetablename=? and time=?",username,vegetablename,time);
    }

    public void alter(String time,String weight,String totalprice,String username){
        jdbcTemplate.update("update orders set weight = ? ,totalprice = ?,state = '1' where time = ? and username = ?", weight,totalprice,time,username);
    }

}
