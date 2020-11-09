package com.kh.activePlus.item.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.item.model.dao.ItemDao;
import com.kh.activePlus.item.model.vo.Item;

@Service("iService")
public class ItemServiceImpl implements ItemService{
	@Autowired
	private ItemDao iDao;
	
	// 전체 물품 수
	@Override
	public int count(int i_div) {
		return iDao.count(i_div);
	}
	
	// 물품 출력
	@Override
	public List<Item> listAll(Item item) {
		
		return iDao.listAll(item);
	}

	// 물품 게시글 수
	@Override
	public int searchCount(Item item) {
		return iDao.searchCount(item);
	}
	

	// 물품 상세보기
	@Override
	public Item detailItem(int i_no) {
		return iDao.detailItem(i_no);
	}
	
	@Override
	public Attachment detailImg(int i_no, String table) {
		Attachment img = new Attachment();
		img.setRefTable(table);
		img.setRefId(i_no+"");
		return iDao.detailImg(img);
	}

	@Override
	public Attachment detailPdf(int i_no, String table) {
		Attachment pdf = new Attachment();
		pdf.setRefTable(table);
		pdf.setRefId(i_no+"");
		return iDao.detailPdf(pdf);
	}
	
	
	
	// 물품 존재 여부 
	@Override
	public int iIdCheck(Item param) {
		return iDao.iIdCheck(param);
	}
	
	// 신규 등록
	@Override
	public int enrollItem(Item i, Attachment at, Attachment at1) {
		int image = 0;
		int pdf = 0;
		int result = 0;
		int i_div = i.getI_div();
		// 소모품일때
		if(i_div == 1) {
			result = iDao.enrollItem(i);
			
		}else if(i_div == 2){ // 의약품일때
			 result = iDao.enrollMedi(i);
		}
		at.setRefId(result + "");
		at1.setRefId(result + "");
		if(result > 0 && at.getOriginalFile() != null && at1.getOriginalFile() != null) {
			image = iDao.enrollFile(at);
			pdf = iDao.enrollFile(at1);
		}else if(result > 0 && at.getOriginalFile() != null ) {
			image = iDao.enrollFile(at);
		}else if(result > 0 && at1.getOriginalFile() != null) {
			pdf = iDao.enrollFile(at1);
		}
		
		return result;
	}

	@Override
	public int updateItem(Item i, Attachment at, Attachment at1) {
		int result = 0;
		int image = 0;
		int pdf = 0;
		int i_div = i.getI_div();
		int i_no = i.getI_no();
		// 소모품일때
		if(i_div == 1) {
			System.out.println("소모품임");
			result = iDao.updateItem(i);
			
		}else{ // 의약품일때
			System.out.println("의약품임");
			 result = iDao.updateMedi(i);
		}
		
		int up_img = iDao.selectCount(i_no);
		int up_pdf = iDao.selectCount(i_no);
		
		
		
		System.out.println("impl result : " + result  );
		if(result > 0 && at.getOriginalFile() != null && at1.getOriginalFile() != null) {
			if(up_img != 0) {  
				image = iDao.updateFile(at);
			} else {
				image = iDao.enrollFile(at);
			}
			if(up_pdf != 0) {
				pdf = iDao.updateFile(at1);
			}else {
				pdf = iDao.enrollFile(at1);
			}
		}else if(result > 0 && at.getOriginalFile() != null) {
			if(up_img != 0) {  
				image = iDao.updateFile(at);
			} else {
				image = iDao.enrollFile(at);
			}
		}else if(result > 0 && at1.getOriginalFile() == null) {
			if(up_pdf != 0) {
				pdf = iDao.updateFile(at1);
			}else {
				pdf = iDao.enrollFile(at1);
			}
		}
		
		return result;
	}

	

	
	
	

}
