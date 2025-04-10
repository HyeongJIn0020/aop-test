package com.aop.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aop.test.mapper.UserMapper;
import com.aop.test.vo.UserVO;

@Service
public class UserService {
	@Autowired
	private UserMapper userMapper;
	
	public UserVO login(UserVO user) {
		return userMapper.selectUserByIdAndPwd(user);
	}
	public int join(UserVO user) {
		return userMapper.insertUser(user);
	}
}
