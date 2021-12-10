package com.basic.service;

import java.time.LocalDate;

import org.springframework.stereotype.Service;

import com.basic.dao.MemberDAO;
import com.basic.vo.MemberVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	private final MemberDAO memberdao;
	
	LocalDate now = LocalDate.now();
	
	@Override
	public void insertMember(MemberVO membervo) {
		membervo.setRegistDate(now);
		memberdao.insertMember(membervo);
	}

	@Override
	public int memberCheck(MemberVO membervo) {
		
		return memberdao.memberCheck(membervo);
	}

	@Override
	public MemberVO myPage(MemberVO membervo) {
		
		return memberdao.myPage(membervo);
	}
	
}
