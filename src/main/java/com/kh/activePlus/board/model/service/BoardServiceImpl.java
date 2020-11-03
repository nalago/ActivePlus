package com.kh.activePlus.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.activePlus.board.model.dao.BoardDao;
import com.kh.activePlus.board.model.vo.HosBoard;
import com.kh.activePlus.board.model.vo.Notice;
import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.common.search.Search;
@Service("bService")
public class BoardServiceImpl implements HosBoardService, NoticeService{
	
	@Autowired
	private BoardDao bDao;
	
	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return bDao.selectList(pi);
	}
	
	@Override
	public int getListCount() {
		return bDao.getListCount();
	}

	@Override
	public Notice selectNotice(int nId) {
		return bDao.selectNotice(nId);
	}
	
	@Override
	public Attachment selectAttachment(int refId, String kind) {
		Attachment at = new Attachment();
		at.setRefId(refId+"");
		at.setRefTable(kind);
		// System.out.println("at : " + at);
		return bDao.selectAttachment(at);
	}

	@Override
	public int insertNotice(Notice n, Attachment at) {
		int fResult = 0;
		int nResult = 0;
		
		nResult = bDao.insertNotice(n);
		// System.out.println("nResult:"+nResult);
		at.setRefId(nResult+"");
		if(nResult > 0 && at.getOriginalFile() != null) {
			fResult = bDao.insertFile(at);
		}
		
		return nResult;
	}

	@Override
	public int updateNotice(Notice n, Attachment at) {
		
		int nResult = bDao.updateNotice(n,at);
		int fResult = 0;
		if(at.getOriginalFile() != null) {
			fResult = bDao.updateAttachment(at);
		}
		return nResult;
	}

	@Override
	public int deleteNotice(int nId) {
		return bDao.deleteNotice(nId);
	}

	@Override
	public ArrayList<Notice> searchList(Search s, PageInfo pi) {
		
		return bDao.nSelectSearchList(s, pi);
	}

	@Override
	public ArrayList<HosBoard> bSearchList(Search s, PageInfo pi) {
		return null;
	}

	@Override
	public int getSearchListCount(Search s) {
		return bDao.getnSearchListCount(s);
	}

	@Override
	public int deleteAttachment(Attachment at) {
		return bDao.deleteAttachment(at);
	}
	
	@Override
	public ArrayList<HosBoard> selectTopList(){
		return bDao.selectTopList();
	}
	@Override
	public ArrayList<HosBoard> selectHBList(PageInfo pi){
		return bDao.selectHBList(pi);
	}
	
	@Override
	public int getHBListCount(){
		return bDao.selectHBListCount();
	}

	@Override
	public int insertHB(HosBoard hb) {
		return bDao.insertHB(hb);
	}
	
	@Override
	public HosBoard selectHB(int hbId,boolean flag) {
		if(!flag) 
			bDao.addCount(hbId);
		
		
		return bDao.selectHB(hbId);
	}
	@Override
	public int updateHB(HosBoard hb) {
		return bDao.updateHB(hb);
	}

	@Override
	public int deleteHB(int hbId) {
		return bDao.deleteHB(hbId);
	}

	@Override
	public ArrayList<HosBoard> hbSearchList(Search search, PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getHBSearchListCount(Search s) {
		return bDao.selectHBSearchListCount(s);
	}
	

	
}
