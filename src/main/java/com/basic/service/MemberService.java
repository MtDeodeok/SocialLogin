package com.basic.service;

import com.basic.vo.MemberVO;

public interface MemberService {
	void insertMember(MemberVO membervo);
	MemberVO myPage(MemberVO membervo);
	int memberCheck(MemberVO membervo);
}
