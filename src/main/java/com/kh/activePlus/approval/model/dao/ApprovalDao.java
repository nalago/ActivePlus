package com.kh.activePlus.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.activePlus.Employee.model.vo.Employee;
import com.kh.activePlus.approval.model.vo.Approval;
import com.kh.activePlus.approval.model.vo.ApprovalSearch;
import com.kh.activePlus.approval.model.vo.ApvDoc;
import com.kh.activePlus.approval.model.vo.Attachment;
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

	public int selectPrivateListCount(String eId) {
		return sqlSession.selectOne("approvalMapper.selectPrivateListCount", eId);
	}

	public ArrayList<Doc> selectPrivateList(String eId, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectPrivateList", eId,rowBounds);
	}

	public int selectTemporaryListCount(String eId) {
		return sqlSession.selectOne("approvalMapper.selectTemporaryListCount", eId);
	}

	public ArrayList<ApvDoc> selectTemporaryList(String eId, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectTemporaryList", eId,rowBounds);
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

	public Doc selectDocTypeList(int docNo) {
		return sqlSession.selectOne("approvalMapper.selectDoc",docNo);
	}

	public ArrayList<Employee> selectEmpList() {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectEmpList");
	}

	public int selectApprovalObtainListCount(String eId) {
		return sqlSession.selectOne("approvalMapper.selectApprovalObtainListCount", eId);
	}

	public int selectApprovalListCount(String eId) {
		return sqlSession.selectOne("approvalMapper.selectApprovalListCount", eId);
	}

	public int selectApprovalCompleteListCount(String eId) {
		return sqlSession.selectOne("approvalMapper.selectApprovalCompleteListCount", eId);
	}

	public String[] selectEmpId(String string) {
		return sqlSession.selectOne("approvalMapper.selectEmpId", string);
	}

	public int insertApproval(Approval apv) {
		return sqlSession.insert("approvalMapper.insertApproval", apv);
	}

	public int draftingDoc(ApvDoc doc) {
		return sqlSession.insert("approvalMapper.draftingDoc", doc);
	}

	public int insertAttachment(Attachment at) {
		return sqlSession.insert("approvalMapper.insertAttachment", at);
	}

	public int insertTempDoc(ApvDoc temporaryDoc) {
		return sqlSession.insert("approvalMapper.insertTempDoc", temporaryDoc);
	}

	public int priDocSave(Doc priDoc) {
		return sqlSession.insert("approvalMapper.priDocSave", priDoc);
	}

	public Doc selectPriDoc(Doc searchd) {
		return sqlSession.selectOne("approvalMapper.selectPriDoc", searchd);
	}

	public int deletePriDoc(Doc searchd) {
		return sqlSession.update("approvalMapper.deletePriDoc", searchd);
	}

	public ApvDoc selectTempDoc(ApvDoc searchTemp) {
		return sqlSession.selectOne("approvalMapper.selectTempDoc", searchTemp);
	}

	public ArrayList<Attachment> selectTempAt(int docNo) {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectTempAt", docNo);
	}

	public int deleteTempDoc(int apvDocNo) {
		return sqlSession.delete("approvalMapper.deleteTempDoc", apvDocNo);
	}

	public int deleteAttachment(int docNo) {
		return sqlSession.delete("approvalMapper.deleteAttachment", docNo);
	}

}
