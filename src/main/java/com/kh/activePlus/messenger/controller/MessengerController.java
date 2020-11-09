package com.kh.activePlus.messenger.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.activePlus.messenger.model.service.MessengerService;
import com.kh.activePlus.messenger.model.vo.Emergency;

@Controller
public class MessengerController {
	@Autowired
	private MessengerService mesService;
	
	
	@RequestMapping("messenger.ap")
	public String goMessenger() {
		
		return "messenger/messengerView";
	}
	
	@RequestMapping("emergency.ap")
	public String goEmergency() {
		
		return "messenger/emergencyView";
	}
	
	@RequestMapping("emergencyCall.ap")
	@ResponseBody
	public String emergencyCall(String writer, String code, String location, String message) {
		Emergency em = new Emergency();
		em.setCode(code);
		em.setWriter(writer);
		em.setLocation(location);
		System.out.println(em);
		int result = mesService.emergencyCall(em); 
		if(result > 0)
			return "success";
		else 
			return "failed";
	}
}
