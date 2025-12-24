package com.gomonth;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.gomonth.dao")
public class GomonthApplication {
    public static void main(String[] args) {
        SpringApplication.run(GomonthApplication.class, args);
    }
}
