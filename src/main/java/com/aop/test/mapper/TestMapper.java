package com.aop.test.mapper;

import java.util.List;

import com.aop.test.vo.TestVO;

public interface TestMapper {
	List<TestVO> selectTestList(TestVO test);
}
