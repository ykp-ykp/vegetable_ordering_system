package com.example.vegetableorder;

import com.example.vegetableorder.domain.Vegetables;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;

@SpringBootApplication
public class VegetableorderApplication {

    public static void main(String[] args) {
        SpringApplication.run(VegetableorderApplication.class, args);
    }

}
