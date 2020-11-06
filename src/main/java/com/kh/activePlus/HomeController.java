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
@SessionAttributes("loginUser")
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	
	@RequestMapping(value = "/main.ap", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		
		/*Employee user = new Employee("100215","11234","최나라","의료");
		
		model.addAttribute("loginUser", user);*/
		
		return "main/main";
	}
	
}
