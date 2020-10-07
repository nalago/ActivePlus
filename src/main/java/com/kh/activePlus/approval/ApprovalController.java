package com.kh.activePlus.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ApprovalController {
	@RequestMapping("approvalMain.ap")
	public String goApproval() {
		return "approval/approvalMain";
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
	
}
