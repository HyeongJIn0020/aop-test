package com.aop.test.config;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.aop.test.interceptor.AuthInterceptor;

import lombok.extern.slf4j.Slf4j;

//@Configuration
@Slf4j
@PropertySource("classpath:etc.properties")
public class AuthConfig implements WebMvcConfigurer{
	@Autowired
	private AuthInterceptor authInterceptor;
	@Value("${exclude.patterns}")
	private List<String> excludePatterns;
	
	@Override
	public void addInterceptors(InterceptorRegistry reg) {
		log.info("excludePatterns=>{}", excludePatterns);
		reg.addInterceptor(authInterceptor)
		.addPathPatterns("/**")
		.excludePathPatterns(excludePatterns);
	}
}
