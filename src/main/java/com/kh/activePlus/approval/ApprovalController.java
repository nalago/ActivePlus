package com.kh.activePlus.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ApprovalController {
	@RequestMapping("approvalMain.ap")
	public String goApproval() {
		return "approval/approvalMain";
	}
	@RequestMapping("draftingMain.ap")
	public String goDrafting() {
		return "approval/draftingMain";
	}
	@RequestMapping("docDetail.ap")
	public String docDetail() {
		return "approval/drafting";
	}
}
