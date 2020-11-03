package com.kh.activePlus.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.activePlus.member.model.dao.MemberDao;
import com.kh.activePlus.member.model.vo.Member;
import com.kh.activePlus.member.model.vo.PageInfo;
import com.kh.activePlus.member.model.vo.Search;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Override
	public Member loginMember(Member m) {
		Member loginUser = mDao.selectMember(m);
		System.out.println(loginUser);
		if(loginUser != null &&
				!bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
			loginUser = null;
		}
		return loginUser;
	}

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(m);
	}

	@Override
	public int updateMember(Member m) {
		return 0;
	}

	@Override
	public int selectListCount() {
		return mDao.selectListCount();
	}

	@Override
	public ArrayList<Member> selectList(PageInfo pi) {
		System.out.println(pi);
		return mDao.selectList(pi);
	}

	@Override
	public Member selectMember(String id) {
		return mDao.selectMember(id);
	}

	@Override
	public ArrayList<Member> searchList(Search search) {
		return mDao.searchList(search);
	}

	@Override
	public Member selectMember1(String id) {
		return mDao.selectMember1(id);
	}


}
