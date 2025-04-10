package com.aop.test;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan
public class AopTestApplication {

	public static void main(String[] args) {
		SpringApplication.run(AopTestApplication.class, args);
	}

}
