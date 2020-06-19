package com.example.vegetableorder;

import com.example.vegetableorder.dao.OperateData;
import com.example.vegetableorder.domain.People;
import com.example.vegetableorder.domain.Vegetables;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.util.List;

@SpringBootApplication
public class VegetableorderApplication {

    public static void main(String[] args) {
        SpringApplication.run(VegetableorderApplication.class, args);

        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        DataSource dataSource= applicationContext.getBean(DataSource.class);
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        System.out.println(jdbcTemplate.query("select * from vegetables",new BeanPropertyRowMapper<>(Vegetables.class)));
    }

}
