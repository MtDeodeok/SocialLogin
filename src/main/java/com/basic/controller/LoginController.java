package com.basic.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.basic.service.LoginService;
import com.basic.vo.LoginVO;

@Controller
public class LoginController {

	@Autowired
	LoginService loginService;

	@GetMapping("login")
	public String login() {

		return "/login";
	}

	@GetMapping("naverLoginAPI")
	public void loginNaverAPI() {

	}
	
	@RequestMapping(value="naverLoginAPI", produces="application/json;charset=UTF-8", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> naver(@RequestBody HashMap<String, Object> params) {
		HashMap<String,Object> naverProfile = (HashMap<String, Object>) params.get("response");
		System.out.println(naverProfile.get("email"));
		System.out.println(naverProfile.get("name"));

		return params;
	}
	
	@GetMapping("loginNaver")
	public void loginNaver() {

	}
	
	@RequestMapping(value="googleLogin", method=RequestMethod.POST)
	public String google(LoginVO loginVO) {
		System.out.println(loginVO.getName());
		System.out.println(loginVO.getEmail());
		return "/loginGoogle";
	}
	
	@GetMapping("/loginGoogle")
	public void loginGoogle() {
		
	}
	
	@RequestMapping(value="kakaoLogin", method=RequestMethod.POST)
	public String kakao(LoginVO loginVO) {
		System.out.println(loginVO.getName());
		System.out.println(loginVO.getEmail());
		return "/loginKakao";
	}
	
	@GetMapping("/loginKakao")
	public void loginKakao() {
		
	}
}
