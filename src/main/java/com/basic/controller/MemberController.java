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

	@RequestMapping(value = "/")
	public String index() {

		return "index";
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
		
		if(memberservice.memberCheck(mebervo)==0) {
			// 없는 사용자라고 알려주고, 사용자 등록 할 것인지 물어봄.
			// 사용자 등록 들어갔을때 해당 state가 1인 탈퇴 대기 상태의 경우
			// 복구할 것인지 물어봄?
			System.out.println("없는 사용자");
		}
	}
	
	@GetMapping("login")
	public String login() {

		return "/login";
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "/login";
	}
	
	@GetMapping("naverLoginAPI")
	public void loginNaverAPI() {

	}
	
	@RequestMapping(value="naverLoginAPI", produces="application/json;charset=UTF-8", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> naver(@RequestBody HashMap<String, Object> params,MemberVO membervo,HttpServletRequest request) {
		HashMap<String,Object> naverProfile = (HashMap<String, Object>) params.get("response");
		/*
		 * System.out.println(naverProfile);
		 * System.out.println(naverProfile.get("email"));
		 * System.out.println(naverProfile.get("name"));
		 * System.out.println(naverProfile.get("profile_image"));
		 */
		
		membervo.setEmail((String) naverProfile.get("email"));
		membervo.setName((String) naverProfile.get("name"));
		membervo.setProfile((String) naverProfile.get("profile_image"));
		membervo.setProvider("naver");
		
		HttpSession session = request.getSession();
		session.setAttribute("loginMember", memberservice.myPage(membervo));
		join(membervo);
		
		
		return params;
	}
	
	@PostMapping("deleteMember")
	public String deleteMember(String email, String provider,HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginMember");
		memberservice.deleteMember(email, provider);
		return "login";
	}
	
	@GetMapping("loginNaver")
	public void loginNaver() {

	}
	
	@RequestMapping(value="googleLogin", method=RequestMethod.POST)
	public String google(MemberVO membervo,HttpServletRequest request) {
		
		System.out.println(membervo);
		System.out.println(membervo.getName());
		System.out.println(membervo.getEmail());
		System.out.println(membervo.getProfile());
		 		
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
//		System.out.println(membervo.getName());
//		System.out.println(membervo.getEmail());
		
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
