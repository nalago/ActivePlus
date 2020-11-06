package com.kh.activePlus.mail.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.activePlus.common.exception.commonException;
import com.kh.activePlus.common.paging.PageInfo;
import com.kh.activePlus.common.paging.Pagination;
import com.kh.activePlus.employee.model.service.EmployeeService;
import com.kh.activePlus.employee.model.vo.Employee;
import com.kh.activePlus.mail.model.service.MailService;
import com.kh.activePlus.mail.model.vo.Email;
import com.kh.activePlus.mail.model.vo.EmailReceive;

@Controller
public class MailController {
	@Autowired
	private MailService mService;
	@Autowired
	private EmployeeService eService;
	@RequestMapping("mail.ap")
	public String goMail(HttpServletRequest req, @RequestParam(name="page", required=false)Integer page) {
		Employee user = (Employee)req.getSession().getAttribute("loginUser");
		String receiver = user.getId();
		String kind = "inMail";
		int currentPage = page != null ? page : 1;
		int listCount = mService.getListCount(receiver, kind);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		
		ArrayList<Email> inList = mService.selectInList(receiver, kind, pi);
		
		if(inList != null) {
			req.setAttribute("inList", inList);
		} else {
			throw new commonException("받은 메일함 로드 실패! 잠시후 다시 시도해주세요.");
		}
		return "mail/mailInbox";
	}
	@RequestMapping("sendbox.ap")
	public String goSendbox(HttpServletRequest req, @RequestParam(name="page", required=false)Integer page) {
		
		Employee user = (Employee)req.getSession().getAttribute("loginUser");
		String receiver = user.getId();
		String kind = "send";
		int currentPage = page != null ? page : 1;
		int listCount = mService.getListCount(receiver, kind);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		
		ArrayList<Email> sendList = mService.selectInList(receiver, kind, pi);
		if(sendList != null) {
			req.setAttribute("sendList", sendList);
		} else {
			throw new commonException("보낸 메일함 로드 실패! 잠시후 다시 시도해주세요.");
		}
		return "mail/mailSendbox";
	}
	@RequestMapping("importantbox.ap")
	public String goImportantbox(HttpServletRequest req, @RequestParam(name="page", required=false)Integer page) {
		
		Employee user = (Employee)req.getSession().getAttribute("loginUser");
		String receiver = user.getId();
		String kind = "important";
		int currentPage = page != null ? page : 1;
		int listCount = mService.getListCount(receiver, kind);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		
		ArrayList<Email> iList = mService.selectInList(receiver, kind, pi);
		
		if(iList != null) {
			req.setAttribute("iList", iList);
		} else {
			throw new commonException("중요 메일함 로드 실패! 잠시후 다시 시도해주세요.");
		}
		
		return "mail/mailImportantbox";
	}
	@RequestMapping("temporarybox.ap")
	public String goTemporarybo(HttpServletRequest req, @RequestParam(name="page", required=false)Integer page) {
		Employee user = (Employee)req.getSession().getAttribute("loginUser");
		String receiver = user.getId();
		String kind = "temporary";
		int currentPage = page != null ? page : 1;
		int listCount = mService.getListCount(receiver, kind);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		
		ArrayList<Email> temList = mService.selectInList(receiver, kind, pi);
		
		if(temList != null) {
			req.setAttribute("temList", temList);
		} else {
			throw new commonException("임시보관함 로드 실패! 잠시후 다시 시도해주세요.");
		}
		
		return "mail/mailTemporarybox";
	}
	@RequestMapping("wastebox.ap")
	public String goWastebox(HttpServletRequest req, @RequestParam(name="page", required=false)Integer page) {
		Employee user = (Employee)req.getSession().getAttribute("loginUser");
		String receiver = user.getId();
		String kind = "waste";
		int currentPage = page != null ? page : 1;
		int listCount = mService.getListCount(receiver, kind);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5, 10);
		
		ArrayList<Email> wList = mService.selectInList(receiver, kind, pi);
		
		if(wList != null) {
			req.setAttribute("wList", wList);
		} else {
			throw new commonException("휴지통 로드 실패! 잠시후 다시 시도해주세요.");
		}
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
		
		return null;
	}
	@RequestMapping("openemp.ap")
	@ResponseBody
	public String openEmp() {
		
		ArrayList<Employee> eList = eService.selectEmpList();
		System.out.println(eList);
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(eList);
	}
}
