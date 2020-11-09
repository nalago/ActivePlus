package com.kh.activePlus.mail.model.service;


import java.util.ArrayList;
import java.util.HashMap;

import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.mail.model.vo.Email;

public interface MailService {
	public int sendMail(Email e,String[] receiver, String[] refReceiver);

	public ArrayList<Email> selectInList(String receiver, String kind, PageInfo pi);

	public int getListCount(String receiver, String kind);

	public int insertAttachment(ArrayList<Attachment> aList);

	public Email selectMail(Email m);

	public ArrayList<Attachment> selectAttachment(Attachment at);

	// public ArrayList<String> selectReceiver(ArrayList<Email> sendList);

	public int setMail(HashMap<String, String> hmap);

	public Email selectMailSend(int mId);

	public Email selectMailDel(int mId);

	public int sendTemp(Integer mNo);

	public void readMail(Email m);

	public ArrayList<String> selectReceiver(Email email);
}
