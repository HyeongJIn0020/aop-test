package com.aop.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RestController;

import com.aop.test.service.TestService;
import com.aop.test.vo.TestVO;
import com.github.pagehelper.PageInfo;

@RestController
public class TestController {
	@Autowired
	private TestService testService;
	
	@GetMapping("/tests")
	public PageInfo<TestVO> getTestList(@ModelAttribute TestVO test){
		return testService.getTestList(test);
	}
}
