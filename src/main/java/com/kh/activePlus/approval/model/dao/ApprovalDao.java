package com.kh.activePlus.approval.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.activePlus.approval.model.vo.ApprovalSearch;
import com.kh.activePlus.approval.model.vo.ApvDoc;

@Repository("aDao")
public class ApprovalDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<ApvDoc> selectApvDocList(ApprovalSearch search) throws Exception {
		System.out.println("dao"+search);
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApvDocList", search);
	}

}
