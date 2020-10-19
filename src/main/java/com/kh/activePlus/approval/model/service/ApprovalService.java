package com.kh.activePlus.approval.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.activePlus.Employee.model.vo.Employee;
import com.kh.activePlus.approval.model.vo.Approval;
import com.kh.activePlus.approval.model.vo.ApprovalSearch;
import com.kh.activePlus.approval.model.vo.ApvDoc;
import com.kh.activePlus.approval.model.vo.Doc;
import com.kh.activePlus.approval.model.vo.PageInfo;

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
	
	public ArrayList<Doc> selectDocTypeList(String docType, PageInfo pi);
	
	public ArrayList<ApvDoc> selectDocList();

	public ArrayList<ApvDoc> selectApvDocList(ApprovalSearch search) throws Exception;

	public int selectAllDocTypeListCount();

	public ArrayList<Doc> selectAllDocTypeList(PageInfo pi);

	public int selectDocTypeListCount(String docType);

	public int selectPrivateListCount();

	public ArrayList<Doc> selectPrivateList(PageInfo pi);

	public int selectTemporaryListCount();

	public ArrayList<ApvDoc> selectTemporaryList(PageInfo pi);

	public int selectApprovalObtainListCount();

	public int selectApprovalListCount();

	public int selectAprrovalCompleteListCount();

	public ArrayList<ApvDoc> selectApprovalObtainList(String eId, PageInfo pi);

	public ArrayList<ApvDoc> selectApprovalList(String eId, PageInfo pi);

	public ArrayList<ApvDoc> selectApprovalCompleteList(String eId, PageInfo pi);

	public Doc selectDoc(String docTitle);


	
	
	
	
}
