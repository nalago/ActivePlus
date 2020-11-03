package com.kh.activePlus.mail.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.mail.model.vo.Email;

@Repository
public class MailDao {
	SqlSessionTemplate sqlSession;

	public ArrayList<Email> selectInList(String receiver, PageInfo pi) {
		
		
		
		
		return null;
	}
	
	
}
