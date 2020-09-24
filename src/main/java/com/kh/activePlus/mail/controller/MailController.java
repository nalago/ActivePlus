package com.kh.activePlus.mail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailController {
	
	@RequestMapping("mail.ap")
	public String goMail() {
		
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
}
