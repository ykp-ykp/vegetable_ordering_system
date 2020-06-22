package com.example.vegetableorder.dao;

import com.example.vegetableorder.domain.Recommendation;
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
public class OperateRecommend {

    ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
    JdbcTemplate jdbcTemplate = new JdbcTemplate(applicationContext.getBean(DataSource.class));
    /*JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbc( DataSource dataSource){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        this.jdbcTemplate = new JdbcTemplate(applicationContext.getBean(dataSource.getClass()));
    }*/


    public List<Recommendation> getAllVeg(){
        return jdbcTemplate.query("select * from recommendation",new BeanPropertyRowMapper<>(Recommendation.class));
    }

    public Recommendation getOneVeg(String name){
        return jdbcTemplate.queryForObject("select * from recommendation where name = ?",new BeanPropertyRowMapper<>(Recommendation.class),name);
    }

    public boolean Insert(Recommendation recommendation){
        try {
            jdbcTemplate.update("insert into vegetables VALUES (?,?,?,?)",recommendation.getVegetableid(),recommendation.getVegetablename(),recommendation.getImage(),recommendation.getPrice());
        } catch (DataAccessException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public void delete(String name){
        jdbcTemplate.update("delete from recommendation where name=?",name);
    }


}
