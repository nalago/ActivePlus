package com.kh.activePlus.board.model.service;

import java.util.ArrayList;

import com.kh.activePlus.board.model.vo.HosBoard;
import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.common.search.Search;

public interface HosBoardService {

	public ArrayList<HosBoard> bSearchList(Search search, PageInfo pi);

	public ArrayList<HosBoard> selectTopList();

	public ArrayList<HosBoard> selectHBList(PageInfo pi);

	public int getHBListCount();

	public int insertHB(HosBoard hb);

	// 게시글 수정
	public int updateHB(HosBoard hb);

	// 게시글 삭제
	public int deleteHB(int nId);

	// 게시글 검색
	public ArrayList<HosBoard> hbSearchList(Search search, PageInfo pi);

	public int getHBSearchListCount(Search s);

	public HosBoard selectHB(int hbId, boolean flag);

}
