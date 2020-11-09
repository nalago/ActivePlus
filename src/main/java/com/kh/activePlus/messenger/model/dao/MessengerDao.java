package com.kh.activePlus.messenger.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.activePlus.messenger.model.vo.Emergency;
@Repository("mesDao")
public class MessengerDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	public int emergencyCall(Emergency em) {
		return sqlSession.insert("messengerMapper.insertEm",em);
	}
	
	
}
