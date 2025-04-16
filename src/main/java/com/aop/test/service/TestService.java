package com.aop.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aop.test.mapper.TestMapper;
import com.aop.test.vo.TestVO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class TestService {
	@Autowired
	private TestMapper testMapper;
	
	public PageInfo<TestVO> getTestList(TestVO test){
		if(test.getRowCount()==0) {
			test.setRowCount(10);
		}
		PageHelper.startPage(test.getPage(), test.getRowCount());
		List<TestVO> list = testMapper.selectTestList(test);
		return new PageInfo<>(list, 10);
	}
}
