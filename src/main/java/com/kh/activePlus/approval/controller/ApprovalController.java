package com.kh.activePlus.approval.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.activePlus.Employee.model.vo.Employee;
import com.kh.activePlus.approval.model.exception.ApprovalException;
import com.kh.activePlus.approval.model.service.ApprovalService;
import com.kh.activePlus.approval.model.vo.ApprovalSearch;
import com.kh.activePlus.approval.model.vo.ApvDoc;
import com.kh.activePlus.approval.model.vo.Doc;
import com.kh.activePlus.approval.model.vo.PageInfo;
import com.kh.activePlus.approval.model.vo.Pagination;

@Controller
public class ApprovalController {
	@Autowired
	private ApprovalService aService;
	@RequestMapping("approvalMain.ap")
	public ModelAndView goApproval(ModelAndView mv, HttpServletRequest request) throws Exception {
		// 전자결재 메인창에 띄울 세 리스트 불러오기
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		String empId= loginUser.getID();
		// 임시문서
		ApprovalSearch tempDocSearch = new ApprovalSearch(empId, "0");
		ApprovalSearch apvDocSearch = new ApprovalSearch(empId, "1");
		ApprovalSearch compDocSearch = new ApprovalSearch(empId, "4");
		
		ArrayList<ApvDoc> tempList = aService.selectApvDocList(tempDocSearch);
		// 결재 예정 문서
		ArrayList<ApvDoc> apvList = aService.selectApvDocList(apvDocSearch);
		// 결재 완료 문서
		ArrayList<ApvDoc> apvCompList = aService.selectApvDocList(compDocSearch);
		
		mv.addObject("tempList", tempList);
		mv.addObject("apvList", apvList);
		mv.addObject("apvCompList", apvCompList);
		mv.setViewName("approval/approvalMain");
		
		return mv;
	}
	@RequestMapping("draftingList.ap")
	public ModelAndView goDrafting(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page) {
		int listCount = aService.selectAllDocTypeListCount();
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
		
		ArrayList<Doc> dList = aService.selectAllDocTypeList(pi);
		
		if(dList != null) {
			mv.addObject("dList",dList);
			mv.addObject("pi",pi);
			mv.setViewName("approval/draftingList");
		}else {
			throw new ApprovalException("문서양식 리스트 조회 실패");
		}
		
		
		return mv;
	}
	@RequestMapping("docDetail.ap")
	public String docDetail() {
		return "approval/drafting";
	}
	@RequestMapping("privateList.ap")
	public ModelAndView goPrivateList(ModelAndView mv, HttpServletRequest request,
			@RequestParam(value="page", required=false) Integer page) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		String eId = loginUser.getID();
		int listCount = aService.selectPrivateListCount(eId);
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
		
		ArrayList<Doc> pList = aService.selectPrivateList(eId, pi);
		
		if(pList != null) {
			mv.addObject("pList",pList);
			mv.addObject("pi",pi);
			mv.setViewName("approval/privateDocList");
		}else {
			throw new ApprovalException("개인양식 조회 실패");
		}
		
