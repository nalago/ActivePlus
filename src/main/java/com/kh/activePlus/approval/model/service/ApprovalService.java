package com.kh.activePlus.approval.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.activePlus.Employee.model.vo.Employee;
import com.kh.activePlus.approval.model.vo.Approval;
import com.kh.activePlus.approval.model.vo.ApprovalSearch;
import com.kh.activePlus.approval.model.vo.ApvDoc;
import com.kh.activePlus.approval.model.vo.Doc;

@Service
public interface ApprovalService {
	public ArrayList<Employee> selectEmpList();
	
	public int draftingDoc(Doc doc);
	
	public int TemporaryDocSave(Doc tempDoc);
	
	public int deleteTempDoc(int dId);
	
	public int insertPriDoc(Doc doc);
	
	public int draftingRetrieve(int dId);
	
	public int returnApproval(Doc doc);
	
	public int docApproval(Doc doc);
	
	public int approvalCancel(int dId);
	
	public ArrayList<Doc> selectDocTypeList();
	
	public ArrayList<ApvDoc> selectDocList();
	
	public ArrayList<Approval> selectApprovalList(ApprovalSearch search);

	public ArrayList<ApvDoc> selectApvDocList(ApprovalSearch search) throws Exception;
	
	
	
	
}
