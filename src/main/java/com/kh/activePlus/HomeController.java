package com.kh.activePlus;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.activePlus.common.attachment.Attachment;
import com.kh.activePlus.employee.model.service.EmployeeService;
import com.kh.activePlus.employee.model.vo.Employee;
import com.kh.activePlus.employee.model.vo.TNA;

/**
 * Handles requests for the application home page.
 */
@SessionAttributes("tid")
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private EmployeeService eService;

	@RequestMapping(value = "/main.ap", method = RequestMethod.GET)
	public String home(Locale locale, Model model, @SessionAttribute("loginUser") Employee e) {
		// 메일, 게시판 select
		String empId = "";

		if (e != null)
			empId = e.getId();

		// 출퇴근 확인
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(d);
		String tnaDay = null;
		// 출-퇴근 확인
		ArrayList<TNA> tList = eService.selectTNA(empId);


		Attachment at = eService.selectImg(empId);
		String photo = "resources\\uploadFiles\\employee\\"+at.getRenameFile();

		if (tList != null && !tList.isEmpty()) {
			tnaDay = sdf.format(tList.get(0).getStartDate());
			// System.out.println("확인 : " + tnaDay.equals(today));
			// System.out.println("퇴근 시간 : "+tList.get(0).getLeaveDate());
			if (today.equals(tnaDay)) {
				model.addAttribute("TNA", tList);
				model.addAttribute("tid",tList.get(0).getTid());
				if (tList.get(0).getLeaveDate() == null) {
					// 출근 후 퇴근하지 않았을 경우
					model.addAttribute("Tmsg", "WORK");
				} else {
					// 출퇴근 모두 했을 경우
					model.addAttribute("Tmsg", "END");
					
				}
			}
		}

		HashMap<String, ArrayList> mainList = new HashMap<>();
		mainList = eService.selectMainList(empId);
		
		model.addAttribute("img",photo);
		model.addAttribute("mList", mainList.get("mList"));
		model.addAttribute("nList", mainList.get("nList"));
		model.addAttribute("hbList", mainList.get("hbList"));

		return "main/main";
	}

}
