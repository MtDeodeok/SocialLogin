package com.basic.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.basic.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	LoginService loginService;

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginGET() {

		return "/login";
	}

	@RequestMapping(value = "loginNaver", method = RequestMethod.GET)
	public String loginPOSTNaver(HttpSession session) {

		return "/loginNaver";
	}

	@RequestMapping(value="test", produces="application/json;charset=UTF-8", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> test(@RequestBody HashMap<String, Object> params) {
		System.out.println();
		HashMap<String,Object> test = (HashMap<String, Object>) params.get("response");
		System.out.println(test.get("email"));
		System.out.println(test.get("mobile"));
		System.out.println(test.get("name"));
		return params;
	}
	
}
