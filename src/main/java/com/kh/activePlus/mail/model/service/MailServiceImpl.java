package com.kh.activePlus.mail.model.service;


import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.mail.model.dao.MailDao;
import com.kh.activePlus.mail.model.vo.Email;

@Service
public class MailServiceImpl implements MailService{
	@Autowired
	private MailDao mDao;
	
	@Override
	public int sendMail(Email e, String[] receiver, String[] refReceiver) {
		
		return mDao.sendMail(e, receiver, refReceiver);
	}


	@Override
	public int getListCount(String receiver, String kind) {
		return mDao.getListCount(receiver, kind);
	}

	@Override
	public ArrayList<Email> selectInList(String receiver, String kind,PageInfo pi) {
		return mDao.selectInList(receiver, kind,pi);
	}


	@Override
	public int insertAttachment(ArrayList<Attachment> aList) {
		return mDao.insertAttachment(aList);
	}


	@Override
	public Email selectMail(Email m) {
		return mDao.selectMail(m);
	}


	@Override
	public ArrayList<Attachment> selectAttachment(Attachment at) {
		return mDao.selectAttachment(at);
	}


	@Override
	public ArrayList<String> selectReceiver(Email e) {
		return mDao.selectReceiver(e);
	}


	@Override
	public int setMail(HashMap<String, String> hmap) {
		return mDao.setMail(hmap);
	}


	@Override
	public Email selectMailSend(int mId) {
		return mDao.selectMailSend(mId);
	}


	@Override
	public Email selectMailDel(int mId) {
		return mDao.selectMailDel(mId);
	}


	@Override
	public int sendTemp(Integer mNo) {
		return mDao.sendTemp(mNo);
	}


	@Override
	public void readMail(Email m) {
		mDao.readMail(m);
	}
}
