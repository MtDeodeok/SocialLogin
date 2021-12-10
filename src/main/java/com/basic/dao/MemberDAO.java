package com.basic.dao;

import org.apache.ibatis.annotations.Mapper;

import com.basic.vo.MemberVO;

@Mapper
public interface MemberDAO {
	void insertMember(MemberVO membervo);
	MemberVO myPage(MemberVO membervo);
	int memberCheck(MemberVO membervo);
}
