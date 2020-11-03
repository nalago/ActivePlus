package com.kh.activePlus.board.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.activePlus.board.model.vo.Notice;
import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.common.search.Search;


public interface NoticeService {
	// 리스트 출력
	public ArrayList<Notice> selectList(PageInfo pi);
	
	public int getListCount();
	
	// 공지사항 디테일
	public Notice selectNotice(int nId);
	
	// 첨부파일 여부확인
	public Attachment selectAttachment(int nId, String kind);
	// 공지사항 작성
	public int insertNotice(Notice n, Attachment at);
	
	// 공지사항 수정
	public int updateNotice(Notice n, Attachment at);
	
	// 공지사항 삭제
	public int deleteNotice(int nId);
	
	// 공지사항 검색
	public ArrayList<Notice> searchList(Search search, PageInfo pi);

	public int getSearchListCount(Search s);

	public int deleteAttachment(Attachment at);
}
