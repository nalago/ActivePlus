package com.kh.activePlus.approval.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.activePlus.Employee.model.vo.Employee;
import com.kh.activePlus.approval.model.dao.ApprovalDao;
import com.kh.activePlus.approval.model.vo.Approval;
import com.kh.activePlus.approval.model.vo.ApprovalSearch;
import com.kh.activePlus.approval.model.vo.ApvDoc;
import com.kh.activePlus.approval.model.vo.Doc;
import com.kh.activePlus.approval.model.vo.PageInfo;

@Service("aService")
public class ApprovalServiceImpl implements ApprovalService {
	@Autowired
	private ApprovalDao aDao;

	@Override
	public ArrayList<Employee> selectEmpList() {
		return aDao.selectEmpList();
	}

	@Override
	public int draftingDoc(Doc doc) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int TemporaryDocSave(Doc tempDoc) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteTempDoc(int dId) {
		// TODO Auto-generated method stub
		return 0;
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
	public int selectPrivateListCount() {
		return aDao.selectPrivateListCount();
	}

	@Override
	public ArrayList<Doc> selectPrivateList(PageInfo pi) {
		return aDao.selectPrivateList(pi);
	}

	@Override
	public int selectTemporaryListCount() {
		return aDao.selectTemporaryListCount();
	}

	@Override
	public ArrayList<ApvDoc> selectTemporaryList(PageInfo pi) {
		return aDao.selectTemporaryList(pi);
	}

	@Override
	public int selectApprovalObtainListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectApprovalListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectAprrovalCompleteListCount() {
		// TODO Auto-generated method stub
		return 0;
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
	public Doc selectDoc(String docTitle) {
		return aDao.selectDocTypeList(docTitle);
	}

	

}
