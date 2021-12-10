package com.basic.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
public class MemberVO {
	private int idx;
	private String email;
	private String name;
	private String provider;
	private LocalDate registDate;
	private int grade;
}
