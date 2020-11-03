package com.kh.activePlus.approval.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.activePlus.approval.model.dao.ApprovalDao;
import com.kh.activePlus.approval.model.vo.Approval;
import com.kh.activePlus.approval.model.vo.ApprovalSearch;
import com.kh.activePlus.approval.model.vo.ApvDoc;
import com.kh.activePlus.approval.model.vo.Doc;
import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.employee.model.vo.Employee;

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
	public int TemporaryDocSave(Doc tempDoc) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteTempDoc(int apvDocNo) {
		return aDao.deleteTempDoc(apvDocNo);
	}

	@Override
	public int insertPriDoc(Doc doc) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int draftingRetrieve(int dId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int returnApproval(Doc doc) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int docApproval(Doc doc) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int approvalCancel(int dId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Doc> selectDocTypeList(String docType, PageInfo pi) {
		return aDao.selectDocTypeList(docType, pi);
	}

	@Override
	public ArrayList<ApvDoc> selectDocList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<ApvDoc> selectApprovalList(String eId, PageInfo pi) {
		return aDao.selectApprovalList(eId, pi);
	}

	@Override
	public ArrayList<ApvDoc> selectApvDocList(ApprovalSearch search) throws Exception {
		return aDao.selectApvDocList(search);
	}

	@Override
	public int selectAllDocTypeListCount() {
		return aDao.selectAllDocTypeListCount();
	}

	@Override
	public ArrayList<Doc> selectAllDocTypeList(PageInfo pi) {
		return aDao.selectAllDocTypeList(pi);
	}

	@Override
	public int selectDocTypeListCount(String docType) {
		return aDao.selectDocTypeListCount(docType);
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
	public ArrayList<ApvDoc> selectApprovalObtainList(String eId, PageInfo pi) {
		return aDao.selectApprovalObtainList(eId, pi);
	}

	@Override
	public ArrayList<ApvDoc> selectApprovalCompleteList(String eId, PageInfo pi) {
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
	public ArrayList<Attachment> selectTempAt(int docNo) {
		return aDao.selectTempAt(docNo);
	}

	@Override
	public int deleteAttachment(int docNo) {
		return aDao.deleteAttachment(docNo);
	}

	

	

}
