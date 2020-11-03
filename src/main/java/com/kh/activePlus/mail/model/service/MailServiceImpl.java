package com.kh.activePlus.mail.model.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.mail.model.dao.MailDao;
import com.kh.activePlus.mail.model.vo.Email;
import com.kh.activePlus.mail.model.vo.EmailReceive;

@Service
public class MailServiceImpl implements MailService{
	@Autowired
	private MailDao mDao;
	
	@Override
	public int sendMail(Email e, EmailReceive er) {
		
		return 0;
	}

	@Override
	public ArrayList<Email> selectInList(String receiver, PageInfo pi) {
		return mDao.selectInList(receiver,pi);
	}

	@Override
	public int getListCount(String receiver, String kind) {
		return 0;
	}

}
