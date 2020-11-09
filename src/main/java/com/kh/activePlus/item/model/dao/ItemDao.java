package com.kh.activePlus.item.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.item.model.vo.Item;

@Repository("iDao")
public class ItemDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int count(int i_div) {
		
		return sqlSession.selectOne("itemMapper.count", i_div);
	}
	
	public List<Item> listAll(Item item) {
		return sqlSession.selectList("itemMapper.listAll", item);
	}

	public int searchCount(Item item) {
		return sqlSession.selectOne("itemMapper.searchCount", item);
	}

	public Item detailItem(int i_no) {
		return sqlSession.selectOne("itemMapper.detailItem", i_no);
	}
	
	
	public Attachment detailImg(Attachment img) {
		return sqlSession.selectOne("itemMapper.detailImg", img);
	}

	public Attachment detailPdf(Attachment pdf) {
		return sqlSession.selectOne("itemMapper.detailPdf", pdf);
	}

	public int iIdCheck(Item param) {
		return sqlSession.selectOne("itemMapper.iIdCheck",param);
	}

	// 소모품 등록
	public int enrollItem(Item i) {
		sqlSession.insert("itemMapper.enrollItem", i);
		return i.getI_no();
	}
	// 의약품 등록
	public int enrollMedi(Item i) {
		sqlSession.insert("itemMapper.enrollItem", i);
		sqlSession.insert("itemMapper.enrollMedi", i);
		return i.getI_no();
	}
	
	// 첨부파일 등록
	public int enrollFile(Attachment at) {
		return sqlSession.insert("itemMapper.enrollFile", at); 
	}

	

	public int updateFile(Attachment at) {
		return sqlSession.update("itemMapper.updateFile",at);
	}
	
	public int updateItem(Item i) {
		return sqlSession.update("itemMapper.updateItem", i);
	}
	
	public int updateMedi(Item i) {
		sqlSession.update("itemMapper.updateItem", i);
		return sqlSession.update("itemMapper.updateMedi",i);
	}

	public int selectCount(int i_no) {
		return sqlSession.selectOne("itemMapper.fileCount", i_no);
	}

	
	
	


	
	

}
