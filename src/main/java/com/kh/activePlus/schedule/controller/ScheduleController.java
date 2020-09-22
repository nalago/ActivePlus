package com.kh.activePlus.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.activePlus.Employee.model.vo.Employee;

@SessionAttributes("loginUser")
@Controller
public class ScheduleController {
	
	@RequestMapping("calendar.ap")
	public String selectCalendar(Model model) {
		
		
		
		return "schedule/calendar";
	}
}
