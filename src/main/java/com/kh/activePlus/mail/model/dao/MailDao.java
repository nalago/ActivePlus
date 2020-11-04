package com.kh.activePlus.mail.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.mail.model.vo.Email;

@Repository
public class MailDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	public ArrayList<Email> selectInList(String empId, String kind, PageInfo pi) {
		int offset = 0;
		RowBounds rowBounds = null;
		if(pi != null) {
			offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			rowBounds = new RowBounds(offset, pi.getBoardLimit());
			
		} else {
			// 메인화면 select
			offset = 0;
			rowBounds = new RowBounds(offset, 3);
		}
		HashMap<String, String> hmap = new HashMap<>();
		hmap.put("kind", kind);
		hmap.put("empId", empId);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectList", hmap, rowBounds);
	}
	
	
}
