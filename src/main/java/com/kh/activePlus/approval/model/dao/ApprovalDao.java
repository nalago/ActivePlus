package com.kh.activePlus.approval.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.activePlus.employee.model.vo.Employee;
import com.kh.activePlus.approval.model.vo.Approval;
import com.kh.activePlus.approval.model.vo.ApprovalApvDoc;
import com.kh.activePlus.approval.model.vo.ApprovalSearch;
import com.kh.activePlus.approval.model.vo.ApvDoc;
import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.approval.model.vo.Doc;
import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.approval.model.vo.Sign;

@Repository("aDao")
public class ApprovalDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<ApvDoc> selectApvDocList(ApprovalSearch search) throws Exception {
		ArrayList<ApvDoc> result = new ArrayList<>();
		if(search.getApvDocStatus().equals("1")) {
			result = (ArrayList)sqlSession.selectList("approvalMapper.selectMainApvDocList", search);
		}else if(search.getApvDocStatus().equals("4")) {
			result = (ArrayList)sqlSession.selectList("approvalMapper.selectMainCompApvDocList", search);
		}else {
			result = (ArrayList)sqlSession.selectList("approvalMapper.selectApvDocList", search);
		}
		
		
		return result;
	}

	public ArrayList<Doc> selectDocTypeList(ApprovalSearch as, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDocTypeList", as, rowBounds);
	}

	public int selectAllDocTypeListCount(String eId) {
		return sqlSession.selectOne("approvalMapper.selectAllDocTypeListCount", eId);
	}

	public List<Doc> selectAllDocTypeList(String eId, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("approvalMapper.selectAllDocTypeList", eId);
	}

	public int selectDocTypeListCount(ApprovalSearch as) {
		return sqlSession.selectOne("approvalMapper.selectDocTypeListCount", as);
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

	public ArrayList<ApprovalApvDoc> selectApprovalObtainList(String eId, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalObtainList",eId,rowBounds );
	}

	public ArrayList<ApprovalApvDoc> selectApprovalList(String eId, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalList",eId, rowBounds);
	}

	public ArrayList<ApprovalApvDoc> selectApprovalCompleteList(String eId, PageInfo pi) {
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

	public ArrayList<Attachment> selectTempAt(String docNo) {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectTempAt", docNo);
	}

	public int deleteTempDoc(int apvDocNo) {
		return sqlSession.delete("approvalMapper.deleteTempDoc", apvDocNo);
	}

	public int deleteAttachment(String docNo) {
		return sqlSession.delete("approvalMapper.deleteAttachment", docNo);
	}

	public ArrayList<Approval> selectApprovalfromObtainDoc(int apvDocNo) {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalfromObtainDoc",apvDocNo);
	}

	public ArrayList<Attachment> selectApvDocAtList(String apvDocNo) {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApvDocAtList",apvDocNo);
	}

	public ArrayList<Sign> selectSignList(ArrayList<String> eList) {
		HashMap smap = new HashMap();
		smap.put("eList", eList);
		return (ArrayList)sqlSession.selectList("approvalMapper.selectSignList", smap);
	}

	public int draftingRetrieve(int dId) {
		return sqlSession.update("approvalMapper.draftingRetrieve", dId);
	}

	public int deleteprocedureList(int apvDocNo) {
		return sqlSession.delete("approvalMapper.deleteprocedureList", apvDocNo);
	}

	public int approval(Approval apv) {
		int result = 0;
		if(apv.getApvResult() == 2) {
			result += sqlSession.update("approvalMapper.returnApprovalDoc",apv);
		}else {			
			result += sqlSession.update("approvalMapper.approvalDoc", apv);
		}
		result += sqlSession.update("approvalMapper.approval", apv);
		return result;
	}

	public ApprovalApvDoc checkApproval(int apvDocNo) {
		return sqlSession.selectOne("approvalMapper.checkApproval", apvDocNo);
	}

	public int apvDocComplete(int apvDocNo) {
		return sqlSession.update("approvalMapper.apvDocComplete", apvDocNo);
	}

	public int approvalCancel(Approval apv) {
		sqlSession.update("approvalMapper.apvDocCancel",apv.getApvDocNo());
		return sqlSession.update("approvalMapper.approvalCancel", apv);
	}

	public int insetAtListToApvDocFromTemp(String refId) {
		return sqlSession.update("approvalMapper.insertAtListToApvDocFromTemp", refId);
	}

}
