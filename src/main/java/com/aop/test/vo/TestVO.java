package com.aop.test.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TestVO {
	private int tiNum;
	private String tiName;
	private String tiDesc;
	private int tiAge;
	private int page;
	private int rowCount;
}
