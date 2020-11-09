package com.kh.activePlus.approval.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.activePlus.employee.model.vo.Employee;
import com.kh.activePlus.approval.model.dao.ApprovalDao;
import com.kh.activePlus.approval.model.vo.Approval;
import com.kh.activePlus.approval.model.vo.ApprovalApvDoc;
import com.kh.activePlus.approval.model.vo.ApprovalSearch;
import com.kh.activePlus.approval.model.vo.ApvDoc;
import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.approval.model.vo.Doc;
import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.approval.model.vo.Sign;

@Service("aService")
public class ApprovalServiceImpl implements ApprovalService {
	@Autowired
	private ApprovalDao aDao;

	@Override
	public ArrayList<Employee> selectEmpList() {
		return aDao.selectEmpList();
	}

	@Override
	public int draftingDoc(ApvDoc doc) {
		return aDao.draftingDoc(doc);
	}


	@Override
	public int deleteTempDoc(int apvDocNo) {
		return aDao.deleteTempDoc(apvDocNo);
	}


	@Override
	public int draftingRetrieve(int dId) {
		return aDao.draftingRetrieve(dId);
	}

	

	@Override
	public int approvalCancel(Approval apv) {
		return aDao.approvalCancel(apv);
	}

	@Override
	public ArrayList<Doc> selectDocTypeList(ApprovalSearch as, PageInfo pi) {
		return aDao.selectDocTypeList(as, pi);
	}

	

	@Override
	public ArrayList<ApprovalApvDoc> selectApprovalList(String eId, PageInfo pi) {
		return aDao.selectApprovalList(eId, pi);
	}

	@Override
	public ArrayList<ApvDoc> selectApvDocList(ApprovalSearch search) throws Exception {
		return aDao.selectApvDocList(search);
	}

	@Override
	public int selectAllDocTypeListCount(String eId) {
		return aDao.selectAllDocTypeListCount(eId);
	}

	@Override
	public List<Doc> selectAllDocTypeList(String eId, PageInfo pi) {
		return aDao.selectAllDocTypeList(eId, pi);
	}

	@Override
	public int selectDocTypeListCount(ApprovalSearch as) {
		return aDao.selectDocTypeListCount(as);
	}

	@Override
	public int selectPrivateListCount(String eId) {
		return aDao.selectPrivateListCount(eId);
	}

	@Override
	public ArrayList<Doc> selectPrivateList(String eId, PageInfo pi) {
		return aDao.selectPrivateList(eId, pi);
	}

	@Override
	public int selectTemporaryListCount(String eId) {
		return aDao.selectTemporaryListCount(eId);
	}

	@Override
	public ArrayList<ApvDoc> selectTemporaryList(String eId, PageInfo pi) {
		return aDao.selectTemporaryList(eId, pi);
	}

	@Override
	public int selectApprovalObtainListCount(String eId) {
		return aDao.selectApprovalObtainListCount(eId);
	}

	@Override
	public int selectApprovalListCount(String eId) {
		return aDao.selectApprovalListCount(eId);
	}

	@Override
	public int selectAprrovalCompleteListCount(String eId) {
		return aDao.selectApprovalCompleteListCount(eId);
	}

	@Override
	public ArrayList<ApprovalApvDoc> selectApprovalObtainList(String eId, PageInfo pi) {
		return aDao.selectApprovalObtainList(eId, pi);
	}

	@Override
	public ArrayList<ApprovalApvDoc> selectApprovalCompleteList(String eId, PageInfo pi) {
		return aDao.selectApprovalCompleteList(eId, pi);
	}

	@Override
	public Doc selectDoc(int docNo) {
		return aDao.selectDocTypeList(docNo);
	}

	@Override
	public String[] selectEmpId(String string) {
		return aDao.selectEmpId(string);
	}

	@Override
	public int insertApproval(Approval apv) {
		return aDao.insertApproval(apv);
	}

	@Override
	public int insertAttachment(Attachment at) {
		return aDao.insertAttachment(at);
	}

	@Override
	public int insertTempDoc(ApvDoc temporaryDoc) {
		return aDao.insertTempDoc(temporaryDoc);
	}

	@Override
	public int priDocSave(Doc priDoc) {
		return aDao.priDocSave(priDoc);
	}

	@Override
	public Doc selectPriDoc(Doc searchd) {
		return aDao.selectPriDoc(searchd);
	}

	@Override
	public int deletePriDoc(Doc searchd) {
		return aDao.deletePriDoc(searchd);
	}

	@Override
	public ApvDoc selectTempDoc(ApvDoc searchTemp) {
		return aDao.selectTempDoc(searchTemp);
	}

	@Override
	public ArrayList<Attachment> selectTempAt(String docNo) {
		return aDao.selectTempAt(docNo);
	}

	@Override
	public int deleteAttachment(String docNo) {
		return aDao.deleteAttachment(docNo);
	}

	@Override
	public ArrayList<Approval> selectApprovalfromObtainDoc(int apvDocNo) {
		return aDao.selectApprovalfromObtainDoc(apvDocNo);
	}

	@Override
	public ArrayList<Attachment> selectApvDocAtList(String apvDocNo) {
		return aDao.selectApvDocAtList(apvDocNo);
	}

	@Override
	public ArrayList<Sign> selectSignList(ArrayList<String> eList) {
		return aDao.selectSignList(eList);
	}

	@Override
	public int deleteprocedureList(int apvDocNo) {
		return aDao.deleteprocedureList(apvDocNo);
	}

	@Override
	public int approval(Approval apv) {
		return aDao.approval(apv);
	}

	@Override
	public ApprovalApvDoc checkApproval(int apvDocNo) {
		return aDao.checkApproval(apvDocNo);
	}

	@Override
	public int apvDocComplete(int apvDocNo) {
		return aDao.apvDocComplete(apvDocNo);
	}

	@Override
	public int insertAtListToApvDocFromTemp(String refId) {
		return aDao.insetAtListToApvDocFromTemp(refId);
	}

	

	

}
