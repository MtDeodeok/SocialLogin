package com.basic.service;

import org.apache.ibatis.annotations.Param;

import com.basic.vo.MemberVO;

public interface MemberService {
	void insertMember(MemberVO membervo);
	void deleteMember(String email, String provider);
	MemberVO myPage(MemberVO membervo);
	int memberCheck(MemberVO membervo);
}
