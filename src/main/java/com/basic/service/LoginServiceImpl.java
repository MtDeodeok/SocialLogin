package com.basic.service;

import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

	@Override
	public String login() {
		String test = "로그인테스트 준비";
		return test;
	}

}
