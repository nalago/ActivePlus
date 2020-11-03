package com.kh.activePlus.mail.model.service;

import com.kh.activePlus.mail.model.vo.EmailReceive;

import java.util.ArrayList;

import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.mail.model.vo.Email;

public interface MailService {
	public int sendMail(Email e,EmailReceive er);

	public ArrayList<Email> selectInList(String receiver, PageInfo pi);

	public int getListCount(String receiver, String kind);
}
