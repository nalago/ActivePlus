package com.kh.activePlus.messenger.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessengerController {
	
	@RequestMapping("messenger.ap")
	public String goMessenger() {
		
		return "messenger/messengerView";
	}
	
	@RequestMapping("emergency.ap")
	public String goEmergency() {
		
		return "messenger/emergencyView";
	}
}
