package com.kh.activePlus.approval.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.activePlus.Employee.model.vo.Employee;
import com.kh.activePlus.approval.model.service.ApprovalService;
import com.kh.activePlus.approval.model.vo.ApprovalSearch;
import com.kh.activePlus.approval.model.vo.ApvDoc;

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
	public String goDrafting() {
		return "approval/draftingList";
	}
	@RequestMapping("docDetail.ap")
	public String docDetail() {
		return "approval/drafting";
	}
	@RequestMapping("privateList.ap")
	public String goPrivateList() {
		return "approval/privateDocList";
	}
	@RequestMapping("temporary.ap")
	public String gotemporaryList(){
		return "approval/temporaryList";
	}
	@RequestMapping("approvalObtainList.ap")
	public String goObtainList() {
		return "approval/approvalObtainList";
	}
	@RequestMapping("approvalList.ap")
	public String goApprovalList() {
		return "approval/approvalList";
	}
	@RequestMapping("approvalCompleteList.ap")
	public String goApprovalCompleteList() {
		return "approval/approvalComplList";
	}
	@RequestMapping("tempDocDetail.ap")
	public String goTempDocDetail() {
		return "approval/tempDoc";
	}
	
}
