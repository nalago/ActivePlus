package com.kh.activePlus.approval.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.activePlus.approval.model.vo.Approval;
import com.kh.activePlus.approval.model.vo.ApprovalApvDoc;
import com.kh.activePlus.approval.model.vo.ApprovalSearch;
import com.kh.activePlus.approval.model.vo.ApvDoc;
import com.kh.activePlus.approval.model.vo.Doc;
import com.kh.activePlus.approval.model.vo.Sign;
import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.employee.model.vo.Employee;

@Service
public interface ApprovalService {
	public ArrayList<Employee> selectEmpList();
	
	public int draftingDoc(ApvDoc doc);
	
	
	
	public int deleteTempDoc(int apvDocNo);
	

	
	public int draftingRetrieve(int dId);
	
	
	
	public int approvalCancel(Approval cApv);
	
	public ArrayList<Doc> selectDocTypeList(ApprovalSearch as, PageInfo pi);
	


	public ArrayList<ApvDoc> selectApvDocList(ApprovalSearch search) throws Exception;

	public int selectAllDocTypeListCount(String eId);

	public List<Doc> selectAllDocTypeList(String eId, PageInfo pi);

	public int selectDocTypeListCount(ApprovalSearch as);

	public int selectPrivateListCount(String eId);

	public ArrayList<Doc> selectPrivateList(String eId, PageInfo pi);

	public int selectTemporaryListCount(String eId);

	public ArrayList<ApvDoc> selectTemporaryList(String eId, PageInfo pi);

	public int selectApprovalObtainListCount(String eId);

	public int selectApprovalListCount(String eId);

	public int selectAprrovalCompleteListCount(String eId);

	public ArrayList<ApprovalApvDoc> selectApprovalObtainList(String eId, PageInfo pi);

	public ArrayList<ApprovalApvDoc> selectApprovalList(String eId, PageInfo pi);

	public ArrayList<ApprovalApvDoc> selectApprovalCompleteList(String eId, PageInfo pi);

	public Doc selectDoc(int docNo);

	public String[] selectEmpId(String string);

	public int insertApproval(Approval apv);

	public int insertAttachment(Attachment at);

	public int insertTempDoc(ApvDoc temporaryDoc);

	public int priDocSave(Doc priDoc);

	public Doc selectPriDoc(Doc searchd);

	public int deletePriDoc(Doc searchd);

	public ApvDoc selectTempDoc(ApvDoc searchTemp);

	public ArrayList<Attachment> selectTempAt(String a);

	public int deleteAttachment(String a);

	public ArrayList<Approval> selectApprovalfromObtainDoc(int apvDocNo);

	public ArrayList<Attachment> selectApvDocAtList(String apvDocNo);

	public ArrayList<Sign> selectSignList(ArrayList<String> eList);

	public int deleteprocedureList(int apvDocNo);

	public int approval(Approval apv);

	public ApprovalApvDoc checkApproval(int apvDocNo);

	public int apvDocComplete(int apvDocNo);

	public int insertAtListToApvDocFromTemp(String refId);


	
	
	
	
}
