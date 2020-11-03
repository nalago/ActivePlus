package com.kh.activePlus.mail.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.activePlus.Employee.model.vo.Employee;
import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.common.paging.Pagination;
import com.kh.activePlus.mail.model.service.MailService;
import com.kh.activePlus.mail.model.vo.Email;
import com.kh.activePlus.mail.model.vo.EmailReceive;

@Controller
public class MailController {
	@Autowired
	private MailService mService;
	
	@RequestMapping("mail.ap")
	public String goMail(HttpServletRequest req, @RequestParam(name="page", required=false)Integer page,
			String kind) {
		Employee user = (Employee)req.getSession().getAttribute("loginUser");
		String receiver = user.getEmpId();
		
		int currentPage = page != null ? page : 1;
		int listCount = mService.getListCount(receiver, kind);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		ArrayList<Email> in = mService.selectInList(receiver);
		
		
		return "mail/mailInbox";
	}
	@RequestMapping("sendbox.ap")
	public String goSendbox() {
		
		return "mail/mailSendbox";
	}
	@RequestMapping("importantbox.ap")
	public String goImportantbox() {
		
		return "mail/mailImportantbox";
	}
	@RequestMapping("temporarybox.ap")
	public String goTemporarybox() {
		
		return "mail/mailTemporarybox";
	}
	@RequestMapping("wastebox.ap")
	public String goWastebox() {
		
		return "mail/mailWastebox";
	}
	@RequestMapping("mailsend.ap")
	public String goMailSendForm(){
		
		return "mail/mailForm";
	}
	
	@RequestMapping("mailread.ap")
	public String readMail() {
		
		return "mail/mailReadView";
	}
	
	// 메일 보내기
	@RequestMapping("send.ap")
	public String mailSend(Email e, EmailReceive er, Model model) {
		mService.sendMail(e, er);
		model.addAttribute("msg","이메일 발송 성공");
		
		
		
		return null;
	}
}
