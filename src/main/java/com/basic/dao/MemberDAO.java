package com.basic.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.basic.vo.MemberVO;

@Mapper
public interface MemberDAO {
	void insertMember(MemberVO membervo);
	void deleteMember(@Param("email") String email, @Param("provider")String provider);
	MemberVO myPage(MemberVO membervo);
	int memberCheck(MemberVO membervo);
}
