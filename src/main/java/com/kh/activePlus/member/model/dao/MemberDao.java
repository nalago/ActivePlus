package com.kh.activePlus.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.activePlus.member.model.vo.Member;
import com.kh.activePlus.member.model.vo.PageInfo;
import com.kh.activePlus.member.model.vo.Search;

@Repository("mDao")
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public Member selectMember(Member m) {
		return sqlSession.selectOne("memberMapper.selectOne", m);
	}

	public int selectListCount() {
		return sqlSession.selectOne("memberMapper.selectListCount");
	}

	public ArrayList<Member> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getMemberLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getMemberLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectList", null, rowBounds);
	}

	public Member selectMember(String name) {
		return sqlSession.selectOne("memberMapper.selectOne", name);
	}

	public ArrayList<Member> searchList(Search search) {
		return (ArrayList)sqlSession.selectList("memberMapper.searchList", search);
	}

	public Member selectMember1(String id) {
		return sqlSession.selectOne("memberMapper.selectOne1", id);
	}

}
