package com.basic.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.basic.service.MemberService;
import com.basic.vo.MemberVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService memberservice;

	@GetMapping("/")
	public void index() {
		
	}
	
	@GetMapping("/join")
	public void join() {
		
	}
	
	@PostMapping("/join")
	public void join(MemberVO membervo) {
		
		if(memberservice.memberCheck(membervo)==0) {
			memberservice.insertMember(membervo);
		}
		
	}
	
	@GetMapping("/myPage")
	public void myPage(MemberVO mebervo) {
		
	}
	
	@GetMapping("login")
	public String login() {

		return "/login";
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.getAttribute("loginMember");
		session.removeAttribute("loginMember");
		
		return "/login";
	}
	
	@GetMapping("naverLoginAPI")
	public void loginNaverAPI() {

	}
	
	@RequestMapping(value="naverLoginAPI", produces="application/json;charset=UTF-8", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> naver(@RequestBody HashMap<String, Object> params,MemberVO membervo,HttpServletRequest request) {
		HashMap<String,Object> naverProfile = (HashMap<String, Object>) params.get("response");
		System.out.println(naverProfile.get("email"));
		System.out.println(naverProfile.get("name"));
		
		membervo.setEmail((String) naverProfile.get("email"));
		membervo.setName((String) naverProfile.get("name"));
		membervo.setProvider("naver");
		
		HttpSession session = request.getSession();
		session.setAttribute("loginMember", memberservice.myPage(membervo));
		
		join(membervo);
		
		
		return params;
	}
	
	@PostMapping("naverJoin")
	public String naver(MemberVO membervo) {
		System.out.println(membervo.getName());
		System.out.println(membervo.getEmail());
		
		return "loginNaver";
	}
	
	@GetMapping("loginNaver")
	public void loginNaver() {

	}
	
	@RequestMapping(value="googleLogin", method=RequestMethod.POST)
	public String google(MemberVO membervo,HttpServletRequest request) {
		System.out.println(membervo.getName());
		System.out.println(membervo.getEmail());
		
		membervo.setProvider("google");
		
		HttpSession session = request.getSession();
		session.setAttribute("loginMember", memberservice.myPage(membervo));
		
		join(membervo);
		
		return "/loginGoogle";
	}
	
	@GetMapping("/loginGoogle")
	public void loginGoogle() {
		
	}
	
	@RequestMapping(value="kakaoLogin", method=RequestMethod.POST)
	public String kakao(MemberVO membervo,HttpServletRequest request) {
		System.out.println(membervo.getName());
		System.out.println(membervo.getEmail());
		
		membervo.setProvider("kakao");
	
		HttpSession session = request.getSession();
		session.setAttribute("loginMember", memberservice.myPage(membervo));
		
		join(membervo);
		
		return "/loginKakao";
	}
	
	@GetMapping("/loginKakao")
	public void loginKakao() {
		
	}
}
