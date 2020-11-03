package com.kh.activePlus.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.activePlus.board.model.vo.HosBoard;
import com.kh.activePlus.board.model.vo.Notice;
import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.common.search.Search;

@Repository("bDao")
public class BoardDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	public int insertNotice(Notice n) {
		sqlSession.insert("boardMapper.insertNotice", n);
		return n.getNoticeId();
	}
	
	/* 파일 업로드 */
	public int insertFile(Attachment at) {
		return sqlSession.insert("boardMapper.insertAttachment", at);
	}
	
	/*공지사항 리스트*/
	public ArrayList<Notice> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds);
	}
	public int getListCount() {
		return sqlSession.selectOne("boardMapper.getListCount");
	}

	/*공지사항 디테일*/
	public Notice selectNotice(int nId) {
		return sqlSession.selectOne("boardMapper.selectNotice", nId);
	}
	public Attachment selectAttachment(Attachment at) {
		return sqlSession.selectOne("boardMapper.selectAttachment", at);
	}

	/*공지사항 삭제*/
	public int deleteNotice(int nId) {
		return sqlSession.update("boardMapper.deleteNotice",nId);
	}

	public int updateNotice(Notice n, Attachment at) {
		return sqlSession.update("boardMapper.updateNotice", n);
	}

	public int updateAttachment(Attachment at) {
		return sqlSession.update("boardMapper.updateAttachment", at);
	}
	public int deleteAttachment(Attachment at) {
		return sqlSession.update("boardMapper.deleteAttachment",at);
	}

	public ArrayList<Notice> nSelectSearchList(Search s, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.searchList", s, rowBounds);
	}
	public ArrayList<HosBoard> bSelectSearchList(Search s, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.searchList", s, rowBounds);
	}

	public int getnSearchListCount(Search s) {
		return sqlSession.selectOne("boardMapper.getSearchCount",s);
	}

	public ArrayList<HosBoard> selectTopList() {
		return (ArrayList)sqlSession.selectList("boardMapper.selectTopList");
	}

	public ArrayList<HosBoard> selectHBList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectHBList",null,rowBounds);
	}

	public int selectHBListCount() {
		return sqlSession.selectOne("boardMapper.getHBListCount");
	}

	public int insertHB(HosBoard hb) {
		return sqlSession.insert("boardMapper.insertHB",hb);
	}

	public HosBoard selectHB(int hbId) {
		return sqlSession.selectOne("boardMapper.selectHB", hbId);
	}

	public int updateHB(HosBoard hb) {
		return sqlSession.update("boardMapper.updateHB",hb);
	}

	public int deleteHB(int hbId) {
		return sqlSession.delete("boardMapper.deleteHB",hbId);
	}

	public void addCount(int hbId) {
		sqlSession.update("boardMapper.addCount",hbId);
	}

	public int selectHBSearchListCount(Search s) {
		return sqlSession.selectOne("boardMapper.HBSearchCount", s);
	}
	
	
}
