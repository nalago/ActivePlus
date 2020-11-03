package com.kh.activePlus.member.model.service;

import java.util.ArrayList;

import com.kh.activePlus.member.model.vo.Member;
import com.kh.activePlus.member.model.vo.PageInfo;
import com.kh.activePlus.member.model.vo.Search;

public interface MemberService {
	
	public Member loginMember(Member m);

	public int insertMember(Member m);

	public int updateMember(Member m);

	public int selectListCount();

	public ArrayList<Member> selectList(PageInfo pi);

	public Member selectMember(String id);

	public ArrayList<Member> searchList(Search search);

	public Member selectMember1(String id);


}
