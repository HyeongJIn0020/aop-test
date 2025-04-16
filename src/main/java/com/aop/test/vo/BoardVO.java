package com.aop.test.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {
	private int biNum;
	private String biTitle;
	private String biContent;
	private int uiNum;
	private String uiNickName;
	private String credat;
	private String cretim;
	private String lmodat;
	private String lmotim;
	private String active;
	private int page;
	private int offset;
	private int rowCount;
}