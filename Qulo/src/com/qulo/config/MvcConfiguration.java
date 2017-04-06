package com.qulo.config;

import javax.sql.DataSource;

import com.qulo.dao.*;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
 
@Configuration
@ComponentScan(basePackages="net.codejava.spring")
@EnableWebMvc
public class MvcConfiguration extends WebMvcConfigurerAdapter{
 
    @Bean
    public DataSource getDataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://qulo.cw6pvfptyedu.us-west-2.rds.amazonaws.com:3306/qulo");
        dataSource.setUsername("isdesign");
        dataSource.setPassword("texasamgrp10");
         
        return dataSource;
    }
     
    @Bean
    public UserDAO getUserDAO() {
        return new UserDAOImpl(getDataSource());
    }
    
    @Bean
    public CompatibilityQuestionDAO getQuestionDAO() {
        return new CompatibilityQuestionDAOImpl(getDataSource());
    }
}
