package com.kh.activePlus.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.activePlus.Employee.model.vo.Employee;
import com.kh.activePlus.approval.model.vo.ApprovalSearch;
import com.kh.activePlus.approval.model.vo.ApvDoc;
import com.kh.activePlus.approval.model.vo.Doc;
import com.kh.activePlus.approval.model.vo.PageInfo;

@Repository("aDao")
public class ApprovalDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<ApvDoc> selectApvDocList(ApprovalSearch search) throws Exception {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApvDocList", search);
	}

	public ArrayList<Doc> selectDocTypeList(String docType, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDocTypeList", docType, rowBounds);
	}

	public int selectAllDocTypeListCount() {
		return sqlSession.selectOne("approvalMapper.selectAllDocTypeListCount");
	}

	public ArrayList<Doc> selectAllDocTypeList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectAllDocTypeList",null, rowBounds);
	}

	public int selectDocTypeListCount(String docType) {
		return sqlSession.selectOne("approvalMapper.selectDocTypeListCount", docType);
	}

	public int selectPrivateListCount() {
		return sqlSession.selectOne("approvalMapper.selectPrivateListCount");
	}

	public ArrayList<Doc> selectPrivateList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectPrivateList",null,rowBounds);
	}

	public int selectTemporaryListCount() {
		return sqlSession.selectOne("approvalMapper.selectTemporaryListCount");
	}

	public ArrayList<ApvDoc> selectTemporaryList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectTemporaryList",null,rowBounds);
	}

	public ArrayList<ApvDoc> selectApprovalObtainList(String eId, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalObtainList",eId,rowBounds );
	}

	public ArrayList<ApvDoc> selectApprovalList(String eId, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalList",eId, rowBounds);
	}

	public ArrayList<ApvDoc> selectApprovalCompleteList(String eId, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalCompleteList",eId,rowBounds);
	}

	public Doc selectDocTypeList(String docTitle) {
		return sqlSession.selectOne("approvalMapper.selectDoc",docTitle);
	}

	public ArrayList<Employee> selectEmpList() {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectEmpList");
	}

}
