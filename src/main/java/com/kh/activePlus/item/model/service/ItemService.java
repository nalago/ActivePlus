package com.kh.activePlus.item.model.service;

import java.util.List;

import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.item.model.vo.Item;

public interface ItemService {

	public int count(int i_div);

	public List<Item> listAll(Item item);
	
	public int searchCount(Item item);

	public Item detailItem(int i_no);

	public int iIdCheck(Item param);

	public int enrollItem(Item i, Attachment at, Attachment at1);

	public Attachment detailImg(int i_no, String table);

	public Attachment detailPdf(int i_no, String table);

	public int updateFile(Attachment at);

	public int updateItem(Item i);

	public int insertFile(Attachment at);

	public int deleteItem(int i_no);

	public int deleteFile(String string);

	

}
