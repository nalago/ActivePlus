package com.kh.activePlus;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.activePlus.employee.model.vo.Employee;

/**
 * Handles requests for the application home page.
 */
@SessionAttributes({"loginUser", "msg"})
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/*
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

		if (tList != null) {
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

		model.addAttribute("mList", mainList.get("mList"));
		model.addAttribute("nList", mainList.get("nList"));
		model.addAttribute("hbList", mainList.get("hbList"));

	public String home(Locale locale, Model model) {


		
 ployee loginUser = eService.loginEmployee

		/*Employee user = new Employee("100215","11234","최나라","의료");

		
		model.addAttribute("loginUser", user);*/
		
		return "main/main";
	}*/
	
}
