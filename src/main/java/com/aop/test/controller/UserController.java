package com.aop.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.aop.test.service.UserService;
import com.aop.test.vo.UserVO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class UserController {
	@Autowired
	private UserService userService; 
	
	@PostMapping("/user/login")
	public UserVO login(@RequestBody UserVO user, HttpSession session) {
		log.info("param=>{}", user);
		UserVO loginUser = userService.login(user);
		session.setAttribute("user", loginUser);
		return loginUser;
	}
	@PostMapping("/user/join")
	public int join(@RequestBody UserVO user) {
		log.info("param => {}", user);
		return userService.join(user);
	}
}