		return mv;
	}
	@RequestMapping("temporaryList.ap")
	public ModelAndView gotemporaryList(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value="page", required=false) Integer page){
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		String eId = loginUser.getID();
		
		int listCount = aService.selectTemporaryListCount(eId);
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
		
		ArrayList<ApvDoc> tList = aService.selectTemporaryList(eId, pi);
		
		if(tList != null) {
			mv.addObject("tList",tList);
			mv.addObject("pi",pi);
			mv.setViewName("approval/temporaryList");
		}else {
			throw new ApprovalException("임시저장 문서 조회 실패");
		}
		
		return mv;
	}
	@RequestMapping("approvalObtainList.ap")
	public ModelAndView goObtainList(ModelAndView mv, HttpServletRequest request,
			@RequestParam(value="page", required=false) Integer page) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		String eId = loginUser.getID();
		
		int listCount = aService.selectApprovalObtainListCount(eId);
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
		
		ArrayList<ApvDoc> oList = aService.selectApprovalObtainList(eId, pi);
		
		if(oList != null) {
			mv.addObject("oList",oList);
			mv.addObject("pi",pi);
			mv.setViewName("approval/approvalObtainList");
		}else {
			throw new ApprovalException("결재 받을 문서 조회 실패");
		}
		
		return mv;
	}
	@RequestMapping("approvalList.ap")
	public ModelAndView goApprovalList(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value="page", required=false) Integer page) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		String eId = loginUser.getID();
		int listCount = aService.selectApprovalListCount(eId);
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
		
		ArrayList<ApvDoc> aList = aService.selectApprovalList(eId, pi);
		
		if(aList != null) {
			mv.addObject("aList",aList);
			mv.addObject("pi",pi);
			mv.setViewName("approval/approvalList");
		}else {
			throw new ApprovalException("결재 예정 문서 조회 실패");
		}
		
		return mv;
	}
	@RequestMapping("approvalCompleteList.ap")
	public ModelAndView goApprovalCompleteList(ModelAndView mv, HttpServletRequest request,
			@RequestParam(value="page", required=false) Integer page) {
		Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
		
		String eId = loginUser.getID();
		int listCount = aService.selectAprrovalCompleteListCount(eId);
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
		
		ArrayList<ApvDoc> cList = aService.selectApprovalCompleteList(eId,pi);
		
		if(cList != null) {
			mv.addObject("cList",cList);
			mv.addObject("pi",pi);
			mv.setViewName("approval/approvalComplList");
		}else {
			throw new ApprovalException("임시저장 문서 조회 실패");
		}
		
		return mv;
	}
	@RequestMapping("tempDocDetail.ap")
	public String goTempDocDetail() {
		return "approval/tempDoc";
	}
	
	@RequestMapping("docTypeList.ap")
	public ModelAndView docTypeList(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page, String docType ) {
		
		int listCount = aService.selectDocTypeListCount(docType);
		
		int currentPage = page != null ? page : 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 5);
		
		ArrayList<Doc> dList = aService.selectDocTypeList(docType, pi); 
		
		System.out.println(dList);
		if(dList != null) {
			mv.addObject("dList",dList);
			mv.addObject("pi",pi);
			mv.setViewName("approval/draftingList");
		}else {
			throw new ApprovalException("문서양식 리스트 조회 실패");
		}
		
		return mv;
	}
	
	@RequestMapping("selectDoc.ap")
	public ModelAndView selectDoc(ModelAndView mv,String docTitle) {
		Doc doc = aService.selectDoc(docTitle);
		ArrayList<Employee> eList = aService.selectEmpList();
		System.out.println(eList);
		if(doc != null) {
			mv.addObject("eList", eList);
			mv.addObject("doc",doc);
			mv.setViewName("approval/drafting");
		}else {
			throw new ApprovalException("양식 조회 실패");
		}
		
		return mv;
	}
	
	/*@RequestMapping(value="docTypeList.ap", method=RequestMethod.POST)
	public void docTypeList(String docType, HttpServletResponse response) throws IOException {
		System.out.println(docType);
		ArrayList<Doc> dList = aService.selectDocTypeList(docType);
		
		JSONArray jarr = new JSONArray();
		
		for(Doc d : dList) {
			JSONObject jDoc = new JSONObject();
			jDoc.put("docNo", d.getDocNo());
			jDoc.put("docTitle", d.getDocTitle());
			jDoc.put("docContent", d.getDocStatus());
			jDoc.put("docType", d.getDocType());
			jDoc.put("docExplantion", d.getDocExplantion());
			
			jarr.add(jDoc);
		}
		JSONObject sendJson = new JSONObject();
		sendJson.put("docTypeList", jarr);		
		
		// 응답 설정
		response.setContentType("application/json; charset=utf-8");
		// 전송
		PrintWriter out = response.getWriter();
		out.print(sendJson);
		
	}*/
	
	
	
}
