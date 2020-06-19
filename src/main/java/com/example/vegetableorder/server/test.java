package com.example.vegetableorder.server;

import com.example.vegetableorder.dao.OperateData;
import com.example.vegetableorder.domain.People;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;

import javax.sql.DataSource;
import java.util.List;

@Controller
public class test {
    OperateData operateData = new OperateData();

    public static void main(String[] args) {
        test test = new test();
        test.select();
    }
    public  void select() {
        System.out.println(operateData.getAllStu());
    }
}
