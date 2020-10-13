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

@Service("aService")
public class ApprovalServiceImpl implements ApprovalService {
	@Autowired
	private ApprovalDao aDao;

	@Override
	public ArrayList<Employee> selectEmpList() {
		// TODO Auto-generated method stub
		return null;
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
	public ArrayList<Doc> selectDocTypeList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<ApvDoc> selectDocList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Approval> selectApprovalList(ApprovalSearch search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<ApvDoc> selectApvDocList(ApprovalSearch search) throws Exception {
		System.out.println("impl"+search);
		return aDao.selectApvDocList(search);
	}

	

}
