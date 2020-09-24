package com.kh.activePlus.task;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TaskController {
	
	@RequestMapping("diagnosisList.ap")
	public String GoDianosisList() {
		return "task/diagnosisList";
	}
	@RequestMapping("DiagDetail.ap")
	public String goDaigDetail() {
		return "task/diagnosisDetail";
	}
}
