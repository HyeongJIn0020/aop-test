package com.aop.test.mapper;

import java.util.List;

import com.aop.test.vo.UserVO;

public interface UserMapper {
	List<UserVO> selectUserList(UserVO user);
	UserVO selectUserByIdAndPwd(UserVO user);
	int insertUser(UserVO user);
}
